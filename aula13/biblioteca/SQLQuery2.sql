CREATE DATABASE loja; 

USE loja; 

CREATE TABLE clientes (
  id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
  razao_social VARCHAR(120) NOT NULL,
  cnpj VARCHAR(20) DEFAULT NULL,
  email VARCHAR(100) DEFAULT NULL,
  telefone VARCHAR(20) DEFAULT NULL,
  celular VARCHAR(20) NOT NULL,
  cep VARCHAR(9) NOT NULL,
  logradouro VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(50) DEFAULT NULL,
  bairro VARCHAR(50) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  uf CHAR(2) NOT NULL 
);

SELECT * FROM clientes;  

INSERT INTO clientes 
  (razao_social, cnpj, email, telefone, celular, cep, logradouro, numero, complemento, bairro, cidade, uf) 
VALUES 
    ('Empresa A Ltda', '12.345.678/0001-00', 'contato@empresaA.com', '1133224455', '11987654321', '01001-000', 'Rua A', '100', 'Sala 101', 'Centro', 'São Paulo', 'SP'), 
    ('Empresa B Ltda', '98.765.432/0001-00', 'contato@empresaB.com', '1122334455', '11976543210', '01002-000', 'Rua B', '200', 'Sala 102', 'Bela Vista', 'São Paulo', 'SP'), 
    ('Empresa C Ltda', '11.122.233/0001-44', 'contato@empresaC.com', '1144556677', '11965432109', '01003-000', 'Rua C', '300', 'Sala 103', 'Liberdade', 'São Paulo', 'SP'), 
    ('Empresa D Ltda', '22.233.344/0001-55', 'contato@empresaD.com', '1133445566', '11954321098', '01004-000', 'Rua D', '400', 'Sala 104', 'Sé', 'São Paulo', 'SP'), 
    ('Empresa E Ltda', '33.344.455/0001-66', 'contato@empresaE.com', '1155667788', '11943210987', '01005-000', 'Rua E', '500', 'Sala 105', 'República', 'São Paulo', 'SP');

SELECT * FROM clientes;  



