-- DB gatilho   
-- CREATE DATABASE gatilho;    

-- USE gatilho;   
/*
-- TRIGGER      
-- Nova tabela     
CREATE TABLE clientes (    
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,    
    nome VARCHAR(100),    
    cidade VARCHAR(100),     
    idade INT     
);    
   
CREATE TABLE log_clientes (     
    id_log INT AUTO_INCREMENT PRIMARY KEY,   
    id_cliente INT,     
    nome_cliente VARCHAR(100),     
    data_insercao TIMESTAMP DEFAULT CURRENT_TIMESTAMP    
);     
*/

/*     
-- Conceito de Trigger     
-- Principais funções:      
Automatização: Dispara ações sem precisar que o usuário ou aplicação faça manualmente.    
Eventos: Insert, update, delete.    
Funcionamento: Linha a linha (FOR EACH ROW), ou seja, cada registro afetado pelo comando dispara um trigger.    
Uso comum: Auditoria de dados, manutenção de integridade, preenchimento automático de campos ou registros, Criação de logs.    
    
NEW representa os valores novos em INSERT ou UPDATE     
OLD representa os valores antigos em UPDATE ou DELETE.    
    
Funciona como um sensor dentro do banco de dados que reage automaticamente a mudanças em uma tabela.     
*/   

/*
-- Criando um TRIGGER    
DELIMITER $$     
CREATE TRIGGER trg_log_insercao_cliente     
AFTER INSERT ON clientes    
FOR EACH ROW    
BEGIN     
  INSERT INTO log_clientes (id_cliente, nome_cliente)    
  VALUES (NEW.id_cliente, NEW.nome);     
 END$$    
 DELIMITER ;     
 */   
 
USE gatilho;     
/*  
INSERT INTO clientes (nome, cidade, idade)    
  VALUES ('João Batista', 'São Paulo', 40);    
*/     
   
SELECT * FROM clientes;    
SELECT * FROM log_clientes;     
  
 
