USE BibliotecaDB;

SELECT 
    U.nome AS Usuario,
    L.titulo AS Livro,
    E.data_emprestimo AS DataEmprestimo
FROM Emprestimos AS E
INNER JOIN Usuarios AS U
    ON E.id_usuario = U.id_usuario
INNER JOIN Livros AS L
    ON E.id_livro = L.id_livro; 