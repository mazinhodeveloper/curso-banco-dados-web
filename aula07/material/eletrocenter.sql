-- DB eletrocenter 

-- Estrutura para tabela `categoria`

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Estrutura para tabela `cliente`
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_razao` varchar(120) NOT NULL,
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `dt_cadastro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `cliente`
INSERT INTO `cliente` (`id_cliente`, `nome_razao`, `cpf_cnpj`, `email`, `telefone`, `ativo`, `dt_cadastro`) VALUES
(1, 'Senac Serviço Social do Comercio', '11.111.111/0001-11', 'senac@senac.com.br', '(11) 2222-2222', 1, '2026-02-21 10:37:38');

-- --------------------------------------------------------

-- Estrutura para tabela `cliente_endereco`
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

-- Despejando dados para a tabela `cliente_endereco`
INSERT INTO `cliente_endereco` (`id_endereco`, `id_cliente`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `uf`, `principal`) VALUES
(1, 1, '05051-000', 'Rua Tito', '54', 'SS1', 'Vila Romana', 'São Paulo', 'SP', 1),
(2, 1, '05053-041', 'Av. Pompeia', '600', 'Sala 2', 'Lapa', 'São Paulo', 'SP', 0);

-- --------------------------------------------------------

-- Estrutura para tabela `fornecedor`
CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `razao_social` varchar(100) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Estrutura para tabela `perfil`
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `perfil`
INSERT INTO `perfil` (`id_perfil`, `nome`, `descricao`, `ativo`) VALUES
(1, 'Administrador', 'Gerencia usuários, perfis, cadastro e regras.', 1);

-- --------------------------------------------------------

-- Estrutura para tabela `produto`
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

-- --------------------------------------------------------
-- Estrutura para tabela `usuario`
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `dt_cadastro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Despejando dados para a tabela `usuario`
INSERT INTO `usuario` (`id_usuario`, `id_perfil`, `nome`, `email`, `senha_hash`, `ativo`, `dt_cadastro`) VALUES
(1, 1, 'José da Silva', 'js@hotmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '2026-02-21 10:04:34');

-- Índices para tabelas despejadas
-- Índices de tabela `categoria`
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `uk_categoria_nome` (`nome`);

-- Índices de tabela `cliente`
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `uk_cliente_cpf_cnpj` (`cpf_cnpj`),
  ADD KEY `idx_cliente_nome` (`nome_razao`);

-- Índices de tabela `cliente_endereco`
ALTER TABLE `cliente_endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `idx_endereco_clientes` (`id_cliente`),
  ADD KEY `idx_endereco_cidade_uf` (`cidade`,`uf`);

-- Índices de tabela `fornecedor`
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD UNIQUE KEY `uk_fornecedor_cnpj` (`cnpj`),
  ADD KEY `idx_fornecedor_nome` (`razao_social`);

-- Índices de tabela `perfil`
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD UNIQUE KEY `uk_perfil_nome` (`nome`);

-- Índices de tabela `produto`
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `idx_produto_categoria` (`id_categoria`),
  ADD KEY `idx_produto_nome` (`nome`),
  ADD KEY `fk_produto_fornecedor` (`id_fornecedor`);

-- Índices de tabela `usuario`
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `uk_usuario_email` (`email`),
  ADD KEY `idx_usuario_perfil` (`id_perfil`);

-- AUTO_INCREMENT para tabelas despejadas

-- AUTO_INCREMENT de tabela `categoria`
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela `cliente`
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT de tabela `cliente_endereco`
ALTER TABLE `cliente_endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- AUTO_INCREMENT de tabela `fornecedor`
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela `perfil`
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT de tabela `produto`
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT de tabela `usuario`
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- Restrições para tabelas despejadas
-- Restrições para tabelas `cliente_endereco`
ALTER TABLE `cliente_endereco`
  ADD CONSTRAINT `fk_endereco_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Restrições para tabelas `produto`
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produto_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`);

-- Restrições para tabelas `usuario`
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON UPDATE CASCADE;
