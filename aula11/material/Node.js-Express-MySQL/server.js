const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
require('dotenv').config();

const database = require('./database');
const clienteRoutes = require('./routes/clientes');

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(express.static('public'));

// Rotas
app.use('/api/clientes', clienteRoutes);

// Teste conexão banco
database.getConnection((err, connection) => {
    if (err) {
        console.error('Erro ao conectar com MySQL:', err);
        return;
    }
    console.log('✅ MySQL conectado com sucesso!');
    connection.release();
});

// Rota principal
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/index.html');
});

app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});