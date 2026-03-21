-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/03/2026 às 15:27
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
-- Banco de dados: `aula4`
--
CREATE DATABASE IF NOT EXISTS `aula4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aula4`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `nome_cliente` varchar(30) DEFAULT NULL,
  `idade` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id_livro` int(11) NOT NULL,
  `nome_livro` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `resumo` text DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `edicao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id_pessoa` int(11) NOT NULL,
  `nome_pessoa` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `mensalidade` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pessoas`
--

INSERT INTO `pessoas` (`id_pessoa`, `nome_pessoa`, `email`, `data_nascimento`, `cpf`, `altura`, `mensalidade`) VALUES
(1, 'JOSÉ MARIA', 'jm@gmail.com', '2000-10-20', '251.558.853-02', 1.7, 300.00),
(3, 'JOÃO MARCOS', 'jmarcos@gmail.com', '1995-10-20', '152.515.456-44', 1.75, 300.00),
(4, 'MARIA JOSÉ', 'maria@hotmail.com', '1980-11-26', '50.458.115-09', 1.6, 460.00),
(5, 'Roberto Carlos', 'rc@globo.com', '1940-01-01', NULL, 1.65, 3000.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id_livro`);

--
-- Índices de tabela `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id_pessoa`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id_pessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Banco de dados: `eletrocenter`
--
CREATE DATABASE IF NOT EXISTS `eletrocenter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eletrocenter`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `auditoria_log`
--

CREATE TABLE `auditoria_log` (
  `id_log` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tabela_afetada` varchar(50) NOT NULL,
  `operacao` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `id_registro` int(11) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `detalhe` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `auditoria_log`
--

INSERT INTO `auditoria_log` (`id_log`, `id_usuario`, `tabela_afetada`, `operacao`, `id_registro`, `data_hora`, `detalhe`) VALUES
(8, 1, 'cliente', 'UPDATE', 1, '2026-03-21 11:10:19', 'Cliente alterado.Razão Social: Senac Serviço Social do Comercio -> Serviços Nacional do Comercio; Telefone: (11) 2222-2222 -: (11) 99999-8888; E-mail: senac@senac.com.br -: contato@senac.com.br; Ativo: 1 -: 1'),
(9, 1, 'cliente', 'UPDATE', 1, '2026-03-21 11:13:16', 'Cliente alterado.Razão Social: Serviços Nacional do Comercio -> Serviços Nacional do Comercio; Telefone: (11) 99999-8888 -: (11) 99999-8888; E-mail: contato@senac.com.br -: contato@senac.com.br; Ativo: 1 -: 1'),
(10, 1, 'cliente', 'UPDATE', 1, '2026-03-21 11:14:23', 'Cliente alterado.Razão Social: Serviços Nacional do Comercio -> Serviços Nacional do Comercio; Celular: (11) 99999-8888 -: (11) 99999-8888; E-mail: contato@senac.com.br -: contato@senac.com.br; Ativo: 1 -: 1');

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
(2, 'Filial', 1);

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
  `dt_cadastro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_razao`, `cpf_cnpj`, `email`, `telefone`, `ativo`, `dt_cadastro`) VALUES
(1, 'Serviços Nacional do Comercio', '11.111.111/0001-11', 'contato@senac.com.br', '(11) 99999-8888', 1, '2026-02-21 10:37:38');

--
-- Acionadores `cliente`
--
DELIMITER $$
CREATE TRIGGER `trg_cliente_auditoria_update` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
	INSERT INTO auditoria_log
    (
        id_usuario,
        tabela_afetada,
        operacao,
        id_registro,
        detalhe
    )
    VALUES
    (
        COALESCE(@id_usuario_log, 1),
        'cliente',
        'UPDATE',
        NEW.id_cliente,
        CONCAT(
            'Cliente alterado.',
            'Razão Social: ', OLD.nome_razao, ' -> ', NEW.nome_razao,
            '; Celular: ', OLD.telefone, ' -: ', NEW.telefone,
            '; E-mail: ', OLD.email, ' -: ', NEW.email,
            '; Ativo: ', OLD.ativo, ' -: ', NEW.ativo
            )
    );
