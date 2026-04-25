CREATE DATABASE padaria; 

USE padaria; 

CREATE TABLE produtos (
	id_produtos INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	nome VARCHAR(60) NOT NULL,
	id_categoria INT, 
	preco DECIMAL(18,2)
); 

SELECT * FROM produtos; 


INSERT INTO 
	produtos (nome,preco) 
VALUES 
	('Pão Francês', 1.2); 
INSERT INTO 
	produtos (nome,preco) 
VALUES 
	('Café Express', 5.0);

SELECT * FROM produtos;  

UPDATE produtos SET preco=4.5 WHERE id_produtos=2;  

SELECT * FROM produtos;  

DELETE FROM produtos WHERE id_produtos=2; 

SELECT * FROM produtos;  



	
