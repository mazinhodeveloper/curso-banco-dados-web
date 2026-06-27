SHOW DATABASES; 

use padaria_vila_romana; 

SELECT * FROM fornecedores; 

CREATE TABLE estoque (
id_produto INT PRIMARY KEY,
quantidade DECIMAL(10,2) DEFAULT 0,
FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

SELECT * FROM estoque;  

DELIMITER $$
CREATE TRIGGER trg_entrada_estoque
AFTER INSERT ON itens_notas_fiscais
FOR EACH ROW
BEGIN
INSERT INTO estoque VALUES (NEW.id_produto,
NEW.quantidade)
ON DUPLICATE KEY UPDATE quantidade = quantidade +
NEW.quantidade;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_saida_simulada
AFTER DELETE ON itens_notas_fiscais
FOR EACH ROW
BEGIN
UPDATE estoque SET quantidade = quantidade -
OLD.quantidade
WHERE id_produto = OLD.id_produto;
END $$
DELIMITER ; 

CREATE VIEW vw_estoque AS
SELECT p.descricao_produto, e.quantidade
FROM estoque e JOIN produtos p ON p.id =
e.id_produto; 

DELIMITER $$
CREATE FUNCTION fn_total_nota(p_id INT)
RETURNS DECIMAL(10,2)
BEGIN
DECLARE total DECIMAL(10,2);
SELECT SUM(quantidade*preco_unitario) INTO total
FROM itens_notas_fiscais WHERE id_nota=p_id;
RETURN IFNULL(total,0);
END $$
DELIMITER ; 

DELIMITER $$
CREATE PROCEDURE sp_criar_nota(p_fornecedor
INT,p_num VARCHAR(50),p_data DATE)
BEGIN
INSERT INTO notas_fiscais VALUES
(NULL,p_fornecedor,p_num,p_data);
END $$
DELIMITER ;

INSERT INTO fornecedores (nome,email) VALUES
('Fornecedor A','a@email.com');
INSERT INTO categorias (descricao) VALUES
('Farinhas');
INSERT INTO produtos
(descricao_produto,id_categoria,preco_unitario)
VALUES ('Farinha',1,10);
CALL sp_criar_nota(1,'123',NOW());
INSERT INTO itens_notas_fiscais
(id_nota,id_produto,quantidade,preco_unitario)
VALUES (1,1,5,10);

SELECT * FROM fornecedores;  
SELECT * FROM categorias;  
SELECT * FROM produtos;  
SELECT * FROM itens_notas_fiscais;  

SELECT * FROM vw_estoque;
-- Descricao_produto      Quantidade    
-- Farinha de Trigo 25kg  5.00    

SELECT fn_total_nota(1); -- 1490.00






















