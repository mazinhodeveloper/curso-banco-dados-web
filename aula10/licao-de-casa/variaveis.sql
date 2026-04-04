USE eletrocenter; 

-- 
-- ** Declaração de Variáveis (SET) ** -- 
SET @peso = 80; 
SET @altura = 1.70;  
SET @imc = @peso / (@altura * @altura);  
--
-- ** Executar SELECT ** --   
SELECT @imc AS imc_resultado;  -- Resultado esperado: 27.68     


-- ** Variáveis em Procedures (Exemplo 01) ** -- 
DELIMITER $$         
         
CREATE PROCEDURE calcular_imc()         
BEGIN         
    DECLARE peso DECIMAL(5,2);         
    DECLARE altura DECIMAL(4,2);         
    DECLARE imc DECIMAL(5,2);         
         
    SET peso = 80;         
    SET altura = 1.70;         
             
    SET imc = peso / (altura * altura);       
               
    SELECT imc AS resultado_imc;         
END $$         
         
DELIMITER ;         
         

-- ** #### Executar CALL ** -- 
CALL calcular_imc(); -- Resultado esperado: 27.68    

 
-- ** Parametros em Procedures (Exemplo 02) ** --   
DELIMITER $$        
        
CREATE PROCEDURE calcular_imc_param(IN peso DECIMAL(5,2), IN altura DECIMAL(4,2))        
BEGIN        
    DECLARE imc DECIMAL(5,2);        
        
    SET imc = peso / (altura * altura);        
        
    SELECT imc AS resultado_imc_param;        
END $$      
      
DELIMITER ;         
  

-- ** #### Executar CALL ** -- 
CALL calcular_imc_param(80, 1.70); -- Resultados esperado: 27.68      
-- CALL calcular_imc_param(90, 1.70); -- Resultados esperado: 31.14            
-- CALL calcular_imc_param(100, 1.70); -- Resultados esperado: 34.60            




