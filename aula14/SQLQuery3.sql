USE BibliotecaDB; 

INSERT INTO Categorias 
	nome_categoria
VALUES 
	('Tecnologia'),
	('Romance'),
	('Administra��o'),
	('Hist�ria');    
SELECT * FROM Categorias; 

INSERT INTO Editoras 
	(nome_editora, telefone)
VALUES 
	('Novatec', '1111-1111'),
	('Alta Books', '2222-2222');    
SELECT * FROM Editoras; 

INSERT INTO Autores 
	(nome_autor) 
VALUES 
	('Machado de Assis'), 
	('Robert Martin'),
	('J. K. Rowling'); 
SELECT * FROM Autores; 

INSERT INTO Livros 
	(titulo, ano_publicacao, quantidade_estoque, id_categoria, id_editora, isbn) 
VALUES 
	('Clean Code', 2010, 5, 1, 1, 221556),
	('Dom Casmurro', 1899, 3, 2, 2, 354654),
	('Harry Potter', 2021, 7, 2, 1, 544657); 
SELECT * FROM livros;  

INSERT INTO Livro_Autor 
	(id_livro, id_autor)
VALUES 
	(1,2), 
	(2,1),
	(3,3);
SELECT * FROM Livro_Autor; 

INSERT INTO Usuarios 
	(nome, cpf, telefone, email) 
VALUES 
	('Carlos Silva', '111.111.111-11', '999-9999', 'carlitos@hotmail.com'), 
	('Maria Souza', '222.222.222-22', '9999-8888', 'mariazinha@gamai.com');

-- WRONG CPF  
/*INSERT INTO Usuarios 
	(nome, cpf, telefone, email) 
VALUES  
	('Z� Ramalho', '222.222.222-22', '9999-7777', 'zeramalho@hotmail.com'); */
SELECT * FROM Usuarios; 

INSERT INTO Funcionarios 
	(nome_funcionario, cargo) 
VALUES 
	('Jo�o Bisbilhoteiro', 'Bibliotec�rio'), 
	('Ana Maria Lima', 'Atendente'); 
SELECT * FROM Funcionarios;      


