/* 
# Atividade Prática Final – MySQL Avançado 
## Escopo da Atividade 
Os alunos deverão desenvolver um mini sistema de controle de pedidos utilizando MySQL, aplicando: 

Criação de banco e tabelas 
Relacionamentos (FK)  
INSERTs  
SELECTs com JOIN  
VIEW  
FUNCTION  
PROCEDURE 
TRIGGER  
Shape 
*/ 

/*
## Contexto do Problema 
Uma pequena loja precisa de um banco de dados para controlar: 
- Clientes  
- Produtos  
- Pedidos  
- Itens dos pedidos  

### Além disso, o sistema precisa automatizar regras como: 
- Cálculo do valor total do pedido  
- Atualização automática de estoque  
- Registro de auditoria  

### Tempo estimado 
- Modelagem + criação: 30 min  
- Inserts + consultas: 30 min  
- Views + Functions: 30 min  
- Procedures: 30 min  
- Triggers: 30 min  
*/ 

/* Uso Aula */ 
-- ## Parte 1 – Criação do Banco e Tabelas 
-- ### Criar banco: 
--
USE loja_db; 

-- ### Criar tabelas: 
/*
CREATE TABLE clientes ( 
    id_cliente INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100), 
    email VARCHAR(100) 
); 
*/
-- SELECT * FROM clientes; 
 
/*
CREATE TABLE produtos ( 
    id_produto INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100), 
    preco DECIMAL(10,2), 
    estoque INT 
); 
*/
-- SELECT * FROM produtos; 

/* 
CREATE TABLE pedidos ( 
    id_pedido INT AUTO_INCREMENT PRIMARY KEY, 
    id_cliente INT, 
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) 
); 
*/
-- SELECT * FROM pedidos;  

/*
CREATE TABLE itens_pedido ( 
    id_item INT AUTO_INCREMENT PRIMARY KEY, 
    id_pedido INT, 
    id_produto INT, 
    quantidade INT, 
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido), 
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) 
); 
*/ 
-- SELECT * FROM itens_pedido; 


-- ## Parte 2 – Inserção de Dados 
-- ### Inserir no mínimo: 
-- - 3 clientes  
-- Clientes
/*
INSERT INTO clientes 
	(nome, email) 
VALUES
	('João Silva', 'joao@email.com'),
	('Maria Oliveira', 'maria@email.com'),
	('Pedro Santos', 'pedro@email.com');
*/
-- SELECT * FROM clientes; 


-- - 5 produtos  
-- Produtos
/*
INSERT INTO produtos (nome, preco, estoque) VALUES
('Notebook Dell', 2500.00, 10),
('Mouse Logitech', 50.00, 50),
('Teclado Mecânico', 200.00, 20),
('Monitor 24"', 800.00, 15),
('Webcam HD', 150.00, 30);
*/
-- SELECT * FROM produtos; 

-- - 2 pedidos com itens  
-- Pedidos e itens (2 pedidos)

/*
INSERT INTO pedidos (id_cliente) VALUES (1);  -- Pedido de João
SELECT * FROM pedidos;
*/
/*INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (1, 1, 2);  -- 2 Notebooks
SELECT * FROM itens_pedido;
*/
/*
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (1, 2, 1);  -- 1 Mouse
SELECT * FROM itens_pedido;
*/
/*
INSERT INTO pedidos (id_cliente) VALUES (2);  -- Pedido de Maria
SELECT * FROM pedidos;
*/
/*
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES (2, 3, 1);  
SELECT * FROM itens_pedido;
*/
/*
-- Somente se cadastrar pedidos demais 
-- -- TRUNCATE com FOREIGN_KEY_CHECKS
-- -- SET FOREIGN_KEY_CHECKS = 0;
-- -- TRUNCATE TABLE itens_pedido;
-- -- TRUNCATE TABLE pedidos;
-- -- SET FOREIGN_KEY_CHECKS = 1;
*/
## Parte 3 – Consultas 
### Fazer um SELECT com JOIN: 
/*
- Mostrar:  
- Nome do cliente  
- ID do pedido  
- Produto  
- Quantidade  
*/ 
/*
SELECT 
    c.nome AS cliente,
    p.id_pedido,
    pr.nome AS produto,
    ip.quantidade
FROM clientes c
JOIN pedidos p ON p.id_cliente = c.id_cliente
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produtos pr ON ip.id_produto = pr.id_produto;
*/ 
/*
-- Somente o id 1 = João Silva
SELECT 
    c.id_cliente,
    c.nome,
    SUM(pr.preco * ip.quantidade) AS total_gasto
FROM clientes c
JOIN pedidos p ON p.id_cliente = c.id_cliente
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produtos pr ON ip.id_produto = pr.id_produto
WHERE c.id_cliente = 1 -- 2 = Maria
GROUP BY c.id_cliente, c.nome;
*/


