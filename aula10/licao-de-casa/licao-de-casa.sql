USE eletrocenter; 

 -- Criar uma função para cálculo do IMC fn_imc():        
/* 
No select informar altura e peso.        
A função vai efetuar a fórmula: peso / (altura * altura)         

Ex:     
SELECT fn_imc(80, 1.70) AS imc.         
Irá retornar seu índice de massa corporal              
*/ 

-- ** Exemplo de criação da função fn_imc ** --      
-- IMC = peso / (altura * altura)    

DELIMITER $$

CREATE FUNCTION fn_imc(peso DECIMAL(5,2), altura DECIMAL(4,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    RETURN peso / (altura * altura);
END$$

DELIMITER ;


-- ** Executar SELECT ** --   
SELECT fn_imc(80, 1.70) AS imc; -- Resultado esperado: 27.68  


