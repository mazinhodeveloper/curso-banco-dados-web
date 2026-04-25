-- Script para criar tabela clientes no MySQL
-- Database: biblioteca
-- Execute: mysql -u root -p biblioteca < create_table_clientes.sql

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(255) NOT NULL,
  `cnpj` varchar(18) NOT NULL UNIQUE,
  `cep` varchar(8) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL UNIQUE,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_uf` (`uf`),
  KEY `idx_cidade` (`cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabela de clientes para cadastro via formulário HTML';

-- Inserir alguns dados de teste (opcional)
-- INSERT INTO `clientes` (`razao_social`, `cnpj`, `cep`, `logradouro`, `numero`, `bairro`, `cidade`, `uf`, `celular`, `email`) VALUES
-- ('Empresa Teste LTDA', '12.345.678/0001-99', '01001000', 'Praça da Sé', '1', 'Sé', 'São Paulo', 'SP', '(11) 99999-9999', 'teste@empresa.com');
