-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/04/2026 às 21:47
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `descricao_categoria` varchar(30) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `descricao_categoria`, `ativo`) VALUES
(1, 'Romance', 1),
(2, 'Ficção Cientifica', 1),
(3, 'Drama', 1),
(4, 'Aventura', 1),
(5, 'Tecnologia da Informação', 1),
(6, 'Gastronomia', 1),
(8, 'Religiões', 1),
(10, 'Matemática', 1),
(11, 'Infantil', 1),
(12, 'Informática', 1),
(14, 'Infantil', 1),
(15, 'Infantil', 1),
(16, 'Infantil', 1),
(17, 'Infantil', 1),
(18, 'Infantil', 1),
(19, 'Abobrinha', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `razao_social` varchar(255) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `razao_social`, `cnpj`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `uf`, `celular`, `email`) VALUES
(1, 'senac', '11.111.111/0001-11', '05051000', 'Rua Tito', '54', NULL, 'Vila Romana', 'São Paulo', 'SP', '(11) 99999-9999', 'celso@senac'),
(2, 'KALUNGA SA', '00.000.000/0001-00', '03040000', 'Rua Carneiro Leão', '33', 'sala. 2', 'Brás', 'São Paulo', 'SP', '(19) 99999-9999', 'luanateste@teste.com.br'),
(5, 'CARREFOUR COMERCIO E INDUSTRIA LTDA', '11.000.000/0001-00', '05051000', 'Rua Tito', '333', NULL, 'Vila Romana', 'São Paulo', 'SP', '(11) 99999-9999', 'carrefour@teste.com.br');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(80) NOT NULL,
  `senhahash` varchar(250) NOT NULL,
  `adm` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `senhahash`, `adm`) VALUES
(1, 'Celso', 'celso@senac.com.br', '123456', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_clientes_cnpj` (`cnpj`),
  ADD UNIQUE KEY `uk_clientes_email` (`email`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
