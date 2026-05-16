USE BibliotecaDB;      

/* TRIGGER 
Trigger para devolução 
Quando o livro for devolvido: 
Atualiza o status 
Atualiza estoque 
Gera multa se houver atraso  */  
CREATE TRIGGER trg_devolucao 
ON Emprestimos 
AFTER UPDATE 
AS 
BEGIN  
    IF UPDATE(data_devolucao) 
    BEGIN  
        UPDATE Emprestimos 
        SET status_emprestimo = 'DEVOLVIDO' 
        FROM Emprestimos AS E 
        INNER JOIN inserted AS I 
            ON E.id_emprestimo = I.id_emprestimo; 
 
        UPDATE Livros 
        SET quantidade_estoque = quantidade_estoque + 1 
        FROM Livros AS L 
        INNER JOIN inserted AS I           
            ON L.id_livro = I.id_livro; 
 
         
        INSERT INTO Multas 
        ( 
            id_emprestimo, 
            valor, 
            dias_atraso 
        ) 
		SELECT 
            I.id_emprestimo, 
            dbo.fn_calcular_atraso(I.data_prevista, I.data_devolucao) * 2.50, 
            dbo.fn_calcular_atraso(I.data_prevista, I.data_devolucao) 
        FROM inserted I 
        WHERE dbo.fn_calcular_atraso(I.data_prevista, I.data_devolucao) > 0;   
    END 
END; 

/* Teste da Trigger 
Registrar devolução */      
UPDATE Emprestimos    
SET data_devolucao = '2025-07-10'    
WHERE id_emprestimo = 1;    



