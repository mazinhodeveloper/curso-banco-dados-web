> Aula 06   
> Docente: Celso Luis Caldeira    
> Data: 21/02/2026   

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

SHOW DATABASES;   
CREATE DATABASE eletrocenter;     

SHOW DATABASES;     
USE eletrocenter;    

CREATE TABLE perfil (     
  id_perfil INT AUTO_INCREMENT PRIMARY KEY,    
  nome VARCHAR(50) NOT NULL,    
  descricao VARCHAR(150) NULL,    
  ativo TINYINT(1) NOT NULL DEFAULT 1,     
  UNIQUE KEY uk_perfil_nome (nome)    
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;  
SELECT * FROM perfil;   

INSERT INTO perfil (nome,descricao) VALUES ('Administrador', 'Gerencia usuários, perfis, cadastro e regras.');    
SELECT * FROM perfil;    

CREATE TABLE usuario (     
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,    
  id_perfil INT NOT NULL,    
  nome VARCHAR(100) NOT NULL,    
  email VARCHAR(100) NULL,    
  senha_hash VARCHAR(255),    
  ativo TINYINT(1) NOT NULL DEFAULT 1,   
  dt_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,        
  UNIQUE KEY uk_usuario_nome (nome)    
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;     
SELECT * FROM usuario;    
    
INSERT INTO usuario (id_perfil, nome, email, senha_hash)     
  VALUES (1, 'José da Silva', 'js@hotmail.com', SHA2('123456', 256));        
SELECT * FROM usuario;    

DROP TABLE IF EXISTS cliente;    
CREATE TABLE cliente (     
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,    
  nome_razao VARCHAR(120) NOT NULL,     
  cpf_cnpj VARCHAR(20) NULL,     
  email VARCHAR(100) NULL,    
  telefone varchar(20) NULL,     
  ativo TINYINT(1) NOT NULL DEFAULT 1,   
  dt_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,        
  UNIQUE KEY uk_cliente_cpf_cnpj (cpf_cnpj),    
  KEY idx_cliente_nome (nome_razao)     
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;     
SELECT * FROM cliente;  

INSERT INTO cliente (nome_razao, cpf_cnpj, email, telefone, ativo)     
  VALUES ('Senac Serviço Social do Comercio', '11.111.111/0001-11', 'senac@senac.com.br', '(11) 2222-2222', 1);        
SELECT * FROM cliente;  
    
DROP TABLE IF EXISTS cliente_endereco;    
CREATE TABLE cliente_endereco (     
  id_endereco INT AUTO_INCREMENT PRIMARY KEY,    
  id_cliente INT NOT NULL,     
  cep VARCHAR(9) NULL,    
  logradouro VARCHAR(120) NOT NULL,    
  numero VARCHAR(10) NULL, 
  complemento VARCHAR(30) NULL, 
  bairro VARCHAR(60) NULL, 
  cidade VARCHAR(60) NULL, 
  uf CHAR(2) NULL,    
  principal TINYINT(1) NOT NULL DEFAULT 0,    
  KEY idx_endereco_clientes (id_cliente),     
  KEY idx_endereco_cidade_uf (cidade, uf),    
  CONSTRAINT fk_endereco_cliente     
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)     
  ON UPDATE CASCADE     
  ON DELETE CASCADE     
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;        
SELECT * FROM cliente_endereco;    

INSERT INTO cliente_endereco (id_cliente, cep, logradouro, numero, complemento, bairro, cidade, uf, principal)     
  VALUES ('1', '05051-000', 'Rua Tito', '54', 'SS1', 'Vila Romana', 'São Paulo', 'SP', '1');      

INSERT INTO cliente_endereco (id_cliente, cep, logradouro, numero, complemento, bairro, cidade, uf)       
  VALUES ('1', '05053-041', 'Av. Pompeia', '600', 'Sala 2', 'Lapa', 'São Paulo', 'SP');     

Consultando apenas o endereço principal do cliente cujo id = 1 (senac)    
SELECT nome_razao, logradouro, principal FROM cliente     
 JOIN cliente_endereco on cliente.id_cliente=cliente_endereco.id_cliente    
 WHERE cliente.id_cliente=1 and principal=1;     

DROP TABLE IF EXISTS fornecedor;    
CREATE TABLE fornecedor (     
  id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,    
  razao_social VARCHAR(100) NOT NULL,     
  cnpj VARCHAR(20) NOT NULL,     
  email VARCHAR(100) NULL,     
  telefone VARCHAR(20) NULL,     
  ativo TINYINT(1) NOT NULL DEFAULT 1,      
  UNIQUE KEY uk_fornecedor_cnpj (cnpj),        
  KEY idx_fornecedor_nome (razao_social)      
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;          
SELECT * FROM fornecedor;    

DROP TABLE IF EXISTS categoria;    
CREATE TABLE categoria (     
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,    
  nome VARCHAR(80) NOT NULL,   
  UNIQUE KEY uk_categoria_nome (nome)     
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;        
SELECT * FROM categoria;    

DROP TABLE IF EXISTS produto;    
CREATE TABLE produto (     
  id_produto INT AUTO_INCREMENT PRIMARY KEY,    
  id_categoria INT NOT NULL,     
  nome VARCHAR(60) NOT NULL,    
  descricao TEXT,    
  custo DECIMAL(12,2) NOT NULL DEFAULT 0.00,    
  preco DECIMAL(12,2) NOT NULL DEFAULT 0.00,     
  estoque INT NOT NULL DEFAULT 0,     
  estoque_minimo INT NOT NULL DEFAULT 0,     
  estoque_maximo INT NOT NULL DEFAULT 0,    
  unidade VARCHAR(15),     
  ativo TINYINT(1) NOT NULL DEFAULT 1,         
  KEY idx_produto_categoria (id_categoria),    
  KEY idx_produto_nome (nome),        
  CONSTRAINT fk_produto_categoria    
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)     
    ON UPDATE CASCADE      
    ON DELETE CASCADE     
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;        
SELECT * FROM produto;    

