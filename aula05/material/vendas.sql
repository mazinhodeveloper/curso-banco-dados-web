-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/02/2026 às 14:01
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
-- Banco de dados: `vendas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedidos`
--

CREATE TABLE `itens_pedidos` (
  `id_item` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens_pedidos`
--

INSERT INTO `itens_pedidos` (`id_item`, `id_pedido`, `id_produto`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 1, 1, 4500.00),
(2, 1, 2, 2, 120.00),
(3, 1, 16, 3, 60.00),
(4, 2, 3, 1, 350.00),
(5, 2, 4, 2, 900.00),
(6, 2, 5, 1, 400.00),
(7, 3, 6, 1, 750.00),
(8, 3, 7, 2, 250.00),
(9, 3, 8, 1, 300.00),
(10, 4, 9, 1, 1200.00),
(11, 4, 10, 1, 800.00),
(12, 4, 2, 1, 120.00),
(13, 5, 11, 1, 2800.00),
(14, 5, 12, 2, 90.00),
(15, 5, 16, 5, 60.00),
(16, 6, 13, 1, 2200.00),
(17, 6, 14, 1, 3200.00),
(18, 6, 15, 1, 1100.00),
(19, 7, 17, 2, 450.00),
(20, 7, 18, 1, 380.00),
(21, 7, 19, 1, 250.00),
(22, 8, 20, 1, 300.00),
(23, 8, 1, 1, 4500.00),
(24, 8, 2, 1, 120.00),
(25, 9, 3, 2, 350.00),
(26, 9, 4, 1, 900.00),
(27, 9, 5, 2, 400.00),
(28, 10, 6, 1, 750.00),
(29, 10, 7, 1, 250.00),
(30, 10, 8, 2, 300.00),
(31, 11, 9, 1, 1200.00),
(32, 11, 10, 1, 800.00),
(33, 11, 11, 1, 2800.00),
(34, 12, 12, 3, 90.00),
(35, 12, 13, 1, 2200.00),
(36, 12, 16, 2, 60.00),
(37, 13, 17, 1, 450.00),
(38, 13, 18, 2, 380.00),
(39, 13, 19, 1, 250.00),
(40, 14, 20, 1, 300.00),
(41, 14, 1, 1, 4500.00),
(42, 14, 3, 1, 350.00),
(43, 15, 4, 1, 900.00),
(44, 15, 5, 1, 400.00),
(45, 15, 6, 1, 750.00),
(46, 2, 8, 1, 300.00),
(47, 3, 2, 3, 120.00),
(48, 5, 18, 1, 380.00),
(49, 7, 12, 2, 90.00),
(50, 9, 16, 4, 60.00),
(51, 10, 15, 1, 1100.00),
(52, 11, 17, 1, 450.00),
(53, 12, 2, 2, 120.00),
(54, 13, 5, 1, 400.00),
(55, 14, 7, 1, 250.00),
(56, 15, 11, 1, 2800.00),
(57, 1, 18, 1, 380.00),
(58, 6, 2, 1, 120.00),
(59, 8, 12, 3, 90.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `cliente_nome` varchar(100) NOT NULL,
  `data_pedido` datetime DEFAULT current_timestamp(),
  `status` varchar(30) DEFAULT 'Pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `cliente_nome`, `data_pedido`, `status`) VALUES
(1, 'Carlos Silva', '2026-02-14 09:56:52', 'Entregue'),
(2, 'Maria Souza', '2026-02-14 09:56:52', 'Entregue'),
(3, 'João Lima', '2026-02-14 09:56:52', 'Pendente'),
(4, 'Ana Costa', '2026-02-14 09:56:52', 'Cancelado'),
(5, 'Fernanda Alves', '2026-02-14 09:56:52', 'Entregue'),
(6, 'Ricardo Mendes', '2026-02-14 09:56:52', 'Pendente'),
(7, 'Juliana Rocha', '2026-02-14 09:56:52', 'Entregue'),
(8, 'Paulo Santos', '2026-02-14 09:56:52', 'Entregue'),
(9, 'Beatriz Oliveira', '2026-02-14 09:56:52', 'Pendente'),
(10, 'Rafael Martins', '2026-02-14 09:56:52', 'Entregue'),
(11, 'Camila Ferreira', '2026-02-14 09:56:52', 'Entregue'),
(12, 'Eduardo Gomes', '2026-02-14 09:56:52', 'Entregue'),
(13, 'Patrícia Lima', '2026-02-14 09:56:52', 'Pendente'),
(14, 'Marcelo Costa', '2026-02-14 09:56:52', 'Entregue'),
(15, 'Luciana Ribeiro', '2026-02-14 09:56:52', 'Entregue');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome_produto`, `categoria`, `preco`, `estoque`, `ativo`) VALUES
(1, 'Notebook Dell', 'Informática', 4500.00, 10, 1),
(2, 'Mouse Logitech', 'Informática', 120.00, 50, 1),
(3, 'Teclado Mecânico', 'Informática', 350.00, 30, 1),
(4, 'Monitor 24\"', 'Informática', 900.00, 15, 1),
(5, 'HD Externo 1TB', 'Informática', 400.00, 20, 1),
(6, 'Impressora HP', 'Informática', 750.00, 12, 1),
(7, 'Webcam Full HD', 'Informática', 250.00, 25, 1),
(8, 'Headset Gamer', 'Informática', 300.00, 18, 1),
(9, 'Cadeira Gamer', 'Móveis', 1200.00, 8, 1),
(10, 'Mesa Escritório', 'Móveis', 800.00, 10, 1),
(11, 'Smartphone Samsung', 'Telefonia', 2800.00, 14, 1),
(12, 'Carregador USB-C', 'Telefonia', 90.00, 60, 1),
(13, 'Tablet Samsung', 'Telefonia', 2200.00, 9, 1),
(14, 'Smart TV 50\"', 'Eletrônicos', 3200.00, 6, 1),
(15, 'Soundbar', 'Eletrônicos', 1100.00, 7, 1),
(16, 'Pendrive 64GB', 'Informática', 60.00, 100, 1),
(17, 'SSD 480GB', 'Informática', 450.00, 20, 1),
(18, 'Roteador Wi-Fi', 'Redes', 380.00, 15, 1),
(19, 'Switch 8 portas', 'Redes', 250.00, 12, 1),
(20, 'Estabilizador', 'Energia', 300.00, 11, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD CONSTRAINT `itens_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `itens_pedidos_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
