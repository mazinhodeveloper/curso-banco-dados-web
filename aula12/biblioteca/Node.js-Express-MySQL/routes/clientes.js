const express = require('express');
const { body, validationResult } = require('express-validator');
const { getConnection } = require('../database');
const router = express.Router();

// POST /api/clientes - Cadastrar cliente
router.post('/',
    [
        body('nome_razao').notEmpty().withMessage('Nome/Razão Social é obrigatório'),
        body('celular').notEmpty().withMessage('Celular é obrigatório'),
        body('cep').notEmpty().withMessage('CEP é obrigatório'),
        body('logradouro').notEmpty().withMessage('Logradouro é obrigatório'),
        body('numero').notEmpty().withMessage('Número é obrigatório'),
        body('complemento').notEmpty().withMessage('Complemento é obrigatório'),
        body('bairro').notEmpty().withMessage('Bairro é obrigatório'),
        body('cidade').notEmpty().withMessage('Cidade é obrigatória'),
        body('uf').notEmpty().withMessage('UF é obrigatório')
    ],
    (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({
                success: false,
                errors: errors.array()
            });
        }

        const {
            nome_razao, cpf_cnpj, email, telefone, celular,
            cep, logradouro, numero, complemento, bairro, cidade, uf
        } = req.body;

        getConnection((err, connection) => {
            if (err) {
                return res.status(500).json({
                    success: false,
                    message: 'Erro no banco de dados'
                });
            }

            const query = `
                INSERT INTO cliente (nome_razao, cpf_cnpj, email, telefone, celular, 
                                   cep, logradouro, numero, complemento, bairro, cidade, uf)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            `;

            connection.query(query, [
                nome_razao, cpf_cnpj, email, telefone, celular,
                cep, logradouro, numero, complemento, bairro, cidade, uf
            ], (err, result) => {
                connection.release();

                if (err) {
                    console.error('Erro ao salvar cliente:', err);
                    return res.status(500).json({
                        success: false,
                        message: 'Erro ao salvar cliente'
                    });
                }

                res.json({
                    success: true,
                    message: 'Cliente cadastrado com sucesso!',
                    id_cliente: result.insertId
                });
            });
        });
    }
);

// GET /api/clientes - Listar clientes 
router.get('/', (req, res) => {
    getConnection((err, connection) => {
        if (err) {
            console.error('Connection error:', err);
            return res.status(500).json({ error: 'Erro no banco' });
        }

        connection.query('SELECT * FROM cliente ORDER BY id_cliente DESC', (err, results) => {
            connection.release();  // Always release!
            if (err) {
                console.error('Query error:', err);  // Log the real SQL error
                return res.status(500).json({ error: 'Erro ao buscar clientes', details: err.message });
            }
            res.json({ success: true, clientes: results });
        });
    });
});

module.exports = router;