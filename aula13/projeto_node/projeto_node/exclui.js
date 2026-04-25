// exclui.js - Módulo standalone para exclusão de cliente
// ATENÇÃO: Use apenas para testes isolados. Frontend usa server.js DELETE direto

const express = require('express');
const mysql = require('mysql2/promise');
const app = express();

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

// DELETE /clientes/:id
app.delete('/clientes/:id', async (req, res) => {
    try {
        const connection = await getConnection();
        const [result] = await connection.execute(
            'DELETE FROM clientes WHERE id = ?', 
            [req.params.id]
        );
        await connection.end();
        
        if (result.affectedRows > 0) {
            res.json({ mensagem: 'Cliente excluído com sucesso!' });
        } else {
            res.status(404).json({ erro: 'Cliente não encontrado' });
        }
    } catch (err) {
        console.error(err);
        res.status(500).json({ erro: 'Erro no servidor' });
    }
});

// Teste via navegador (GET simples)
app.get('/excluir', async (req, res) => {
    const id = req.query.id;
    if (!id) return res.send('Informe ?id=1');
    
    try {
        const connection = await getConnection();
        const [result] = await connection.execute(
            'DELETE FROM clientes WHERE id = ?', [id]
        );
        await connection.end();
        
        if (result.affectedRows > 0) {
            res.send(`Cliente #${id} excluído com sucesso!`);
        } else {
            res.status(404).send('Cliente não encontrado.');
        }
    } catch (err) {
        res.send('Erro: ' + err.message);
    }
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor EXCLUI.JS rodando em http://localhost:${PORT}`);
    console.log('Teste GET: http://localhost:3000/excluir?id=1');
    console.log('DELETE JSON: curl -X DELETE http://localhost:3000/clientes/1');
});

