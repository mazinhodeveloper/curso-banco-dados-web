USE eletrocenter; 

 -- Criando uma função para cálculo do IMC calcular_imc():       
/*         
No select informar altura e peso.        
A função vai efetuar a fórmula: peso / (altura * altura)         
              
Ex:             
SELECT fn_imc(80, 1.70) AS imc.         
Irá retornar seu índice de massa corporal              
*/         
         
-- ** Exemplo de criação da função calcular_imc() ** --      
-- imc = peso / (altura * altura)            
         
DELIMITER $$             
        
CREATE FUNCTION calcular_imc(peso DECIMAL(5,2), altura DECIMAL(4,2))         
RETURNS DECIMAL(5,2)         
DETERMINISTIC         
BEGIN         
	DECLARE imc DECIMAL(5,2);         
    SET imc = peso / (altura * altura);         
    RETURN imc;         
END$$        
        
DELIMITER ;             
               
-- ** Executar SELECT ** --             
SELECT calcular_imc(98, 1.75) AS classificação; -- Resultado esperado: 32.00             
        
        
-- ** Criando outra função e executando a função classificar_imc() ** --        
DELIMITER $$        
         
CREATE FUNCTION classificar_imc(peso DECIMAL(5,2), altura DECIMAL(4,2))        
RETURNS VARCHAR(20)        
DETERMINISTIC        
BEGIN        
	DECLARE imc DECIMAL(5,2);        
    DECLARE classificacao VARCHAR(20);        
    SET imc = peso / (altura * altura);        
    IF imc < 18.5 THEN        
    	SET classificacao = 'Abaixo do Peso';        
    ELSEIF imc >= 18.5 AND imc < 25 THEN        
    	SET classificacao = 'Peso Normal';        
    ELSEIF imc >= 25 AND imc < 30 THEN        
    	SET classificacao = 'Sobrepeso';        
    ELSE        
        SET classificacao = 'Obesidade';        
    END IF;        
    RETURN classificacao;        
END$$        
         
DELIMITER ;        
        
-- ** Executar SELECT ** --          
SELECT classificar_imc(59, 1.87) AS classificacao; -- Resultado esperado: Abaixo do Peso         
SELECT classificar_imc(68, 1.74) AS classificacao; -- Resultado esperado: Peso Normal             
SELECT classificar_imc(77, 1.72) AS classificacao; -- Resultado esperado: Sobrepeso             
SELECT classificar_imc(98, 1.75) AS classificacao; -- Resultado esperado: Obesidade             
          


