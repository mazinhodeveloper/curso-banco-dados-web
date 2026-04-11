const mysql = require('mysql2');
require('dotenv').config();

const pool = mysql.createPool({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASS || '',
    database: process.env.DB_NAME || 'clientes_db',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

const getConnection = (callback) => {
    pool.getConnection(callback);
};

module.exports = { getConnection, pool };