/* 
## Parte 4 – VIEW 
### Criar uma VIEW: 
CREATE VIEW vw_resumo_pedidos AS 
SELECT  
    p.id_pedido, 
    c.nome AS cliente, 
    pr.nome AS produto, 
    ip.quantidade, 
    pr.preco, 
    (ip.quantidade * pr.preco) AS total_item 
FROM pedidos p 
JOIN clientes c ON p.id_cliente = c.id_cliente 
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido 
JOIN produtos pr ON ip.id_produto = pr.id_produto; 
*/ 
-- SELECT * FROM vw_resumo_pedidos; 

/*
## Parte 5 – FUNCTION 
### Criar função: 
-- Objetivo: Calcular total de um pedido 
DELIMITER $$ 
 
CREATE FUNCTION fn_total_pedido(p_id INT) 
RETURNS DECIMAL(10,2) 
DETERMINISTIC 
BEGIN 
    DECLARE total DECIMAL(10,2); 
 
    SELECT SUM(ip.quantidade * pr.preco) 
    INTO total 
    FROM itens_pedido ip 
    JOIN produtos pr ON ip.id_produto = pr.id_produto 
    WHERE ip.id_pedido = p_id; 
 
    RETURN total; 
END $$ 
 
DELIMITER ; 
*/
-- SELECT fn_total_pedido(1);

## Parte 6 – PROCEDURE 
### Criar procedure: 
-- Objetivo: Inserir um novo pedido 
/*
DELIMITER $$ 
 
CREATE PROCEDURE sp_novo_pedido( 
    IN p_cliente INT, 
    IN p_produto INT, 
    IN p_quantidade INT 
) 
BEGIN 
    DECLARE v_pedido INT; 
 
    INSERT INTO pedidos (id_cliente) 
    VALUES (p_cliente); 
 
    SET v_pedido = LAST_INSERT_ID(); 
 
    INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) 
    VALUES (v_pedido, p_produto, p_quantidade); 
END $$ 
 
DELIMITER ; 
*/
-- CALL sp_novo_pedido(3, 4, 1); 
/* ## 1. Ver o pedido criado
SELECT * FROM pedidos
ORDER BY id_pedido DESC;

## Ver o item do pedido
SELECT * FROM itens_pedido
ORDER BY id_item DESC;
*/

/* 
## Parte 7 – TRIGGER 
### Trigger 1 – Baixar estoque 
DELIMITER $$ 
 
CREATE TRIGGER trg_baixa_estoque 
AFTER INSERT ON itens_pedido 
FOR EACH ROW 
BEGIN 
    UPDATE produtos 
    SET estoque = estoque - NEW.quantidade 
    WHERE id_produto = NEW.id_produto; 
END $$ 
 
DELIMITER ; 
*/

-- Mostrar TRIGGERS   
-- SHOW TRIGGERS;


/* 
### Trigger 2 – Auditoria 
#### Criar tabela: 
CREATE TABLE auditoria_produtos ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    produto_id INT, 
    estoque_antigo INT, 
    estoque_novo INT, 
    data_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP 
); 
*/
-- SELECT * FROM auditoria_produtos; 

/*
## Trigger: 
DELIMITER $$ 
 
CREATE TRIGGER trg_auditoria_estoque 
BEFORE UPDATE ON produtos 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria_produtos ( 
        produto_id, 
        estoque_antigo, 
        estoque_novo 
    ) 
    VALUES ( 
        OLD.id_produto, 
        OLD.estoque, 
        NEW.estoque 
    ); 
END $$ 
 
DELIMITER ; 
*/
-- Mostrar TRIGGERS   
SHOW TRIGGERS;

/* 
### Consulta do professor 
#### Exemplo da Aula 
SELECT 
    c.nome,
    p.id_pedido,
    pr.nome AS produto,
    ip.quantidade
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
JOIN produtos pr ON ip.id_produto = pr.id_produto;
*/


 