> Aula 10   
> Docente: Celso Luis Caldeira    
> Data: 21/03/2026   
   
# Banco de Dados para Web - 84 horas  
Aprender a aplicar e manipular dados em um sistema gerenciador de banco de dados, conectando com a linguagem de programação.   
Período: 17/01/2026 a 27/06/2026    
Horário: Sábado - 08h às 12h    
https://www.sp.senac.br/senac-lapa-tito/cursos-livres/curso-de-banco-de-dados-para-web   
   
## GitHub / Curso Banco de Dados para Web  
https://github.com/mazinhodeveloper/curso-banco-dados-web   

   
### Projeto   
| Requisitos do Projeto      | URL                           |   
|--------------------------- | ----------------------------- |   
| XAMPP                      | https://www.apachefriends.org |   
   
### Rodando o Projeto 
| Diretório             | URL                   |   
|---------------------- |---------------------- |   
| Local                 | http://localhost      |      
| Local / PHPMyAdmin    | http://localhost/phpmyadmin |      

### Atividades  
Atividades desenvolvidas em sala de aula.    
- Usando PHPMyAdmin    

SHOW DATABASES;    

USE eletrocenter;    
USE eletrocenter;    
    
/*    
CREATE TABLE auditoria_log (
    id_log INT AUTO_INCREMENT PRIMARY KEY,    
    id_usuario INT NOT NULL,    
    tabela_afetada VARCHAR(50) NOT NULL,    
    operacao ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,    
    id_registro INT NOT NULL,      
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,    
    detalhe TEXT NULL,     
    KEY idx_log_usuario(id_usuario),     
    KEY idx_log_data(data_hora),    
    KEY idx_log_tabela(tabela_afetada),     
    CONSTRAINT fk_log_usuario FOREIGN KEY (id_usuario)     
    REFERENCES usuario(id_usuario)     
    ON UPDATE CASCADE      
    ON DELETE RESTRICT      
);      
*/        
-- SELECT * FROM auditoria_log;      
/*       
O que é um Trigger       
• Um trigger em mysql é objeto do banco de dados que é um tipo de gatilho que é disparado automaticamente que usamos as operações INSERT, UPDATE, DELETE, afetando uma ou mais tabelas.       
• Garante assim integridade, confiabilidade, automatiza tarefas, e ocorre antes ou depois da operação.       
 */        
