USE BibliotecaDB;  

SELECT * FROM Categorias; 
SELECT * FROM Editoras; 
SELECT * FROM Autores; 
SELECT * FROM livros;  
SELECT * FROM Livro_Autor; 
SELECT * FROM Usuarios; 
SELECT * FROM Funcionarios;     
/*
INSERT INTO Emprestimos 
	(id_usuario, id_funcionario, id_livro)
VALUES 
    (1, 1, 1),  -- Carlos Silva borrows Clean Code
    (2, 2, 2);  -- Maria Souza borrows Dom Casmurro
SELECT * FROM Emprestimos;   
*/    
SELECT * FROM Emprestimos;      

SELECT 
    U.nome AS Usuario,
    L.titulo AS Livro,
    E.data_emprestimo AS DataEmprestimo
FROM Emprestimos AS E
INNER JOIN Usuarios AS U
    ON E.id_usuario = U.id_usuario
INNER JOIN Livros AS L
    ON E.id_livro = L.id_livro; 