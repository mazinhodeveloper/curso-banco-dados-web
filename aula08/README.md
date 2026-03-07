> Aula 08   
> Docente: Celso Luis Caldeira    
> Data: 07/03/2026   
   
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
    
USE eletrocenter;    
-- SELECT * FROM usuario;     
    
-- Incluindo individualmente    
-- INSERT INTO categoria (nome) VALUES ('Impressora');    
-- INSERT INTO categoria (nome) VALUES ('Gabinetes');    
-- INSERT INTO categoria (nome) VALUES ('Memórias');        
-- INSERT INTO categoria (nome) VALUES ('Smartphones');    
-- SELECT * FROM categoria;    

-- Incluindo em bloco     
-- Incluindo varios em um mesmo insert       
/* INSERT INTO categoria (nome)     
	VALUES ('Monitores'), ('SSD'), ('Teclados'), ('Mouses'); */     
-- SELECT * FROM categoria ORDER BY id desc;    
    
-- Cadastrando fornecedor    
/* INSERT INTO fornecedor (razao_social, cnpj, email, telefone, ativo)     
	VALUES ('Gabinet Ltda', '33.333.333/0001-11', 'sac@gabinet.com.br', '(11) 99999-9999', '1'); */    
-- SELECT * FROM fornecedor;     
    
-- Cadastrando um produto     
/*INSERT INTO produto (id_categoria, id_fornecedor, nome, descricao, custo, preco, estoque, estoque_minimo, estoque_maximo, unidade, ativo)     
	VALUES ('2', '1', 'Gabinete ATX 1050 - Teste', 'teste', '300', '500', '10', '2', '15', 'Peça', '1'); */    
 -- SELECT * FROM produto;     
     
 -- Criando uma VIEW    
 /*CREATE VIEW vwproduto     
AS SELECT produto.nome AS nome_produto, 
	categoria.nome AS nome_categoria, 
    razao_social    
FROM produto     
INNER JOIN categoria     
  ON produto.id_categoria=categoria.id_categoria      
INNER JOIN fornecedor     
  ON produto.id_fornecedor=fornecedor.id_fornecedor; */       
-- SELECT * FROM vwproduto;     
    
-- Selecionando todos os campos da tabela produto     
/*SELECT * FROM produto     
INNER JOIN categoria     
  ON produto.id_categoria=categoria.id_categoria      
INNER JOIN fornecedor     
  ON produto.id_fornecedor=fornecedor.id_fornecedor; */       
      
/*SELECT * FROM produto     
INNER JOIN categoria     
  ON produto.id_categoria=categoria.id_categoria; */     
    
/*SELECT    
  produto.id_categoria AS id_categoria,      
  produto.id_fornecedor AS id_fornecedor         
FROM produto     
INNER JOIN categoria     
  ON produto.id_categoria=categoria.id_categoria      
INNER JOIN fornecedor     
  ON produto.id_fornecedor=fornecedor.id_fornecedor; */      
-- SELECT * FROM categoria;    
-- SELECT * FROM fornecedor;    
	
-- ALTER VIEW 
-- DROP VIEW teste; 

-- TRIGGER      
-- Nova tabela     
CREATE TABLE clientes (    
    id_cliente INT AUTOINCREMENT PRIMARY KEY,    
    nome VARCHAR(100),    
    cidade VARCHAR(100),     
    idade INT     
);    
   
CREATE TABLE log_clientes (     
    id_log INT AUTOINCREMENT PRIMARY KEY,   
    id_cliente INT,     
    nome_cliente VARCHAR(100),     
    data_insercao TIMESTAMP DEFAULT CURRENT_TIMESTMP    
);     


### Procedures - Procedimentos     
Exemplos:      
- Criar um procedimento para atualizar uma agenda;      
- Criar um procedimento para retirar informações antigas de uma tabela para incluir em uma tabela de arquivo morto.    

### Functions - Funções     
- Conjunto de códigos mais complexos para ser executado em um select.     
- Exemplo: Criar riar uma função para reajustar preços em uma tabela.     

#### Recomandações   
https://dev.mysql.com/doc     