/*             
DELIMITER $$      
DROP TRIGGER IF EXISTS trg_produto_auditoria_update $$     
     
CREATE TRIGGER trg_produto_auditoria_update        
AFTER UPDATE ON produto        
FOR EACH ROW        
BEGIN        
	INSERT INTO auditoria_log        
    (         
		id_usuario,        
        tabela_afetada,        
        operacao,        
        id_registro,        
        detalhe        
	)        
    VALUES        
    (        
		COALESCE(@id_usuario_log, 1),        
        'produto',        
        'UPDATE',        
        NEW.id_produto,        
        CONCAT(        
			'Produto alterado. ',        
            'Descrição: ', OLD.descricao, ' ->', NEW.descricao,        
			'; Preço: ', OLD.preco, ' -: ', NEW.preco,        
            '; Custo: ', OLD.custo, ' -: ', NEW.custo,        
            '; Ativo: ', OLD.ativo, ' -: ', NEW.ativo        
        )        
    );         
END $$             
DELIMITER ;         
*/        
/*         
Trigger com explicação         
DELIMITER $$  // Inicia a operação         
DROP TRIGGER IF EXISTS trg_produto_auditoria_update $$ // Excluir a trigger se existir         
          
CREATE TRIGGER trg_produto_auditoria_update // Dá o nome da trigger         
AFTER UPDATE ON produto // Ação ( após o update na tabela produto)         
FOR EACH ROW // Vamos afetar uma linha         
BEGIN // Inicio do processo         
    INSERT INTO auditoria_log         
   (         
       id_usuario,         
      tabela_afetada,         
       operacao,         
       id_registro,         
       detalhe         
   )         
   VALUES         
   (         
      COALESCE(@id_usuario_log, 1),  // Pegar o id do usuário que será informado antes do update         
       'produto',         
       'UPDATE',         
      NEW.id_produto,         
       CONCAT( // Função de concatenação         
           'Produto alterado.',         
          'Descrição: ', OLD.descricao, ' -> ', NEW.descricao, // old= valor antigo e new= novo valor         
           '; Preço: ', OLD.preco, ' -: ', NEW.preco,         
           '; Custo: ', OLD.custo, ' -: ', NEW.custo,         
           '; Ativo: ', OLD.ativo, ' -: ', NEW.ativo         
           )         
   );         
END $$  // Finaliza o processo         
DELIMITER ; // Finaliza a trigger         
*/           
-- SHOW TRIGGERS;             
-- SELECT * FROM produto;              
/*            
SET @id_usuario_log = 5;              
             
UPDATE produto SET custo=400, preco=600              
WHERE id_produto=2;            
-- WHERE id_produto=1;         
             
SELECT * FROM produto;             
                  
SELECT * FROM auditoria_log;             
*/        
/*             
SET @id_usuario_log = 5;     
       
UPDATE produto SET custo = 400, preco=600 WHERE id_produto=2;      
        
SELECT * FROM auditoria_log;     
*/        
/*        
O que é uma View       
Uma View é uma tabela virtual baseada em uma consulta complexa para facilitar a execução da consulta       
        
Como Criar a View (Exemplo)       
CREATE OR REPLACE VIEW vw_pedido_resumo AS        
       
select produto.nome as nome_produto,categoria.nome as nome_categoria,preco from produto inner join categoria on produto.id_categoria=categoria.id_categoria;       
        
Como executar a View              
select * from vw_pedido_resumo;       
*/       
/*       
CREATE OR REPLACE VIEW vw_pedido_resumo AS         
SELECT produto.nome AS nome_produto, categoria.nome AS              
nome_categoria,preco FROM produto      
INNER JOIN categoria ON            
produto.id_categoria=categoria.id_categoria;     
       
SELECT * FROM vw_pedido_resumo;      
       
-- Podemos usar WHERE    
SELECT * FROM vw_pedido_resumo WHERE nome_categoria='Gabinetes';        
*/       
-- SELECT * FROM vw_pedido_resumo WHERE nome_categoria='Gabinetes';     
      
/*      
-- CRIANDO FUNÇÂO       
 DELIMITER $$      
 DROP FUNCTION IF EXISTS fn_margem_lucro $$         
 CREATE FUNCTION fn_margem_lucro (         
	p_custo DECIMAL(10,2),         
    p_preco DECIMAL(10,2)         
 )         
 RETURNS DECIMAL(10,2)         
 DETERMINISTIC         
 BEGIN         
	DECLARE v_margem DECIMAL(10,2);          
    if p_custo <= 0 THEN          
		RETURN 0.00;         
	END IF;         
             
    SET v_margem = ((p_preco - p_custo) / p_custo) * 100;         
    RETURN v_margem;         
        
END $$          
DELIMITER ;         
*/      
-- Executando a function             
-- SELECT fn_margem_lucro(50.00, 75.00) AS margem;        
       
-- SELECT * FROM cliente;             
/* */               
/*               
-- Trigger com explicação         
DELIMITER $$  -- Inicia a operação         
DROP TRIGGER IF EXISTS trg_cliente_auditoria_update $$ -- Excluir a trigger se existir         
          
CREATE TRIGGER trg_cliente_auditoria_update -- Dá o nome da trigger         
AFTER UPDATE ON cliente -- Ação ( após o update na tabela produto)         
FOR EACH ROW -- Vamos afetar uma linha         
BEGIN -- Inicio do processo         
    INSERT INTO auditoria_log         
   (         
	  id_usuario,         
      tabela_afetada,         
	  operacao,         
	  id_registro,         
	  detalhe         
   )         
   VALUES         
   (         
      COALESCE(@id_usuario_log, 1),  -- Pegar o id do usuário que será informado antes do update         
       'cliente',         
       'UPDATE',         
      NEW.id_cliente,         
       CONCAT( -- Função de concatenação         
		 'Cliente alterado.',         
          'Descrição: ', OLD.descricao, ' -> ', NEW.descricao, -- old= valor antigo e new= novo valor         
           '; Celular: ', OLD.celular, ' -: ', NEW.celular,         
           '; E-mail: ', OLD.email, ' -: ', NEW.email,         
           '; Ativo: ', OLD.ativo, ' -: ', NEW.ativo         
           )         
   );         
END $$  -- Finaliza o processo         
DELIMITER ; -- Finaliza a trigger         
             
SET @id_usuario_log = 5;             
UPDATE cliente SET nome_razao='Serviços Nacional do Comercio',email='contato@senac.com.br',celular='(11) 99999-8888' WHERE id_cliente=1;    
*/    
             
