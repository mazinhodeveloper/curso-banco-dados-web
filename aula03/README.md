> Aula 03   
> Docente: Celso Luis Caldeira    
> Data: 31/01/2026   

# Banco de Dados para Web - 84 horas  
Aprender a aplicar e manipular dados em um sistema gerenciador de banco de dados, conectando com a linguagem de programação.   
Período: 17/01/2026 a 27/06/2026    
Horário: Sábado - 08h às 12h    
https://www.sp.senac.br/senac-lapa-tito/cursos-livres/curso-de-banco-de-dados-para-web   

## GitHub / Curso Banco de Dados para Web 
https://github.com/mazinhodeveloper/curso-banco-dados-web   


### Projeto   
| Requisitos do Projeto      | URL                           |   
|--------------------------- | ----------------------------- |   
| XAMPP                      | https://www.apachefriends.org |   

### Rodando o Projeto 
| Diretório             | URL                   |  
|---------------------- |---------------------- |  
| Local                 | http://localhost      |      
| Local / PHPMyAdmin    | http://localhost/phpmyadmin |      

### Atividades 
Atividades desenvolvidas em sala de aula.    
- Usando PHPMyAdmin    
  CREATE DATABASE weberp;    
  SHOW DATABASES;  
  
  USE weberp;    
  CREATE TABLE produtos (    
    id_produto INT AUTO_INCREMENT PRIMARY KEY,    
    descricao_produto VARCHAR(70) NOT NULL,    
    id_categoria INT,    
    observacao TEXT    
  ) ENGINE=INNODB;   
  -- Estrutura para tabela `produtos`    
  CREATE TABLE produtos (    
    id_produto INT AUTO_INCREMENT PRIMARY KEY,     
    descricao_produto VARCHAR(70) NOT NULL,    
    id_categoria INT,    
    observacao TEXT,     
    preco_compra DECIMAL(12,2) NOT NULL DEFAULT 0.00,     
    estoque_minimo DECIMAL(10,2) NOT NULL DEFAULT 0.00,    
    estoque_maximo DECIMAL(10,2) NOT NULL DEFAULT 0.00    
  ) ENGINE=INNODB;    

  ALTER TABLE produtos     
  ADD CONSTRAINT fk_produtos_categorias    
  FOREIGN KEY (id_categoria)    
  REFERENCES categorias(id_categoria);    
  INSERT INTO `categorias` (    
    `id_categoria`, `descricao_categoria`) VALUES     
    (NULL, 'Impressoras');    
  INSERT INTO categorias (descricao_categoria) VALUES ('Notebooks');    

  INSERT INTO `produtos` (`id_produto`, `descricao_produto`, `id_categoria`, `observacao`, `preco_compra`, `estoque_minimo`, `estoque_maximo`) VALUES (NULL, 'Notebook Sansumg Mod. 2345', '2', 'I7 com 64GB Ram, 2TB SSD, etc.', '5000', '2', '20');    

  INSERT INTO produtos (descricao_produto, id_categoria, observacao, preco_compra, estoque_minimo, estoque_maximo) VALUES ('Impressora Laser Mod. 123', '1', 'Impressora Rápida', '3000', '1', '10');    

  ALTER TABLE `produtos` CHANGE `preco_venda` `preco_venda` DECIMAL(12,2) NOT NULL DEFAULT '0.00';    
  SELECT descricao_produto,preco_compra from produtos;   
  SELECT descricao_produto,preco_compra,preco_compra*1.60 as preco_sugerido from produtos;    
  UPDATE produtos SET preco_venda = preco_compra*1.6;    

  SELECT * FROM produtos;    
  UPDATE produtos SET descricao_produto = 'Impressora Laser Mod. 125' WHERE id_produto=2;   
  INSERT INTO `produtos` (`id_produto`, `descricao_produto`, `id_categoria`, `observacao`, `preco_compra`, `preco_venda`, `estoque_minimo`, `estoque_maximo`) VALUES (NULL, 'Computador 1234', '2', 'Computador 1234', '100', '0.00', '0.00', '0.00');    

  SELECT * FROM produtos;    
  DELETE FROM produtos WHERE id_produto=3;    
  SELECT * FROM produtos;    
  INSERT INTO `produtos` (`id_produto`, `descricao_produto`, `id_categoria`, `observacao`, `preco_compra`, `preco_venda`, `estoque_minimo`, `estoque_maximo`) VALUES (NULL, 'Note book da Xuxa', NULL, 'tdsfdfsdfds', '0.00', '0.00', '0.00', '0.00');    

  ALTER TABLE `produtos` ADD `oculto` BOOLEAN NOT NULL DEFAULT FALSE AFTER `estoque_maximo`, ADD `id_usuario_deletou` INT(11) NOT NULL AFTER `oculto`, ADD `data_excusao` INT(11) NOT NULL AFTER `id_usuario_deletou`;    
  ALTER TABLE `produtos` CHANGE `data_excusao` `data_excusao` DATE NULL DEFAULT NULL;    
  UPDATE `produtos` SET `oculto` = '1' WHERE `produtos`.`id_produto` = 4;    

  SELECT descricao_produto,descricao_categoria FROM produtos join categorias on produtos.id_categoria=categorias.id_categoria;    

  --------     
  SELECT COUNT(id_produto) as total FROM produtos;    

  SELECT SUM(preco_compra) as total FROM produtos;   

  --------     