END
$$
DELIMITER ;

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
(2, 1, '05053-041', 'Av. Pompeia', '600', 'Sala 2', 'Lapa', 'São Paulo', 'SP', 0);

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
  `cnpj` varchar(20) NOT NULL,
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
(1, 'Administrador', 'Gerencia usuários, perfis, cadastro e regras.', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `plano_contas`
--

CREATE TABLE `plano_contas` (
  `id_plano` int(11) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
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
(1, 2, 1, 'Gabinete ATX 1050 - Teste', 'teste', 300.00, 500.00, 10, 2, 15, 'Peça', 1);

--
-- Acionadores `produto`
--
DELIMITER $$
CREATE TRIGGER `trg_produto_auditoria_update` AFTER UPDATE ON `produto` FOR EACH ROW BEGIN        
	INSERT INTO auditoria_log        
    (
		id_usuario,        
        tabela_afetada,        
        operacao,        
        id_registro,        
        detalhe        
	)        
    VALUES        
    (        
		COALESCE(@id_usuario_log, 1),        
        'produto',        
        'UPDATE',        
        NEW.id_produto,        
        CONCAT(        
			'Produto alterado.',        
            'Descrição: ', OLD.descricao, ' ->', NEW.descricao,        
			'; Preço: ', OLD.preco, ' -: ', NEW.preco,        
            '; Custo: ', OLD.custo, ' -: ', NEW.custo,        
            '; Ativo: ', OLD.ativo, ' -: ', NEW.ativo        
        )        
    );
END
$$
DELIMITER ;

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
(1, 1, 'José da Silva', 'js@hotmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '2026-02-21 10:04:34');

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
-- Estrutura stand-in para view `vw_pedido_resumo`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_pedido_resumo` (
`nome_produto` varchar(60)
,`nome_categoria` varchar(80)
,`preco` decimal(12,2)
);

-- --------------------------------------------------------

--
-- Estrutura para view `vwproduto`
--
DROP TABLE IF EXISTS `vwproduto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwproduto`  AS SELECT `produto`.`nome` AS `nome_produto`, `categoria`.`nome` AS `nome_categoria`, `fornecedor`.`razao_social` AS `razao_social` FROM ((`produto` join `categoria` on(`produto`.`id_categoria` = `categoria`.`id_categoria`)) join `fornecedor` on(`produto`.`id_fornecedor` = `fornecedor`.`id_fornecedor`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vw_pedido_resumo`
--
DROP TABLE IF EXISTS `vw_pedido_resumo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pedido_resumo`  AS SELECT `produto`.`nome` AS `nome_produto`, `categoria`.`nome` AS `nome_categoria`, `produto`.`preco` AS `preco` FROM (`produto` join `categoria` on(`produto`.`id_categoria` = `categoria`.`id_categoria`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `auditoria_log`
--
ALTER TABLE `auditoria_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `idx_log_usuario` (`id_usuario`),
  ADD KEY `idx_log_data` (`data_hora`),
  ADD KEY `idx_log_tabela` (`tabela_afetada`);

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
-- AUTO_INCREMENT de tabela `auditoria_log`
--
ALTER TABLE `auditoria_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `auditoria_log`
--
ALTER TABLE `auditoria_log`
  ADD CONSTRAINT `fk_log_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE;

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
--
-- Banco de dados: `gatilho`
--
CREATE DATABASE IF NOT EXISTS `gatilho` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gatilho`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `cidade`, `idade`) VALUES
(1, 'João Batista', 'São Paulo', 40);

--
-- Acionadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `trg_log_insercao_cliente` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN     
  INSERT INTO log_clientes (id_cliente, nome_cliente)    
  VALUES (NEW.id_cliente, NEW.nome);     
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_clientes`
--

CREATE TABLE `log_clientes` (
  `id_log` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `data_insercao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `log_clientes`
--

INSERT INTO `log_clientes` (`id_log`, `id_cliente`, `nome_cliente`, `data_insercao`) VALUES
(1, 1, 'João Batista', '2026-03-07 13:57:25');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `log_clientes`
--
ALTER TABLE `log_clientes`
  ADD PRIMARY KEY (`id_log`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `log_clientes`
--
ALTER TABLE `log_clientes`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Banco de dados: `livraria`
--
CREATE DATABASE IF NOT EXISTS `livraria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `livraria`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `cpf` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `genero` enum('M','F') NOT NULL,
  `estado` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome_cliente`, `cpf`, `email`, `genero`, `estado`) VALUES
(1, 'Ana Silva', '123.456.789-01', 'ana.silva@email.com', 'F', 'SP'),
(2, 'Bruno Oliveira', '234.567.890-12', 'bruno.o@email.com', 'M', 'RJ'),
(3, 'Carla Souza', '345.678.901-23', 'carla.souza@email.com', 'F', 'MG'),
(4, 'Diego Santos', '456.789.012-34', 'diego.s@email.com', 'M', 'BA'),
(5, 'Elena Martins', '567.890.123-45', 'elena.m@email.com', 'F', 'PR'),
(6, 'Fabio Costa', '678.901.234-56', 'fabio.c@email.com', 'M', 'SC'),
(7, 'Gisele Rocha', '789.012.345-67', 'gisele.r@email.com', 'F', 'RS'),
(8, 'Hugo Almeida', '890.123.456-78', 'hugo.a@email.com', 'M', 'PE'),
(9, 'Isabela Lima', '901.234.567-89', 'isabela.l@email.com', 'F', 'CE'),
(10, 'João Pereira', '012.345.678-90', 'joao.p@email.com', 'M', 'GO'),
(11, 'Karen Mendes', '112.233.445-56', 'karen.m@email.com', 'F', 'DF'),
(12, 'Lucas Fernandes', '223.344.556-67', 'lucas.f@email.com', 'M', 'ES'),
(13, 'Marina Dias', '334.455.667-78', 'marina.d@email.com', 'F', 'AM'),
(14, 'Natan Gomes', '445.566.778-89', 'natan.g@email.com', 'M', 'PA'),
(15, 'Olivia Castro', '556.677.889-90', 'olivia.c@email.com', 'F', 'MT'),
(16, 'Paulo Victor', '667.788.990-01', 'paulo.v@email.com', 'M', 'MS'),
(17, 'Quezia Ramos', '778.899.001-12', 'quezia.r@email.com', 'F', 'AL'),
(18, 'Ricardo Luiz', '889.900.112-23', 'ricardo.l@email.com', 'M', 'PB'),
(19, 'Sara Nobre', '990.011.223-34', 'sara.n@email.com', 'F', 'RN'),
(20, 'Thiago Melo', '001.122.334-45', 'thiago.m@email.com', 'M', 'SE'),
(21, 'Ursula Ferreira', '121.232.343-54', 'ursula.f@email.com', 'F', 'PI'),
(22, 'Vitor Hugo', '232.343.454-65', 'vitor.h@email.com', 'M', 'MA'),
(23, 'Wanessa Camargo', '343.454.565-76', 'wanessa.c@email.com', 'F', 'TO'),
(24, 'Xavier Neto', '454.565.676-87', 'xavier.n@email.com', 'M', 'RO'),
(25, 'Yara Lopes', '565.676.787-98', 'yara.l@email.com', 'F', 'AC'),
(26, 'Zeca Pagodinho', '676.787.898-09', 'zeca.p@email.com', 'M', 'AP'),
(27, 'Aline Barros', '787.898.909-10', 'aline.b@email.com', 'F', 'RR'),
(28, 'Beto Falcão', '898.909.010-21', 'beto.f@email.com', 'M', 'BA'),
(29, 'Cintia Mel', '909.010.121-32', 'cintia.m@email.com', 'F', 'SP'),
(30, 'Daniel Azulay', '010.121.232-43', 'daniel.a@email.com', 'M', 'RJ');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id_livro` int(11) NOT NULL,
  `nome_livro` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `resumo` text DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `preco_venda` decimal(10,2) GENERATED ALWAYS AS (`preco` * 1.20) VIRTUAL,
  `edicao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id_livro`, `nome_livro`, `categoria`, `autor`, `resumo`, `isbn`, `preco`, `edicao`) VALUES
(1, 'O homem mais rico da Babilonia', 'Negócios', 'George S. Clason', 'Baseando-se nos segredos de sucesso dos antigos babilônicos ― os habitantes da cidade mais rica e próspera de seu tempo ―, George S. Clason mostra soluções ao mesmo tempo sábias e muito atuais para evitar a falta de dinheiro, como não desperdiçar recursos durante tempos de opulência, buscar conhecimento e informação em vez de apenas lucro, assegurar uma renda para o futuro, manter a pontualidade no pagamento de dívidas e, sobretudo, cultivar as próprias aptidões, tornando-se cada vez mais habilidoso e consciente.', '85950815301', 23.30, '2017-08-04'),
(2, 'A psicologia finaceira', 'Contabilidade', 'Morgan Housel', 'O sucesso financeiro tem menos a ver com a sua inteligência e muito mais a ver com o seu comportamento. E a forma como alguém se comporta é uma coisa difícil de se ensinar, mesmo para pessoas bastante inteligentes.\r\n\r\nA maneira como lidamos com o dinheiro ― finanças pessoais, investimentos, decisões de negócios ― costuma ser explicada como um campo puramente matemático, no qual dados e fórmulas nos dizem o que fazer. A verdade, porém, é que grandes decisões monetárias não são tomadas diante de uma planilha, mas durante jantares com a família e reuniões com os colegas de trabalho. Além disso, cada uma delas é um reflexo da história pessoal e das dificuldades enfrentadas pelo indivíduo que as tomou.\r\n\r\nAbordando a gestão financeira de maneira inédita, Morgan Housel apresenta casos de sucessos e fracassos de investidores que demonstram a importância do fator psicológico no gerenciamento das finanças, oferecendo aprendizados para administrar e fazer o dinheiro render em busca do grande objetivo de todos nós: ser feliz.\r\n\r\n“ [A psicologia Financeira] é uma leitura essencial para qualquer pessoa interessada em administrar melhor seu dinheiro.” ― James Clear, autor do best-seller Hábitos Atômicos', '6555111100', 33.35, '2021-03-15'),
(3, 'Pai Rico, Pai Pobre', 'Finanças', 'Robert Kiyosaki', 'A importância da educação financeira e como ativos geram riqueza.', '9788576081500', 45.90, '1997-04-01'),
(4, 'Os Segredos da Mente Milionária', 'Finanças', 'T. Harv Eker', 'Substituindo modelos mentais destrutivos por pensamentos de riqueza.', '9788575422397', 32.50, '2005-02-15'),
(5, 'Hábitos Atômicos', 'Autoajuda', 'James Clear', 'Pequenas mudanças que geram resultados impressionantes.', '9788550807560', 48.20, '2018-10-16'),
(6, 'O Alquimista', 'Ficção', 'Paulo Coelho', 'A jornada de um pastor em busca de um tesouro no Egito.', '9788575030252', 29.90, '1988-05-01'),
(7, 'Sapiens', 'História', 'Yuval Noah Harari', 'Uma breve história da humanidade, da evolução à tecnologia.', '9788535924558', 59.90, '2011-09-04'),
(8, 'O Poder do Hábito', 'Psicologia', 'Charles Duhigg', 'Como os hábitos funcionam e como transformá-los.', '9788539004119', 42.00, '2012-02-28'),
(9, 'A Revolução dos Bichos', 'Clássico', 'George Orwell', 'Uma sátira política sobre corrupção e poder.', '9788535909555', 24.90, '1945-08-17'),
(10, '1984', 'Ficção Científica', 'George Orwell', 'Uma distopia sobre vigilância estatal e controle totalitário.', '9788535914847', 35.00, '1949-06-08'),
(11, 'Cem Anos de Solidão', 'Literatura', 'Gabriel García Márquez', 'A saga da família Buendía na cidade de Macondo.', '9788501012074', 55.00, '1967-05-30'),
(12, 'O Código Da Vinci', 'Suspense', 'Dan Brown', 'Mistério envolvendo obras de arte e segredos da Igreja.', '9788575420959', 39.90, '2003-03-18'),
(13, 'O Pequeno Príncipe', 'Infantil', 'Antoine de Saint-Exupéry', 'Uma fábula sobre amizade, amor e a perda da inocência.', '9788522031382', 19.90, '1943-04-06'),
(14, 'O Investidor Inteligente', 'Finanças', 'Benjamin Graham', 'A bíblia do investimento em valor.', '9788595080805', 64.90, '1949-01-01'),
(15, 'Rápido e Devagar', 'Psicologia', 'Daniel Kahneman', 'Os dois sistemas de pensamento que dirigem nossas escolhas.', '9788539003839', 52.00, '2011-10-25'),
(16, 'Mindset', 'Autoajuda', 'Carol S. Dweck', 'Como a atitude mental influencia o sucesso.', '9788573129885', 38.50, '2006-02-28'),
(17, 'O Milagre da Manhã', 'Autoajuda', 'Hal Elrod', 'Método para transformar a vida acordando cedo.', '9788530601331', 34.90, '2012-12-07'),
(18, 'Homo Deus', 'História', 'Yuval Noah Harari', 'Uma visão sobre o futuro da humanidade.', '9788535928136', 57.00, '2015-09-01'),
(19, 'A Arte da Guerra', 'Estratégia', 'Sun Tzu', 'Tratado militar milenar aplicado aos negócios.', '9788525411242', 15.00, '2001-01-01'),
(20, 'Clean Code', 'Tecnologia', 'Robert C. Martin', 'Práticas para escrever código limpo e sustentável.', '9788576082323', 89.00, '2008-08-01'),
(21, 'O Guia do Mochileiro das Galáxias', 'Ficção', 'Douglas Adams', 'Aventura cômica pelo espaço.', '9788599296578', 31.00, '1979-10-12'),
(22, 'Dom Casmurro', 'Clássico', 'Machado de Assis', 'A clássica dúvida sobre a traição de Capitu.', '9788535900590', 22.00, '1899-12-31'),
(23, 'Essencialismo', 'Autoajuda', 'Greg McKeown', 'A disciplina de focar no que é realmente importante.', '9788543102146', 36.90, '2014-04-15'),
(24, 'O Cortiço', 'Clássico', 'Aluísio Azevedo', 'O retrato do naturalismo no Brasil.', '9788508044734', 18.50, '1890-01-01'),
(25, 'O Conto da Aia', 'Ficção', 'Margaret Atwood', 'Distopia sobre o papel da mulher em regime teocrático.', '9788532530783', 44.00, '1985-09-01'),
(26, 'Crime e Castigo', 'Clássico', 'Fiódor Dostoiévski', 'O drama psicológico de Raskólnikov.', '9788573260083', 62.00, '1866-01-01'),
(27, 'Orgulho e Preconceito', 'Romance', 'Jane Austen', 'A relação entre Elizabeth Bennet e Mr. Darcy.', '9788525416490', 28.00, '1813-01-28'),
(28, 'A Sociedade do Anel', 'Fantasia', 'J.R.R. Tolkien', 'O início da jornada para destruir o Um Anel.', '9788533613379', 58.00, '1954-07-29'),
(29, 'Harry Potter 1', 'Fantasia', 'J.K. Rowling', 'Um órfão descobre que é um bruxo.', '9788532511010', 39.90, '1997-06-26'),
(30, 'A Coragem de Ser Imperfeito', 'Autoajuda', 'Brené Brown', 'Como a vulnerabilidade transforma a vida.', '9788543104331', 37.00, '2012-09-11'),
(31, 'O Dilema da Inovação', 'Negócios', 'Clayton Christensen', 'Por que grandes empresas falham.', '9788535210774', 54.00, '1997-05-01'),
(32, 'O Ponto Mutante', 'Ficção', 'Dan Brown', 'Descoberta na Antártida gera conspiração.', '9788575421529', 33.00, '2001-02-01'),
(33, 'Brás Cubas', 'Clássico', 'Machado de Assis', 'Um defunto narra suas memórias irônicas.', '9788535900591', 25.00, '1881-01-01'),
(34, 'Trabalhe 4 Horas por Semana', 'Negócios', 'Timothy Ferriss', 'Como escapar da rotina e viver no estilo dos novos ricos.', '9788501081513', 46.50, '2007-04-24'),
(35, 'Antifrágil', 'Filosofia', 'Nassim Taleb', 'Coisas que se beneficiam com o caos.', '9788576846116', 68.00, '2012-11-27'),
(36, 'Guerra e Paz', 'Clássico', 'Liev Tolstói', 'A história da Rússia durante as guerras napoleônicas.', '9788535929652', 95.00, '1869-01-01'),
(37, 'O Velho e o Mar', 'Clássico', 'Ernest Hemingway', 'Luta de um pescador contra um peixe gigante.', '9788528601558', 22.00, '1952-09-01'),
(38, 'Ensaio Sobre a Cegueira', 'Literatura', 'José Saramago', 'Epidemia de cegueira branca atinge uma cidade.', '9788535902140', 49.00, '1995-10-01'),
(39, 'Meditações', 'Filosofia', 'Marco Aurélio', 'Pensamentos estoicos do imperador romano.', '9788525432858', 21.00, '2019-11-20'),
(40, 'A Menina que Roubava Livros', 'Ficção', 'Markus Zusak', 'A vida na Alemanha nazista contada pela Morte.', '9788598078175', 38.00, '2005-03-14'),
(41, 'Admirável Mundo Novo', 'Ficção', 'Aldous Huxley', 'Sociedade baseada em controle genético.', '9788535914848', 34.00, '1932-01-01'),
(42, 'O Sol é Para Todos', 'Ficção', 'Harper Lee', 'Advogado defende homem negro injustamente acusado.', '9788501045331', 41.00, '1960-07-11'),
(43, 'Metamorfose', 'Clássico', 'Franz Kafka', 'Gregor Samsa acorda transformado em inseto.', '9788535904550', 19.00, '1915-01-01'),
(44, 'O Processo', 'Clássico', 'Franz Kafka', 'Um homem preso sem saber seu crime.', '9788535904551', 32.00, '1925-04-26'),
(45, 'Frankenstein', 'Terror', 'Mary Shelley', 'Cientista dá vida a uma criatura.', '9788525416491', 23.00, '1818-01-01'),
(46, 'Drácula', 'Terror', 'Bram Stoker', 'O clássico vampiro viaja para a Inglaterra.', '9788525416492', 29.00, '1897-05-26'),
(47, 'O Grande Gatsby', 'Clássico', 'F. Scott Fitzgerald', 'Crítica ao sonho americano nos anos 20.', '9788535914849', 27.00, '1925-04-10'),
(48, 'A Metade Perdida', 'Ficção', 'Brit Bennett', 'Irmãs gêmeas negras com caminhos opostos.', '9786555601244', 45.00, '2020-06-02'),
(49, 'Torto Arado', 'Literatura', 'Itamar Vieira Junior', 'História sobre terra e resistência no sertão.', '9788594931801', 42.00, '2019-08-15'),
(50, 'Pequena Coreografia do Adeus', 'Literatura', 'Aline Bei', 'Relação conturbada entre mãe e filha.', '9788535933451', 39.00, '2021-09-01'),
(51, 'Canção de Ninar', 'Suspense', 'Leïla Slimani', 'Uma babá que comete um crime terrível.', '9788535929653', 36.00, '2016-08-18'),
(52, 'O Homem que Calculava', 'Matemática', 'Malba Tahan', 'Aventuras matemáticas de um persa.', '9788501021434', 33.00, '1938-06-15');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `visao_categoria`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `visao_categoria` (
`categoria` varchar(50)
,`total` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `visao_livros`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `visao_livros` (
`nome_livro` varchar(100)
,`preco` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estrutura para view `visao_categoria`
--
DROP TABLE IF EXISTS `visao_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `visao_categoria`  AS SELECT `livros`.`categoria` AS `categoria`, sum(`livros`.`preco`) AS `total` FROM `livros` GROUP BY `livros`.`categoria` ORDER BY sum(`livros`.`preco`) DESC ;

-- --------------------------------------------------------

--
-- Estrutura para view `visao_livros`
--
DROP TABLE IF EXISTS `visao_livros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `visao_livros`  AS SELECT `livros`.`nome_livro` AS `nome_livro`, `livros`.`preco` AS `preco` FROM `livros` ORDER BY `livros`.`preco` DESC ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id_livro`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- Banco de dados: `loja_db`
--
CREATE DATABASE IF NOT EXISTS `loja_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `loja_db`;
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Despejando dados para a tabela `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Despejando dados para a tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"\",\"table\":\"cliente\"},{\"db\":\"eletrocenter\",\"table\":\"usuario\"},{\"db\":\"eletrocenter\",\"table\":\"auditoria_log\"},{\"db\":\"eletrocenter\",\"table\":\"centro_custo\"},{\"db\":\"eletrocenter\",\"table\":\"conta_pagar\"},{\"db\":\"eletrocenter\",\"table\":\"plano_contas\"},{\"db\":\"\",\"table\":\"log_clientes\"},{\"db\":\"gatilho\",\"table\":\"log_clientes\"},{\"db\":\"gatilho\",\"table\":\"clientes\"},{\"db\":\"teste\",\"table\":\"teste\"}]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Despejando dados para a tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-03-21 14:26:17', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt_BR\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices de tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices de tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices de tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices de tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices de tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices de tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices de tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices de tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices de tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `relacionamento`
--
CREATE DATABASE IF NOT EXISTS `relacionamento` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `relacionamento`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidades`
--

CREATE TABLE `cidades` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cidades`
--

INSERT INTO `cidades` (`id`, `nome`) VALUES
(1, 'São Paulo'),
(2, 'Rio de Janeiro'),
(3, 'Belo Horizonte'),
(4, 'Curitiba'),
(5, 'Porto Alegre');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cidade_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cidade_id`) VALUES
(101, 'Ana', 1),
(102, 'Bruno', 1),
(103, 'Carla', 2),
(104, 'Diego', 3),
(105, 'Eva', NULL),
(106, 'Fábio', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes_cidades` (`cidade_id`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_cidades` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Banco de dados: `teste`
--
CREATE DATABASE IF NOT EXISTS `teste` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `teste`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `email` varchar(160) NOT NULL,
  `cidade` varchar(80) NOT NULL,
  `estado` char(2) NOT NULL,
  `categoria` enum('Pessoa Física','Pessoa Jurídica') NOT NULL,
  `criado_em` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nome`, `email`, `cidade`, `estado`, `categoria`, `criado_em`) VALUES
(1, 'Ana Martins', 'ana.martins@exemplo.com', 'São Paulo', 'SP', 'Pessoa Física', '2025-01-10'),
(2, 'Bruno Almeida', 'bruno.almeida@exemplo.com', 'Campinas', 'SP', 'Pessoa Física', '2025-02-05'),
(3, 'Carla Souza', 'carla.souza@exemplo.com', 'Santos', 'SP', 'Pessoa Jurídica', '2025-02-20'),
(4, 'Diego Lima', 'diego.lima@exemplo.com', 'Rio de Janeiro', 'RJ', 'Pessoa Física', '2025-03-02'),
(5, 'Elisa Rocha', 'elisa.rocha@exemplo.com', 'Niterói', 'RJ', 'Pessoa Jurídica', '2025-03-18'),
(6, 'Felipe Costa', 'felipe.costa@exemplo.com', 'Belo Horizonte', 'MG', 'Pessoa Física', '2025-04-01'),
(7, 'Gabriela Dias', 'gabriela.dias@exemplo.com', 'Contagem', 'MG', 'Pessoa Jurídica', '2025-04-11'),
(8, 'Henrique Silva', 'henrique.silva@exemplo.com', 'Curitiba', 'PR', 'Pessoa Física', '2025-05-06'),
(9, 'Isabela Ramos', 'isabela.ramos@exemplo.com', 'Londrina', 'PR', 'Pessoa Jurídica', '2025-05-19'),
(10, 'João Pereira', 'joao.pereira@exemplo.com', 'Salvador', 'BA', 'Pessoa Física', '2025-06-08'),
(11, 'Katia Fernandes', 'katia.fernandes@exemplo.com', 'Recife', 'PE', 'Pessoa Jurídica', '2025-06-21'),
(12, 'Lucas Carvalho', 'lucas.carvalho@exemplo.com', 'Fortaleza', 'CE', 'Pessoa Física', '2025-07-03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `data_pedido` date NOT NULL,
  `status` enum('Pendente','Pago','Cancelado') NOT NULL,
  `forma_pgto` enum('Cartão','Pix','Boleto','Transferência') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `frete` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `cliente_id`, `data_pedido`, `status`, `forma_pgto`, `valor`, `desconto`, `frete`) VALUES
(1, 1, '2026-01-12', 'Pago', 'Pix', 120.90, 5.00, 12.00),
(2, 2, '2026-01-15', 'Pago', 'Cartão', 250.00, 10.00, 15.00),
(3, 3, '2026-01-20', 'Pendente', 'Boleto', 890.00, 0.00, 25.00),
(4, 4, '2026-01-25', 'Cancelado', 'Cartão', 140.00, 0.00, 10.00),
(5, 5, '2026-01-28', 'Pago', 'Transferência', 600.00, 30.00, 18.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos2025`
--

CREATE TABLE `pedidos2025` (
  `pedido_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `data_pedido` date NOT NULL,
  `status` enum('Pendente','Pago','Cancelado') NOT NULL,
  `forma_pgto` enum('Cartão','Pix','Boleto','Transferência') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `frete` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos2025`
--

INSERT INTO `pedidos2025` (`pedido_id`, `cliente_id`, `data_pedido`, `status`, `forma_pgto`, `valor`, `desconto`, `frete`) VALUES
(1, 1, '2025-01-12', 'Pago', 'Pix', 120.90, 5.00, 12.00),
(2, 2, '2025-01-15', 'Pago', 'Cartão', 250.00, 10.00, 15.00),
(3, 3, '2025-01-20', 'Pendente', 'Boleto', 890.00, 0.00, 25.00),
(4, 4, '2025-01-25', 'Cancelado', 'Cartão', 140.00, 0.00, 10.00),
(5, 5, '2025-01-28', 'Pago', 'Transferência', 600.00, 30.00, 18.00);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `teste`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `teste` (
`cliente_id` int(11)
,`nome` varchar(120)
,`email` varchar(160)
,`cidade` varchar(80)
,`estado` char(2)
,`categoria` enum('Pessoa Física','Pessoa Jurídica')
,`criado_em` date
,`valor` decimal(10,2)
,`forma_pgto` enum('Cartão','Pix','Boleto','Transferência')
);

-- --------------------------------------------------------

--
-- Estrutura para view `teste`
--
DROP TABLE IF EXISTS `teste`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `teste`  AS SELECT `a`.`cliente_id` AS `cliente_id`, `a`.`nome` AS `nome`, `a`.`email` AS `email`, `a`.`cidade` AS `cidade`, `a`.`estado` AS `estado`, `a`.`categoria` AS `categoria`, `a`.`criado_em` AS `criado_em`, `b`.`valor` AS `valor`, `b`.`forma_pgto` AS `forma_pgto` FROM (`clientes` `a` join `pedidos` `b` on(`a`.`cliente_id` = `b`.`cliente_id`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_clientes_cidade` (`cidade`),
  ADD KEY `idx_clientes_estado` (`estado`),
  ADD KEY `idx_clientes_categoria` (`categoria`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `idx_pedidos_cliente` (`cliente_id`),
  ADD KEY `idx_pedidos_data` (`data_pedido`),
  ADD KEY `idx_pedidos_status` (`status`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON UPDATE CASCADE;
--
-- Banco de dados: `weberp`
--
CREATE DATABASE IF NOT EXISTS `weberp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `weberp`;

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
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id_livro` int(11) NOT NULL,
  `nome_livro` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `autor` varchar(80) NOT NULL,
  `resumo` text DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id_livro`, `nome_livro`, `categoria`, `autor`, `resumo`, `isbn`, `preco`) VALUES
(1, 'Os Discos Voadores', 'Ficção Científica', 'José Carlos', 'O livro fala sobre discos voadores e teorias extraterrestres.', '978000000001', 150.00),
(2, 'Viagem a Marte', 'Ficção Científica', 'Ana Souza', 'Uma missão tripulada ao planeta vermelho.', '978000000002', 120.00),
(3, 'A Última Fronteira', 'Ficção Científica', 'Carlos Mendes', 'Exploração do espaço profundo e seus perigos.', '978000000003', 135.00),
(4, 'Além da Galáxia', 'Ficção Científica', 'Marcos Silva', 'Civilizações avançadas fora da Via Láctea.', '978000000004', 160.00),
(5, 'Contato Imediato', 'Ficção Científica', 'José Carlos', 'Primeiro contato da humanidade com alienígenas.', '978000000005', 145.00),
(6, 'O Código Perdido', 'Tecnologia', 'Fernanda Lima', 'Um mistério envolvendo sistemas e criptografia.', '978000000006', 90.00),
(7, 'Programando o Futuro', 'Tecnologia', 'Rafael Alves', 'Como a tecnologia molda o mundo moderno.', '978000000007', 110.00),
(8, 'Inteligência Artificial', 'Tecnologia', 'Lucas Rocha', 'Conceitos e aplicações da IA.', '978000000008', 180.00),
(9, 'Algoritmos Modernos', 'Tecnologia', 'Paula Nogueira', 'Estudo prático de algoritmos.', '978000000009', 130.00),
(10, 'Segurança Digital', 'Tecnologia', 'Bruno Teixeira', 'Proteção de dados no mundo digital.', '978000000010', 125.00),
(11, 'Banco de Dados Essencial', 'Informática', 'Celso Caldeira', 'Introdução prática ao MySQL.', '978000000011', 200.00),
(12, 'SQL na Prática', 'Informática', 'Celso Caldeira', 'Consultas SQL para aplicações reais.', '978000000012', 220.00),
(13, 'Modelagem de Dados', 'Informática', 'Ana Paula', 'Como estruturar bancos de dados eficientes.', '978000000013', 195.00),
(14, 'APIs e Integrações', 'Informática', 'Ricardo Santos', 'Integração de sistemas via APIs.', '978000000014', 175.00),
(15, 'JSON e Web', 'Informática', 'Marina Lopes', 'Uso de JSON em aplicações web.', '978000000015', 160.00),
(16, 'O Mistério da Casa Azul', 'Romance', 'Laura Pires', 'Um romance cheio de segredos.', '978000000016', 80.00),
(17, 'Amor em Paris', 'Romance', 'Juliana Costa', 'Uma história de amor na França.', '978000000017', 95.00),
(18, 'Caminhos do Coração', 'Romance', 'Roberto Lima', 'Decisões difíceis movidas pelo amor.', '978000000018', 85.00),
(19, 'Entre Dois Mundos', 'Romance', 'Camila Duarte', 'Um amor impossível.', '978000000019', 100.00),
(20, 'Laços Eternos', 'Romance', 'Patrícia Gomes', 'Relações que atravessam o tempo.', '978000000020', 90.00),
(21, 'História do Brasil', 'História', 'João Ferreira', 'Da colonização aos dias atuais.', '978000000021', 140.00),
(22, 'Guerras Mundiais', 'História', 'André Farias', 'Os maiores conflitos do século XX.', '978000000022', 155.00),
(23, 'Impérios Antigos', 'História', 'Renata Azevedo', 'Civilizações que marcaram o mundo.', '978000000023', 170.00),
(24, 'Brasil República', 'História', 'Marcos Vinícius', 'Transformações políticas do Brasil.', '978000000024', 145.00),
(25, 'Revoluções Históricas', 'História', 'Cláudio Moreira', 'Mudanças que moldaram sociedades.', '978000000025', 160.00),
(26, 'Lógica de Programação', 'Educação', 'Daniel Moraes', 'Base para aprender a programar.', '978000000026', 130.00),
(27, 'Aprendendo Python', 'Educação', 'Felipe Andrade', 'Introdução à linguagem Python.', '978000000027', 150.00),
(28, 'PHP para Iniciantes', 'Educação', 'Celso Caldeira', 'Desenvolvimento web com PHP.', '978000000028', 165.00),
(29, 'JavaScript Essencial', 'Educação', 'Tiago Ribeiro', 'Programação para web moderna.', '978000000029', 155.00),
(30, 'Desenvolvimento Web', 'Educação', 'Carolina Freitas', 'HTML, CSS e JS integrados.', '978000000030', 180.00),
(31, 'O Enigma do Tempo', 'Ficção', 'Eduardo Nunes', 'Viagens temporais e paradoxos.', '978000000031', 140.00),
(32, 'A Cidade Invisível', 'Ficção', 'Vanessa Prado', 'Um mundo oculto dentro da cidade.', '978000000032', 135.00),
(33, 'Sombras do Passado', 'Ficção', 'Leonardo Barros', 'Mistério e suspense psicológico.', '978000000033', 125.00),
(34, 'O Último Guardião', 'Ficção', 'Marcelo Pacheco', 'Uma antiga profecia.', '978000000034', 150.00),
(35, 'Além do Horizonte', 'Ficção', 'Sandra Melo', 'Descobertas inesperadas.', '978000000035', 145.00),
(36, 'Empreendedor Digital', 'Negócios', 'Thiago Martins', 'Criando negócios online.', '978000000036', 190.00),
(37, 'Gestão Moderna', 'Negócios', 'Patrícia Rocha', 'Administração no século XXI.', '978000000037', 175.00),
(38, 'Marketing Estratégico', 'Negócios', 'Eduardo Campos', 'Estratégias para crescer empresas.', '978000000038', 185.00),
(39, 'Finanças Pessoais', 'Negócios', 'Luciana Torres', 'Controle financeiro eficiente.', '978000000039', 160.00),
(40, 'Startups de Sucesso', 'Negócios', 'Rogério Cunha', 'Do zero ao crescimento.', '978000000040', 200.00);

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
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id_livro`),
  ADD UNIQUE KEY `isbn` (`isbn`);

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
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
