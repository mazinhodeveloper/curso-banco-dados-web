-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/03/2026 às 15:18
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
-- Banco de dados: `eletrocenter`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`) VALUES
(2, 'Gabinetes'),
(1, 'Impressora'),
(3, 'Memórias'),
(5, 'Monitores'),
(8, 'Mouses'),
(4, 'Smartphones'),
(6, 'SSD'),
(7, 'Teclados');

-- --------------------------------------------------------

--
-- Estrutura para tabela `centro_custo`
--

CREATE TABLE `centro_custo` (
  `id_cc` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `centro_custo`
--

INSERT INTO `centro_custo` (`id_cc`, `nome`, `ativo`) VALUES
(1, 'Matriz', 1),
(2, 'Filial 1', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_razao` varchar(120) NOT NULL,
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `dt_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  `celular` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_razao`, `cpf_cnpj`, `email`, `telefone`, `ativo`, `dt_cadastro`, `celular`) VALUES
(1, 'Senac', '11.111.111/0001-11', 'senac@senac.com.br', '(11) 2222-2222', 1, '2026-02-21 10:37:36', '11 9999-9999');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente_endereco`
--

CREATE TABLE `cliente_endereco` (
  `id_endereco` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `logradouro` varchar(120) NOT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente_endereco`
--

