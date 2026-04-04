> Aula 10 - Lição de Casa     
> Docente: Celso Luis Caldeira     
> Data: 04/04/2026     
        
## Variáveis no banco de dados       
Variáveis no banco de dados Variável: Em programação uma variável é um espaço na memória que contem um nome e um valor.       
Ex:          
nome = 'Maria Rita', Idade=30, data_nascimento='30/08/1995'          
Podemos usar variáveis em funções ou procedures no banco de dados.           
No exercício a seguir podemos criar essas variáveis para obter os resultados desejados.             
Algumas linguagens de programação não precisam declarar a variável mas no banco usamos o SET para declarar.       
    
Exemplo:       
SET peso = 80;       
SET altura = 1.70;   

### Variáveis no Banco de Dados     
Em programação, uma variável é um espaço na memória que possui:     
- Nome       
- Valor       
- Tipo de dado      
> Ela é utilizada para armazenar informações temporárias que podem ser usadas em cálculos, comparações, funções ou procedures.      
#### Exemplo conceitual (programação em geral):      
nome = 'Maria Rita'      
idade = 30     
data_nascimento = '30/08/1995'     
> Esses valores ficam guardados na memória enquanto o programa está em execução.     

### Uso de Variáveis no Banco de Dados       
No banco de dados, também utilizamos variáveis, principalmente em:      
- Functions       
- Procedures      
- Triggers      
- Scripts SQL      
> Diferente de algumas linguagens de programação (como Python ou JavaScript), nos bancos de dados normalmente precisamos declarar a variável antes de usá‑la.    
       
### Declaração de Variáveis (SET)
Em muitos bancos de dados (como MySQL), usamos o comando SET para atribuir valores às variáveis.       
    
Exemplo:       
SET @peso = 80;      
SET @altura = 1.70;        
> O @ indica que a variável é do tipo sessão (válida enquanto a conexão estiver ativa).     
      
### Exemplo Prático: Cálculo de IMC     
Podemos utilizar essas variáveis para realizar cálculos no banco.     
Fórmula do IMC     
IMC = peso / (altura × altura)       
       
#### Script completo       
SET @peso = 80;       
SET @altura = 1.70;       
SET @imc = @peso / (@altura * @altura);       
         
#### Executar SELECT     
SELECT @imc AS imc_resultado;       
       
#### Resultado esperado    
imc_resultado     
27.68     
      
### Variáveis em Procedures (Exemplo 01)        
Em stored procedures, as variáveis normalmente são declaradas com DECLARE.       
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
      
#### Executar CALL     
CALL calcular_imc();      
         
#### Resultado esperado    
resultado_imc       
27.68       
         
### Parametros em Procedures (Exemplo 02)     
DELIMITER $$        
        
CREATE PROCEDURE calcular_imc_param(IN peso DECIMAL(5,2), IN altura DECIMAL(4,2))        
BEGIN        
    DECLARE imc DECIMAL(5,2);        
        
    SET imc = peso / (altura * altura);        
        
    SELECT imc AS resultado_imc_param;        
END $$      
      
DELIMITER ;         
      
#### Executar CALL     
CALL calcular_imc_param(80, 1.70);      
CALL calcular_imc_param(90, 1.70);        
CALL calcular_imc_param(100, 1.70);        
       
#### Resultados esperado     
resultado_imc_param       
27.68      
31.14        
34.60          


## Criar uma função para cálculo do IMC fn_imc()        
No select informar altura e peso.        
A função vai efetuar a fórmula: peso / (altura * altura)         
        
Exemplo:      
SELECT fn_imc(80, 1.70) AS imc.         
Irá retornar seu índice de massa corporal              
        
### Exemplo de criação da função fn_imc        
IMC = peso / (altura * altura)     
         
DELIMITER $$         
         
CREATE FUNCTION fn_imc(peso DECIMAL(5,2), altura DECIMAL(4,2))         
RETURNS DECIMAL(5,2)         
DETERMINISTIC         
BEGIN         
    RETURN peso / (altura * altura);         
END$$         
         
DELIMITER ;         
         
#### Executar SELECT             
SELECT fn_imc(80, 1.70) AS imc;                 
         
#### Resultado esperado    
imc       
27.68         
       
      