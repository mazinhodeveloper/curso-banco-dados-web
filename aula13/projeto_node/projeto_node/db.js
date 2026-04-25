const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'biblioteca'
});

connection.connect(err => {
    if (err) {
        console.error('Erro ao conectar no banco:', err);
        return;
    }
    console.log('Banco de dados conectado');
});

module.exports = connection;