-- Crie um formulário de inclusão de clientes baseado nessa estrutura: 
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
 
 
-- Quero que use bootstrap e que quando informar o cep, acionar a API do VIACEP e preencher os campos de endereço      
-- https://blackbox.ai     
