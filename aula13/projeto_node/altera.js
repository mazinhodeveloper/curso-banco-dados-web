// altera.js - Módulo standalone para edição de cliente
// ATENÇÃO: Use apenas para testes isolados. CRUD principal usa server.js

const express = require('express');
const mysql = require('mysql2/promise');
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Configuração conexão (use db.js em produção)
const config = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'biblioteca' // Ajuste para seu DB
};

async function getConnection() {
    return await mysql.createConnection(config);
}

// GET /clientes/:id - Carregar dados para edição
app.get('/clientes/:id', async (req, res) => {
    try {
        const connection = await getConnection();
        const [rows] = await connection.execute(
            'SELECT * FROM clientes WHERE id = ?', 
            [req.params.id]
        );
        await connection.end();
        
        if (rows.length === 0) {
            return res.status(404).send('Cliente não encontrado.');
        }
        
        res.json(rows[0]);
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro no servidor.');
    }
});

// PUT /clientes/:id - Atualizar cliente
app.put('/clientes/:id', async (req, res) => {
    try {
        const connection = await getConnection();
        const fields = [
            req.body.razao_social, req.body.cnpj, req.body.cep, 
            req.body.logradouro, req.body.numero, req.body.complemento || null,
            req.body.bairro, req.body.cidade, req.body.uf, 
            req.body.celular, req.body.email, req.params.id
        ];
        
        const [result] = await connection.execute(
            `UPDATE clientes SET razao_social=?, cnpj=?, cep=?, logradouro=?, 
             numero=?, complemento=?, bairro=?, cidade=?, uf=?, celular=?, email=? 
             WHERE id = ?`,
            fields
        );
        await connection.end();
        
        if (result.affectedRows > 0) {
            res.json({ mensagem: 'Cliente atualizado com sucesso!' });
        } else {
            res.status(404).json({ erro: 'Cliente não encontrado' });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ erro: 'Erro no servidor' });
    }
});

// Teste simples via navegador
app.get('/editar', (req, res) => {
    const id = req.query.id;
    if (!id) return res.send('Informe ?id=1');
    res.send(`Abrir http://localhost:3000/clientes/${id} para ver dados do cliente #${id}`);
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor ALTERA.JS rodando em http://localhost:${PORT}`);
    console.log('Teste: http://localhost:3000/editar?id=1');
    console.log('Use com clientes_editar.html');
});

