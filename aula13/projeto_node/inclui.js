// inclui.js
 
const express = require("express");
const mysql = require("mysql2");
 
const app = express();
app.use(express.json());
 
// Criar conexão com o banco de dados Mysql
 
const connection = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"",
    database:"biblioteca"
});
 
// Incluindo um registro
function inserirCategoria(descricao) {
const sql = "INSERT INTO categorias (descricao_categoria) values (?)";
connection.query(sql, [descricao], (err, result) => {
  if (err) {
    console.error('Erro ao inserir:', err);
    return;
  }
  console.log('Categoria inserida com sucesso!');
  console.log('ID Inserido:', result.insertID);
 
});
 
}
// Chamada da Função
inserirCategoria('Abobrinha');