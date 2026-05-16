USE BibliotecaDB;  

--ALTER TABLE Emprestimos 
--ADD data_prevista DATE;   
SELECT * FROM Emprestimos;      

INSERT INTO Emprestimos 
	(id_usuario, id_funcionario, id_livro, data_prevista, status_emprestimo)
VALUES 
	(1,1,1, '2026-05-26', 'Emprestado'); 
SELECT * FROM Emprestimos;      

/*SELECT 
* 
FROM Emprestimos E 
INNER JOIN Usuarios U 
	ON E.id_usuario = U.id_usuario 
INNER JOIN Livros L 
	ON E.id_livro = L.id_livro; 
*/    

SELECT 
	U.nome AS usuario, 
	L.titulo, 
	E.data_emprestimo, 
	E.data_prevista   
FROM Emprestimos E 
INNER JOIN Usuarios U 
	ON E.id_usuario = U.id_usuario 
INNER JOIN Livros L 
	ON E.id_livro = L.id_livro; 

/* LISTAR LIVROS COM CATEGORIA E EDITORA */   
/*
SELECT 
    L.titulo, 
	C.nome_categoria, 
    E.nome_editora 
FROM Livros AS L
INNER JOIN Categorias AS C
    ON L.id_categoria = C.id_categoria
INNER JOIN Editoras AS E
    ON L.id_categoria = L.id_editora;  
*/  

/* Listar livros e autores */  
SELECT 
    L.titulo, 
    A.nome_autor 
FROM Livro_Autor LA 
INNER JOIN Livros L 
    ON LA.id_livro = L.id_livro 
INNER JOIN Autores A 
    ON LA.id_autor = A.id_autor; 

/* Quantidade de livros por categoria */  
SELECT 
    C.nome_categoria, 
    COUNT(*) AS quantidade 
FROM Livros L 
INNER JOIN Categorias C 
    ON L.id_categoria = C.id_categoria 
GROUP BY C.nome_categoria; 

/* Quantidade de empréstimos por usuário */ 
SELECT 
    U.nome, 
    COUNT(*) AS total_emprestimos 
FROM Emprestimos E 
INNER JOIN Usuarios U 
    ON E.id_usuario = U.id_usuario 
GROUP BY U.nome; 

/* VIEW 
Criar uma view de empréstimos completos */ 
CREATE VIEW vw_emprestimos 
AS 
SELECT 
    E.id_emprestimo, 
    U.nome AS usuario, 
    L.titulo, 
    F.nome_funcionario, 
    E.data_emprestimo, 
    E.data_prevista, 
    E.data_devolucao, 
    E.status_emprestimo 
FROM Emprestimos E 
INNER JOIN Usuarios U 
    ON E.id_usuario = U.id_usuario 
INNER JOIN Livros L 
    ON E.id_livro = L.id_livro 
INNER JOIN Funcionarios F 
    ON E.id_funcionario = F.id_funcionario; 

/* Consultar a View */ 
SELECT NAME FROM SYS.VIEWS; 
SELECT * FROM SYS.VIEWS; 

SELECT * FROM vw_emprestimos; 