-- SELECT * FROM auditoria_log;    
-- SELECT * FROM cliente;       

/*      
USE eletrocenter;      

/*                   
-- Trigger com explicação         
DELIMITER $$  -- Inicia a operação         
DROP TRIGGER IF EXISTS trg_cliente_auditoria_update $$ -- Excluir a trigger se existir         
          
CREATE TRIGGER trg_cliente_auditoria_update -- Dá o nome da trigger         
AFTER UPDATE ON cliente -- Ação ( após o update na tabela produto)         
FOR EACH ROW -- Vamos afetar uma linha         
BEGIN -- Inicio do processo         
    INSERT INTO auditoria_log         
   (         
	  id_usuario,         
      tabela_afetada,         
	  operacao,         
	  id_registro,         
	  detalhe         
   )         
   VALUES         
   (         
      COALESCE(@id_usuario_log, 1),  -- Pegar o id do usuário que será informado antes do update         
       'cliente',         
       'UPDATE',         
      NEW.id_cliente,         
       CONCAT( -- Função de concatenação         
		 'Cliente alterado. ',         
          'Descrição: ', OLD.descricao, ' -> ', NEW.descricao, -- old= valor antigo e new= novo valor         
           '; Celular: ', OLD.celular, ' -: ', NEW.celular,         
           '; E-mail: ', OLD.email, ' -: ', NEW.email,         
           '; Ativo: ', OLD.ativo, ' -: ', NEW.ativo         
           )         
   );                      
END $$  -- Finaliza o processo                      
DELIMITER ; -- Finaliza a trigger                      
             
SET @id_usuario_log = 5;             
UPDATE cliente SET nome_razao='Serviços Nacional do Comercio',email='contato@senac.com.br',celular='(11) 99999-8888' WHERE id_cliente=1;                 
*/                   

DELIMITER $$             
DROP TRIGGER IF EXISTS trg_cliente_auditoria_update $$             
              
CREATE TRIGGER trg_cliente_auditoria_update             
AFTER UPDATE ON cliente             
FOR EACH ROW              
BEGIN             
	INSERT INTO auditoria_log             
    (             
        id_usuario,             
        tabela_afetada,             
        operacao,             
        id_registro,             
        detalhe             
    )             
    VALUES             
    (             
        COALESCE(@id_usuario_log, 1),             
        'cliente',             
        'UPDATE',             
        NEW.id_cliente,             
        CONCAT(             
            'Cliente alterado.',             
            'Razão Social: ', OLD.nome_razao, ' -> ', NEW.nome_razao,             
            '; Celular: ', OLD.telefone, ' -: ', NEW.telefone,             
            '; E-mail: ', OLD.email, ' -: ', NEW.email,             
            '; Ativo: ', OLD.ativo, ' -: ', NEW.ativo             
            )             
    );             
END $$             
DELIMITER ;             
              
SET @id_usuario_log = 1;             
UPDATE cliente SET nome_razao='Serviços Nacional do Comercio',email='contato@senac.com.br',telefone='(11) 99999-8888' WHERE id_cliente=1;      
      
SELECT * FROM auditoria_log;      
SELECT * FROM cliente;               
       
### Material (Diretório)    
- aula_130326.pptx    
- exemplos_mysql_basico_intermediario.pdf    
- funcoes_mysql_1.docx     
   
#### Recomandações    
https://dev.mysql.com/doc      
https://dev.mysql.com/doc/refman/8.0/en/triggers.html       
https://dev.mysql.com/doc/refman/8.0/en/trigger-syntax.html      
https://dev.mysql.com/doc/refman/8.0/en/trigger-metadata.html       

  