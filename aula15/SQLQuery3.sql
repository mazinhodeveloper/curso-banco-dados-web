USE BibliotecaDB;   

/* FUNCTION  
Função para calcular dias de atraso  */    
CREATE FUNCTION fn_calcular_atraso 
( 
    @data_prevista DATE, 
    @data_devolucao DATE 
) 
RETURNS INT 
AS 
BEGIN 
    DECLARE @dias INT; 
    IF @data_devolucao > @data_prevista 
        SET @dias = DATEDIFF(DAY, @data_prevista, @data_devolucao); 
    ELSE 
        SET @dias = 0;   
    RETURN @dias;  
END; 

/* Testar Function */    
SELECT dbo.fn_calcular_atraso('2025-05-01','2025-05-10') AS dias_atraso; -- 9    
SELECT dbo.fn_calcular_atraso('2025-05-10','2025-05-16') AS dias_atraso; -- 6     





 