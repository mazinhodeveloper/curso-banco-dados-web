const express = require("express");
const cors = require("cors");
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const db = require("./db");

const app = express();
app.use(express.json());
app.use(cors()); // Permitir requests do frontend
app.use(express.static('.')); // Servir arquivos estáticos (HTML, CSS, JS)

// JWT Secret (use env var em produção)
const JWT_SECRET = 'super-secret-key-projeto-node-2024';

// Conexão com DB já testada no db.js

// === ROTAS AUTENTICAÇÃO ===
app.post('/register', (req, res) => {
    const { username, email, password } = req.body;
    
    if (!username || !email || !password) {
        return res.status(400).json({ erro: 'Todos os campos são obrigatórios' });
    }
    
    bcrypt.hash(password, 10, (err, hash) => {
        if (err) {
            return res.status(500).json({ erro: 'Erro ao criptografar senha' });
        }
        
        const sql = 'INSERT INTO users (username, email, password) VALUES (?, ?, ?)';
        db.query(sql, [username, email, hash], (err, result) => {
            if (err) {
                console.error('Erro register:', err);
                if (err.code === 'ER_DUP_ENTRY') {
                    return res.status(409).json({ erro: 'Usuário ou email já cadastrado' });
                }
                return res.status(500).json({ erro: 'Erro no servidor' });
            }
            res.status(201).json({ mensagem: 'Usuário cadastrado com sucesso!' });
        });
    });
});

app.post('/login', (req, res) => {
    const { username, password } = req.body;
    
    const sql = 'SELECT * FROM users WHERE username = ?';
    db.query(sql, [username], (err, results) => {
        if (err || results.length === 0) {
            return res.status(401).json({ erro: 'Credenciais inválidas' });
        }
        
        const user = results[0];
        bcrypt.compare(password, user.password, (err, match) => {
            if (err || !match) {
                return res.status(401).json({ erro: 'Credenciais inválidas' });
            }
            
            const token = jwt.sign(
                { id: user.id, username: user.username },
                JWT_SECRET,
                { expiresIn: '7d' }
            );
            
            res.json({ 
                token, 
                username: user.username,
                mensagem: 'Login realizado com sucesso!'
            });
        });
    });
});

// Middleware auth JWT
const authMiddleware = (req, res, next) => {
    const token = req.headers['authorization']?.replace('Bearer ', '') || req.query.token;
    
    if (!token) {
        return res.status(401).json({ erro: 'Token não fornecido' });
    }
    
    jwt.verify(token, JWT_SECRET, (err, decoded) => {
        if (err) {
            return res.status(401).json({ erro: 'Token inválido ou expirado' });
        }
        req.user = decoded;
        next();
    });
};

// === ROTAS CATEGORIAS ===
app.get("/categorias", authMiddleware, (req, res) => {
    const sql = "SELECT id_categoria, descricao_categoria FROM categorias ORDER BY descricao_categoria";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Erro na consulta categorias:", err);
            return res.status(500).json({ erro: "Erro no servidor" });
        }
        res.json(results);
    });
});

// === ROTAS CLIENTES CRUD ===

// GET /clientes - Listar todos
app.get("/clientes", authMiddleware, (req, res) => {
    const sql = "SELECT * FROM clientes ORDER BY id DESC";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Erro listar clientes:", err);
            return res.status(500).json({ erro: "Erro no servidor" });
        }
        res.json(results);
    });
});

// GET /clientes/:id
app.get("/clientes/:id", authMiddleware, (req, res) => {
    const sql = "SELECT * FROM clientes WHERE id = ?";
    db.query(sql, [req.params.id], (err, results) => {
        if (err) {
            console.error("Erro buscar cliente:", err);
            return res.status(500).json({ erro: "Erro no servidor" });
        }
        if (results.length === 0) {
            return res.status(404).json({ erro: "Cliente não encontrado" });
        }
        res.json(results[0]);
    });
});

// POST /clientes - Criar novo
app.post("/clientes", authMiddleware, (req, res) => {
    const { razao_social, cnpj, cep, logradouro, numero, complemento, bairro, cidade, uf, celular, email } = req.body;
    
    const sql = `INSERT INTO clientes (razao_social, cnpj, cep, logradouro, numero, complemento, bairro, cidade, uf, celular, email) 
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    
    db.query(sql, [razao_social, cnpj, cep, logradouro, numero, complemento || null, bairro, cidade, uf, celular, email], (err, result) => {
        if (err) {
            console.error("Erro inserir cliente:", err);
            // Handle unique constraint
            if (err.code === 'ER_DUP_ENTRY') {
                return res.status(409).json({ erro: "CNPJ ou email já cadastrado" });
            }
            return res.status(500).json({ erro: "Erro no servidor" });
        }
        res.status(201).json({ 
            id: result.insertId, 
            mensagem: "Cliente cadastrado com sucesso!" 
        });
    });
});

// PUT /clientes/:id - Atualizar
app.put("/clientes/:id", authMiddleware, (req, res) => {
    const { razao_social, cnpj, cep, logradouro, numero, complemento, bairro, cidade, uf, celular, email } = req.body;
    
    const sql = `UPDATE clientes SET razao_social=?, cnpj=?, cep=?, logradouro=?, numero=?, complemento=?, bairro=?, cidade=?, uf=?, celular=?, email=? 
                 WHERE id = ?`;
    
    db.query(sql, [razao_social, cnpj, cep, logradouro, numero, complemento || null, bairro, cidade, uf, celular, email, req.params.id], (err, result) => {
        if (err) {
            console.error("Erro atualizar cliente:", err);
            return res.status(500).json({ erro: "Erro no servidor" });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ erro: "Cliente não encontrado" });
        }
        res.json({ mensagem: "Cliente atualizado com sucesso!" });
    });
});

// DELETE /clientes/:id
app.delete("/clientes/:id", authMiddleware, (req, res) => {
    const sql = "DELETE FROM clientes WHERE id = ?";
    db.query(sql, [req.params.id], (err, result) => {
        if (err) {
            console.error("Erro deletar cliente:", err);
            return res.status(500).json({ erro: "Erro no servidor" });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ erro: "Cliente não encontrado" });
        }
        res.json({ mensagem: "Cliente deletado com sucesso!" });
    });
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
    console.log(`Endpoints disponíveis:`);
    console.log(`  GET    /clientes`);
    console.log(`  GET    /clientes/:id`);
    console.log(`  POST   /clientes`);
    console.log(`  PUT    /clientes/:id`);
    console.log(`  DELETE /clientes/:id`);
});