INSERT INTO `cliente_endereco` (`id_endereco`, `id_cliente`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `uf`, `principal`) VALUES
(1, 1, '05051-000', 'Rua Tito', '54', 'SS1', 'Vila Romana', 'São Paulo', 'SP', 1),
(2, 1, '05053-041', 'Av.Pompeia', '600', 'Sala 2', 'Lapa', 'São Paulo', 'SP', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_pagar`
--

CREATE TABLE `conta_pagar` (
  `id_cp` int(11) NOT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `id_plano` int(11) NOT NULL,
  `id_cc` int(11) DEFAULT NULL,
  `data_lancamento` date NOT NULL,
  `data_vencimento` date NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('ABERTA','PAGA','ATRASADA') NOT NULL DEFAULT 'ABERTA',
  `data_pagamento` date DEFAULT NULL,
  `valor_pago` decimal(10,2) DEFAULT 0.00,
  `observacao` varchar(150) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `conta_pagar`
--

INSERT INTO `conta_pagar` (`id_cp`, `id_fornecedor`, `id_plano`, `id_cc`, `data_lancamento`, `data_vencimento`, `valor`, `status`, `data_pagamento`, `valor_pago`, `observacao`) VALUES
(1, 1, 3, 1, '2026-03-14', '2026-03-31', 2000.00, 'ABERTA', NULL, 0.00, 'Compra de 5 gabinetes conforme NF. 987');

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta_receber`
--

CREATE TABLE `conta_receber` (
  `id_cr` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_geracao` date NOT NULL,
  `valor_total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` enum('ABERTO','PARCIAL','PAGO') NOT NULL DEFAULT 'ABERTO'
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cr_parcela`
--

CREATE TABLE `cr_parcela` (
  `id_parcela` int(11) NOT NULL,
  `id_cr` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `data_vencimento` date NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('ABERTA','PAGA','ATRASADA') NOT NULL DEFAULT 'ABERTA',
  `data_pagamento` date DEFAULT NULL,
  `valor_pago` decimal(10,2) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `razao_social`, `cnpj`, `email`, `telefone`, `ativo`) VALUES
(1, 'Gabinet Ltda', '33.333.333/0001-11', 'sac@gabinet.com.br', '(11) 99999-9999', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mov_estoque`
--

CREATE TABLE `mov_estoque` (
  `id_mov` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo` enum('ENTRADA','SAIDA') NOT NULL,
  `origem` enum('VENDA','COMPRA','AJUSTE') DEFAULT NULL,
  `data_mov` datetime NOT NULL DEFAULT current_timestamp(),
  `quantidade` int(11) NOT NULL,
  `custo_unitario` decimal(12,2) NOT NULL DEFAULT 0.00,
  `observacao` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data_pedido` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('RASCUNHO','CONFIRMADO','FATURADO','CANCELADO') DEFAULT NULL,
  `subtotal` decimal(12,2) NOT NULL DEFAULT 0.00,
  `desconto` decimal(12,2) NOT NULL DEFAULT 0.00,
  `frete` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_item`
--

CREATE TABLE `pedido_item` (
  `id_item` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` decimal(12,2) NOT NULL DEFAULT 0.00,
  `desconto_item` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_item` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nome`, `descricao`, `ativo`) VALUES
(1, 'Administrador', 'gerencia usuários, perfis, cadastros e regras.', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `plano_contas`
--

CREATE TABLE `plano_contas` (
  `id_plano` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `tipo` enum('RECEITA','DESPESA') NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `plano_contas`
--

INSERT INTO `plano_contas` (`id_plano`, `nome`, `tipo`, `ativo`) VALUES
(1, 'Vendas no balcão', 'RECEITA', 1),
(2, 'Compra de produtos', 'DESPESA', 1),
(3, 'Compras', 'DESPESA', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` text DEFAULT NULL,
  `custo` decimal(12,2) NOT NULL DEFAULT 0.00,
  `preco` decimal(12,2) NOT NULL DEFAULT 0.00,
  `estoque` int(11) NOT NULL DEFAULT 0,
  `estoque_minimo` int(11) NOT NULL DEFAULT 0,
  `estoque_maximo` int(11) NOT NULL DEFAULT 0,
  `unidade` varchar(15) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `id_categoria`, `id_fornecedor`, `nome`, `descricao`, `custo`, `preco`, `estoque`, `estoque_minimo`, `estoque_maximo`, `unidade`, `ativo`) VALUES
(2, 2, 1, 'Gabinete ATX 1050 - Teste', 'teste', 300.00, 500.00, 10, 2, 15, 'Peça', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `dt_cadastro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_perfil`, `nome`, `email`, `senha_hash`, `ativo`, `dt_cadastro`) VALUES
(1, 1, 'José da Silva', 'js@hotmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '2026-02-21 10:02:26'),
(2, 1, 'Celso', 'celso@senac.com.br', '$2y$10$fVZkYagFoiLiMf.gNqBKQOPBIby6QbQEKWuaN7etTeiI5z/f3aCMa', 1, '2026-03-07 08:04:02');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwproduto`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwproduto` (
`nome_produto` varchar(60)
,`nome_categoria` varchar(80)
,`razao_social` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura para view `vwproduto`
--
DROP TABLE IF EXISTS `vwproduto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwproduto`  AS SELECT `produto`.`nome` AS `nome_produto`, `categoria`.`nome` AS `nome_categoria`, `fornecedor`.`razao_social` AS `razao_social` FROM ((`produto` join `categoria` on(`produto`.`id_categoria` = `categoria`.`id_categoria`)) join `fornecedor` on(`produto`.`id_fornecedor` = `fornecedor`.`id_fornecedor`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `uk_categoria_nome` (`nome`);

--
-- Índices de tabela `centro_custo`
--
ALTER TABLE `centro_custo`
  ADD PRIMARY KEY (`id_cc`),
  ADD UNIQUE KEY `uk_cc_nome` (`nome`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `uk_cliente_cpf_cnpj` (`cpf_cnpj`),
  ADD KEY `idx_cliente_nome` (`nome_razao`);

--
-- Índices de tabela `cliente_endereco`
--
ALTER TABLE `cliente_endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `idx_endereco_clientes` (`id_cliente`),
  ADD KEY `idx_endereco_cidade_uf` (`cidade`,`uf`);

--
-- Índices de tabela `conta_pagar`
--
ALTER TABLE `conta_pagar`
  ADD PRIMARY KEY (`id_cp`),
  ADD KEY `idx_cp_fornecedor` (`id_fornecedor`),
  ADD KEY `idx_cp_plano` (`id_plano`),
  ADD KEY `idx_cp_cc` (`id_cc`),
  ADD KEY `idx_cp_venc` (`data_vencimento`);

--
-- Índices de tabela `conta_receber`
--
ALTER TABLE `conta_receber`
  ADD PRIMARY KEY (`id_cr`),
  ADD UNIQUE KEY `uk_cr_pedido` (`id_pedido`),
  ADD KEY `idx_cr_cliente` (`id_cliente`),
  ADD KEY `idx_cr_data` (`data_geracao`);

--
-- Índices de tabela `cr_parcela`
--
ALTER TABLE `cr_parcela`
  ADD PRIMARY KEY (`id_parcela`),
  ADD UNIQUE KEY `uk_parcela_cr_numero` (`id_cr`,`numero`),
  ADD KEY `idx_parcela_venc` (`data_vencimento`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD UNIQUE KEY `uk_fornecedor_cnpj` (`cnpj`),
  ADD KEY `idx_fornecedor_nome` (`razao_social`);

--
-- Índices de tabela `mov_estoque`
--
ALTER TABLE `mov_estoque`
  ADD PRIMARY KEY (`id_mov`),
  ADD KEY `fk_mov_produto` (`id_produto`),
  ADD KEY `fk_mov_usuario` (`id_usuario`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedido_cliente` (`id_cliente`),
  ADD KEY `fk_pedido_usuario` (`id_usuario`);

--
-- Índices de tabela `pedido_item`
--
ALTER TABLE `pedido_item`
  ADD PRIMARY KEY (`id_item`),
  ADD UNIQUE KEY `uk_item_pedido_produto` (`id_pedido`,`id_produto`),
  ADD KEY `fk_item_produto` (`id_produto`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD UNIQUE KEY `uk_perfil_nome` (`nome`);

--
-- Índices de tabela `plano_contas`
--
ALTER TABLE `plano_contas`
  ADD PRIMARY KEY (`id_plano`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `idx_produto_categoria` (`id_categoria`),
  ADD KEY `idx_produto_nome` (`nome`),
  ADD KEY `fk_produto_fornecedor` (`id_fornecedor`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `uk_usuario_email` (`email`),
  ADD KEY `idx_usuario_perfil` (`id_perfil`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `centro_custo`
--
ALTER TABLE `centro_custo`
  MODIFY `id_cc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cliente_endereco`
--
ALTER TABLE `cliente_endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `conta_pagar`
--
ALTER TABLE `conta_pagar`
  MODIFY `id_cp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta_receber`
--
ALTER TABLE `conta_receber`
  MODIFY `id_cr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cr_parcela`
--
ALTER TABLE `cr_parcela`
  MODIFY `id_parcela` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `mov_estoque`
--
ALTER TABLE `mov_estoque`
  MODIFY `id_mov` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido_item`
--
ALTER TABLE `pedido_item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `plano_contas`
--
ALTER TABLE `plano_contas`
  MODIFY `id_plano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cliente_endereco`
--
ALTER TABLE `cliente_endereco`
  ADD CONSTRAINT `fk_endereco_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `conta_pagar`
--
ALTER TABLE `conta_pagar`
  ADD CONSTRAINT `fk_cp_cc` FOREIGN KEY (`id_cc`) REFERENCES `centro_custo` (`id_cc`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cp_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cp_plano` FOREIGN KEY (`id_plano`) REFERENCES `plano_contas` (`id_plano`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `conta_receber`
--
ALTER TABLE `conta_receber`
  ADD CONSTRAINT `fk_cr_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `cr_parcela`
--
ALTER TABLE `cr_parcela`
  ADD CONSTRAINT `fk_parcela_cr` FOREIGN KEY (`id_cr`) REFERENCES `conta_receber` (`id_cr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `mov_estoque`
--
ALTER TABLE `mov_estoque`
  ADD CONSTRAINT `fk_mov_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mov_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `pedido_item`
--
ALTER TABLE `pedido_item`
  ADD CONSTRAINT `fk_item_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produto_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`);

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
