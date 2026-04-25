-- Execute no MySQL Workbench/phpMyAdmin
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome_razao` varchar(120) NOT NULL,
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `celular` varchar(20) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(20) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `complemento` varchar(20) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `uf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Teste insert
INSERT INTO cliente (nome_razao, celular, cep, logradouro, numero, complemento, bairro, cidade, uf) 
VALUES ('Teste AI', '(11)99999-9999', '01001-000', 'Praça da Sé', '1', '', 'Sé', 'São Paulo', 'SP');
