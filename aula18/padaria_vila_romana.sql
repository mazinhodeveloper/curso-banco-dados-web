-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/06/2026 às 13:55
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

-- Banco de dados: `padaria_vila_romana`

-- Estrutura para tabela `categorias`
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `categorias`
INSERT INTO `categorias` (`id`, `descricao`) VALUES
(1, 'Farinhas'),
(2, 'Laticínios'),
(3, 'Bebidas'),
(4, 'Padaria'),
(5, 'Confeitaria');

-- Estrutura para tabela `fornecedores`
CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `fornecedores`
INSERT INTO `fornecedores` (`id`, `nome`, `email`, `celular`) VALUES
(1, 'Distribuidora São Paulo', 'contato@dsp.com.br', '11999998888'),
(2, 'Alimentos Brasil', 'vendas@ab.com.br', '11988887777'),
(3, 'Moinho Paulista', 'contato@moinhopaulista.com.br', '11987654321'),
(4, 'Laticínios Vale do Leite', 'vendas@valedoleite.com.br', '11976543210'),
(5, 'Distribuidora Bom Preço', 'comercial@bompreco.com.br', '11965432109');

-- Estrutura para tabela `itens_notas_fiscais`
CREATE TABLE `itens_notas_fiscais` (
  `id` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `itens_notas_fiscais`
INSERT INTO `itens_notas_fiscais` (`id`, `id_nota`, `id_produto`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 1, 10, 118.00),
(2, 1, 2, 50, 5.20),
(3, 2, 4, 20, 18.50),
(4, 2, 5, 15, 24.90),
(5, 3, 6, 50, 3.50),
(6, 3, 7, 5, 189.90),
(7, 4, 8, 30, 8.50),
(8, 4, 9, 12, 29.90),
(9, 4, 10, 24, 7.50),
(10, 5, 11, 20, 4.20),
(11, 5, 12, 10, 18.90),
(12, 6, 13, 15, 22.50),
(13, 6, 14, 8, 12.90),
(14, 6, 15, 6, 19.90);

-- Estrutura para tabela `notas_fiscais`
CREATE TABLE `notas_fiscais` (
  `id` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `numero_nota_fiscal` varchar(20) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `notas_fiscais`
INSERT INTO `notas_fiscais` (`id`, `id_fornecedor`, `numero_nota_fiscal`, `data`) VALUES
(1, 1, 'NF2026000', '2026-06-20'),
(2, 3, 'NF2026001', '2026-06-01'),
(3, 4, 'NF2026002', '2026-06-05'),
(4, 5, 'NF2026003', '2026-06-10'),
(5, 3, 'NF2026004', '2026-06-15'),
(6, 4, 'NF2026005', '2026-06-20');

-- Estrutura para tabela `produtos`
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `descricao_produto` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `produtos`
INSERT INTO `produtos` (`id`, `descricao_produto`, `id_categoria`, `preco_unitario`) VALUES
(1, 'Farinha de Trigo 25kg', 1, 120.00),
(2, 'Leite Integral 1L', 2, 5.50),
(3, 'Refrigerante Cola 2L', 3, 9.90),
(4, 'Fermento Biológico 500g', 4, 18.50),
(5, 'Açúcar Refinado 5kg', 4, 24.90),
(6, 'Sal Refinado 1kg', 4, 3.50),
(7, 'Margarina 15kg', 4, 189.90),
(8, 'Óleo de Soja 900ml', 4, 8.50),
(9, 'Chocolate em Pó 1kg', 5, 29.90),
(10, 'Leite Condensado 395g', 5, 7.50),
(11, 'Creme de Leite 200g', 5, 4.20),
(12, 'Granulado Chocolate 1kg', 5, 18.90),
(13, 'Coco Ralado 1kg', 5, 22.50),
(14, 'Essência de Baunilha 100ml', 5, 12.90),
(15, 'Doce de Leite 1kg', 5, 19.90),
(16, 'Chocolate Meio Amargo 2kg', 5, 74.90),
(17, 'Emulsificante 200g', 5, 9.90),
(18, 'Corante Alimentício Vermelho', 5, 6.50),
(19, 'Cobertura Chocolate 1kg', 5, 27.90),
(20, 'Mistura para Bolo Chocolate 5kg', 5, 54.90);

-- Índices para tabelas despejadas
-- Índices de tabela `categorias`
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

-- Índices de tabela `fornecedores`
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

-- Índices de tabela `itens_notas_fiscais`
ALTER TABLE `itens_notas_fiscais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_nota` (`id_nota`),
  ADD KEY `id_produto` (`id_produto`);

-- Índices de tabela `notas_fiscais`
ALTER TABLE `notas_fiscais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fornecedor` (`id_fornecedor`);

-- Índices de tabela `produtos`
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

-- AUTO_INCREMENT para tabelas despejadas

-- AUTO_INCREMENT de tabela `categorias`
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- AUTO_INCREMENT de tabela `fornecedores`
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

-- AUTO_INCREMENT de tabela `itens_notas_fiscais`
ALTER TABLE `itens_notas_fiscais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

-- AUTO_INCREMENT de tabela `notas_fiscais`
ALTER TABLE `notas_fiscais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- AUTO_INCREMENT de tabela `produtos`
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

-- Restrições para tabelas despejadas
-- Restrições para tabelas `itens_notas_fiscais`
ALTER TABLE `itens_notas_fiscais`
  ADD CONSTRAINT `itens_notas_fiscais_ibfk_1` FOREIGN KEY (`id_nota`) REFERENCES `notas_fiscais` (`id`),
  ADD CONSTRAINT `itens_notas_fiscais_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`);

-- Restrições para tabelas `notas_fiscais`
ALTER TABLE `notas_fiscais`
  ADD CONSTRAINT `notas_fiscais_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id`);

-- Restrições para tabelas `produtos`
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
