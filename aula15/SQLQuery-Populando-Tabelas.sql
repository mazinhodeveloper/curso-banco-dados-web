USE BibliotecaDB; 

/* Populando as Tabelas */   
/* 1. Categorias (5 registros) */    
INSERT INTO Categorias 
	(nome_categoria) 
VALUES 
	('Tecnologia'), 
	('Ficção'), 
	('Negócios'), 
	('Educação'), 
	('História');    
SELECT * FROM Categorias;      

/* 2. Editoras (5 registros) */       
INSERT INTO Editoras 
	(nome_editora, telefone) 
VALUES 
	('Companhia das Letras', '1130001000'), 
	('Editora Abril', '1130002000'), 
	('Pearson', '1130003000'), 
	('O''Reilly Media', '1130004000'), 
	('HarperCollins', '1130005000');     
SELECT * FROM Editoras;      

/* 3. Autores (10 registros) */       
INSERT INTO Autores 
	(nome_autor) 
VALUES 
	('Robert C. Martin'), 
	('Andrew Hunt'), 
	('George Orwell'), 
	('Frank Herbert'), 
	('J.R.R. Tolkien'), 
	('Eric Ries'), 
	('Paulo Freire'), 
	('Yuval Noah Harari'), 
	('Martin Fowler'), 
	('Barbara Oakley');   
SELECT * FROM Autores;      

/* 4. Livros (20 registros) */       
INSERT INTO Livros 
	(titulo, ano_publicacao, quantidade_estoque, id_categoria, id_editora) 
VALUES 
	('Clean Code', 2008, 10, 1, 4), 
	('The Pragmatic Programmer', 1999, 8, 1, 4), 
	('Refactoring', 1999, 5, 1, 4), 
	('1984', 1949, 12, 2, 5),('Duna', 1965, 7, 2, 5), 
	('O Senhor dos Aneis', 1954, 9, 2, 1), 
	('A Startup Enxuta', 2011, 6, 3, 2), 
	('Pai Rico Pai Pobre', 1997, 15, 3, 2), 
	('Good to Great', 2001, 5, 3, 2), 
	('Pedagogia do Oprimido', 1968, 11, 4, 1), 
	('Como Aprender Melhor', 2014, 10, 4, 3), 
	('Didatica Magna', 1657, 4, 4, 3),   
	('Sapiens', 2011, 14, 5, 5), 
	('Armas, Germes e Aco', 1997, 7, 5, 5),   
	('Historia do Mundo', 2012, 6, 5, 1), 
	('Arquitetura Limpa', 2017, 8, 1, 4), 
	('Neuromancer', 1984, 5, 2, 5), 
	('O Poder do Habito', 2012, 9, 3, 2), 
	('Ensino Hibrido', 2015, 6, 4, 3), 
	('Guns of August', 1962, 3, 5, 5);      
SELECT * FROM Livros;      

/* 5. Relacionamento Livro_Autor (N:N) */       
/* Aqui estamos associando livros aos autores (alguns com 1 autor, outros poderiam ter mais): */    
INSERT INTO Livro_Autor 
	(id_livro, id_autor) 
VALUES 
	 (1, 1),  
	 -- Clean Code → Robert Martin
	 (2, 2),  
	 -- Pragmatic Programmer → Andrew Hunt
	 (3, 9),  
	 -- Refactoring → Fowler
	 (4, 3),  
	-- 1984 → Orwell
	(5, 4),  
	-- Duna → Herbert
	(6, 5),  
	-- LOTR → Tolkien
	(7, 6),  
	-- Startup Enxuta → Eric Ries
	(8, 6),  
	-- Pai Rico → (simplificado)
	(9, 6),
	(10, 7), 
	-- Paulo Freire
	(11, 10),
	(12, 7),
	(13, 8),
	(14, 8),
	(15, 8),
	(16, 1),
	(17, 4),
	(18, 6),
	(19, 10),
	(20, 8); 
SELECT * FROM Livro_Autor;      





