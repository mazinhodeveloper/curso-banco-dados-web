-- # Banco-de-dados-sistema.sql 

CREATE TABLE cliente (
  id_cliente int(11) AUTO_INCREMENT NOT NULL,
  nome_razao varchar(120) NOT NULL,
  cpf_cnpj varchar(20) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  telefone varchar(20) DEFAULT NULL,
  celular varchar(20) NOT NULL,
  cep varchar(9) NOT NULL,
  logradouro varchar(20) NOT NULL,
  numero varchar(20) NOT NULL,
  complemento varchar(20) NOT NULL,
  bairro varchar(20) NOT NULL,
  cidade varchar(20) NOT NULL,
  uf varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
ALTER TABLE cliente
  ADD PRIMARY KEY (id_cliente),
  ADD UNIQUE KEY uk_cliente_cpf_cnpj (cpf_cnpj),
  ADD KEY idx_cliente_nome (nome_razao);
 
ALTER TABLE cliente
  MODIFY id_cliente int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
 
INSERT INTO cliente 
    (id_cliente, nome_razao, cpf_cnpj, email, telefone, celular, cep, logradouro, numero, complemento, bairro, cidade, uf)
VALUES 
    (1, 'João Silva', '123.456.789-00', 'joao@email.com', '1130000000', '11990000001', '01001-000', 'Rua A', '100', 'Apto 1', 'Centro', 'São Paulo', 'SP'),
    (2, 'Maria Oliveira', '987.654.321-00', 'maria@email.com', '1130000001', '11990000002', '02002-000', 'Rua B', '200', 'Casa', 'Vila Nova', 'São Paulo', 'SP'),
    (3, 'Empresa XPTO Ltda', '12.345.678/0001-99', 'contato@xpto.com', '1130000002', '11990000003', '03003-000', 'Av. Paulista', '300', 'Sala 10', 'Bela Vista', 'São Paulo', 'SP'),
    (4, 'Carlos Souza', '111.222.333-44', 'carlos@email.com', '1130000003', '11990000004', '04004-000', 'Rua C', '400', 'Fundos', 'Mooca', 'São Paulo', 'SP'),
    (5, 'Ana Pereira', '555.666.777-88', 'ana@email.com', '1130000004', '11990000005', '05005-000', 'Rua D', '500', 'Casa 2', 'Ipiranga', 'São Paulo', 'SP'),
    (6, 'Tech Solutions ME', '98.765.432/0001-11', 'tech@solutions.com', '1130000005', '11990000006', '06006-000', 'Av. Brasil', '600', 'Sala 5', 'Jardins', 'São Paulo', 'SP'),
    (7, 'Pedro Santos', '222.333.444-55', 'pedro@email.com', '1130000006', '11990000007', '07007-000', 'Rua E', '700', 'Apto 12', 'Santana', 'São Paulo', 'SP'),
    (8, 'Juliana Costa', '333.444.555-66', 'juliana@email.com', '1130000007', '11990000008', '08008-000', 'Rua F', '800', 'Casa', 'Tatuapé', 'São Paulo', 'SP'),
    (9, 'Mercado Bom Preço', '11.222.333/0001-44', 'contato@bompreco.com', '1130000008', '11990000009', '09009-000', 'Av. Central', '900', 'Loja 1', 'Centro', 'São Paulo', 'SP'),
    (10, 'Lucas Almeida', '444.555.666-77', 'lucas@email.com', '1130000009', '11990000010', '10010-000', 'Rua G', '1000', 'Apto 22', 'Pinheiros', 'São Paulo', 'SP');
