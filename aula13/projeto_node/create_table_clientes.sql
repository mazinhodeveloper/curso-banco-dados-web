-- Script para criar tabela clientes no MySQL
-- Database: biblioteca
-- Execute: mysql -u root -p biblioteca < create_table_clientes.sql

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE clientes (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  razao_social VARCHAR(120) NOT NULL,
  cnpj VARCHAR(20) DEFAULT NULL,
  email VARCHAR(100) DEFAULT NULL,
  telefone VARCHAR(20) DEFAULT NULL,
  celular VARCHAR(20) NOT NULL,
  cep VARCHAR(9) NOT NULL,
  logradouro VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(50) DEFAULT NULL,
  bairro VARCHAR(50) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  uf CHAR(2) NOT NULL 
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_general_ci; 
