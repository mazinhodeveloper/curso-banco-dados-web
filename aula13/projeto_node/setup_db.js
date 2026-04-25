const fs = require('fs');
const path = require('path');
const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'biblioteca',
    multipleStatements: true
});

const clientesSQL = fs.readFileSync(path.join(__dirname, 'create_table_clientes.sql'), 'utf8');
const usersSQL = fs.readFileSync(path.join(__dirname, 'create_table_users.sql'), 'utf8');

connection.connect(err => {
    if (err) {
        console.error('Erro ao conectar:', err);
        process.exit(1);
    }
    console.log('Conectado ao MySQL');

    connection.query(clientesSQL, (err, results) => {
        if (err) {
            console.error('Erro ao criar tabela clientes:', err.message);
        } else {
            console.log('Tabela clientes criada/atualizada com sucesso!');
        }

        connection.query(usersSQL, (err2, results2) => {
            if (err2) {
                console.error('Erro ao criar tabela users:', err2.message);
            } else {
                console.log('Tabela users criada/atualizada com sucesso!');
            }
            connection.end();
            console.log('Setup completo!');
        });
    });
});