### Atividades 2
Atividades desenvolvidas em sala de aula.    
- Usando PHPMyAdmin    
  CREATE DATABASE teste;    
  SHOW DATABASES;  
  USE teste;    
  -- Estrutura para tabela `clientes`   
  CREATE TABLE `clientes` (    
    `cliente_id` int(11) NOT NULL,    
    `nome` varchar(120) NOT NULL,    
    `email` varchar(160) NOT NULL,    
    `cidade` varchar(80) NOT NULL,    
    `estado` char(2) NOT NULL,    
    `categoria` enum('Pessoa Física','Pessoa Jurídica') NOT NULL,    
    `criado_em` date NOT NULL    
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;    
  -- Despejando dados para a tabela `clientes`    
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
  -- Estrutura para tabela `pedidos`    
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
  -- Despejando dados para a tabela `pedidos`     
  INSERT INTO `pedidos` (`pedido_id`, `cliente_id`, `data_pedido`, `status`, `forma_pgto`, `valor`, `desconto`, `frete`) VALUES    
  (1, 1, '2026-01-12', 'Pago', 'Pix', 120.90, 5.00, 12.00),    
  (2, 2, '2026-01-15', 'Pago', 'Cartão', 250.00, 10.00, 15.00),    
  (3, 3, '2026-01-20', 'Pendente', 'Boleto', 890.00, 0.00, 25.00),    
  (4, 4, '2026-01-25', 'Cancelado', 'Cartão', 140.00, 0.00, 10.00),    
  (5, 5, '2026-01-28', 'Pago', 'Transferência', 600.00, 30.00, 18.00);    
  -- Índices para tabelas despejadas    
  -- Índices de tabela `clientes`    
  ALTER TABLE `clientes`    
    ADD PRIMARY KEY (`cliente_id`),    
    ADD UNIQUE KEY `email` (`email`),    
    ADD KEY `idx_clientes_cidade` (`cidade`),    
    ADD KEY `idx_clientes_estado` (`estado`),    
    ADD KEY `idx_clientes_categoria` (`categoria`);    
  -- Índices de tabela `pedidos`    
  ALTER TABLE `pedidos`    
    ADD PRIMARY KEY (`pedido_id`),    
    ADD KEY `idx_pedidos_cliente` (`cliente_id`),    
    ADD KEY `idx_pedidos_data` (`data_pedido`),    
    ADD KEY `idx_pedidos_status` (`status`);    
  -- AUTO_INCREMENT para tabelas despejadas    
  -- AUTO_INCREMENT de tabela `clientes`    
  ALTER TABLE `clientes`    
    MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;    
  -- AUTO_INCREMENT de tabela `pedidos`    
  ALTER TABLE `pedidos`    
    MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;    
  -- Restrições para tabelas despejadas    
  -- Restrições para tabelas `pedidos`    
  ALTER TABLE `pedidos`    
    ADD CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON UPDATE CASCADE;    
  -- Usando o Banco de Dados `teste`     
  USE teste;    
  SELECT estado,COUNT(cliente_id) AS total FROM clientes GROUP BY estado;     
  -- Índices de tabela `pedidos2025`    
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
  -- Despejando dados para a tabela `pedidos`     
  INSERT INTO `pedidos2025` (`pedido_id`, `cliente_id`, `data_pedido`, `status`, `forma_pgto`, `valor`, `desconto`, `frete`) VALUES    
  (1, 1, '2025-01-12', 'Pago', 'Pix', 120.90, 5.00, 12.00),    
  (2, 2, '2025-01-15', 'Pago', 'Cartão', 250.00, 10.00, 15.00),    
  (3, 3, '2025-01-20', 'Pendente', 'Boleto', 890.00, 0.00, 25.00),    
  (4, 4, '2025-01-25', 'Cancelado', 'Cartão', 140.00, 0.00, 10.00),    
  (5, 5, '2025-01-28', 'Pago', 'Transferência', 600.00, 30.00, 18.00);    
  USE teste;     
  -- Union tabelas `pedidos` e `pedidos2025`     
  SELECT * FROM pedidos UNION SELECT * FROM pedidos2025;    
  SELECT AVG(valor) AS valor_medio FROM pedidos;    
  SELECT MAX(valor) AS valor_medio FROM pedidos;    
  SELECT MIN(valor) AS valor_medio FROM pedidos;    
  -- JOIN de `pedidos`    
  SELECT * FROM clientes JOIN pedidos ON clientes.cliente_id=pedidos.cliente_id;    
  -- Criando VIEW    
  CREATE VIEW teste AS SELECT a.*, b.valor, b.forma_pgto FROM clientes as a JOIN pedidos as b ON a.cliente_id = b.cliente_id;    
  SELECT * FROM teste;     

  