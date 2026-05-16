USE BibliotecaDB;    

/* PROCEDURE 
Procedure para realizar empréstimo  */       
CREATE PROCEDURE sp_realizar_emprestimo 
( 
    @id_usuario INT, 
    @id_funcionario INT, 
    @id_livro INT, 
    @data_prevista DATE 
) 
AS 
BEGIN 
    INSERT INTO Emprestimos 
    ( 
        id_usuario, 
        id_funcionario, 
        id_livro, 
        data_prevista 
    ) 
    VALUES 
    ( 
        @id_usuario, 
        @id_funcionario, 
        @id_livro, 
        @data_prevista 
    ); 
 
    UPDATE Livros 
    SET quantidade_estoque = quantidade_estoque - 1 
    WHERE id_livro = @id_livro; 
END; 

/* SELECT PROCEDURE */       
SELECT name, type_desc, create_date       
FROM sys.procedures      
WHERE name = 'sp_realizar_emprestimo';        


/* Executar Procedure - Exemplo */    
--EXEC sp_realizar_emprestimo 
--1, 1, 1, '2025-06-30'; 

/* Executar Procedure */  
EXEC sp_realizar_emprestimo 
1, 1, 3, '2025-05-26'; 

/* SELECT PROCEDURE */     
/* Verificando Se a Procedure Existe */     
SELECT name, type_desc, create_date       
FROM sys.procedures      
WHERE name = 'sp_realizar_emprestimo';     

/* Seleciona o Código Fonte da Procedure  */    
SELECT OBJECT_DEFINITION(OBJECT_ID('sp_realizar_emprestimo')) AS ProcedureCode; 