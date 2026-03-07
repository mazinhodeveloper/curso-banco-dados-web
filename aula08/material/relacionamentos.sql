-- DB relacionamentos   
CREATE DATABASE relacionamento;    

-- LIMPEZA (se já existirem)
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS cidades;
 
-- TABELA DE DIMENSÃO
CREATE TABLE cidades (
  id INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- TABELA DE FATO (cidade_id opcional para gerar LEFT-only)
CREATE TABLE clientes (
  id INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cidade_id INT NULL,
  CONSTRAINT fk_clientes_cidades
    FOREIGN KEY (cidade_id) REFERENCES cidades(id)
    ON UPDATE CASCADE
    ON DELETE SET NULL   -- se a cidade for removida, cliente fica sem cidade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- POPULA CIDADES
INSERT INTO cidades (id, nome) VALUES
  (1, 'São Paulo'),
  (2, 'Rio de Janeiro'),
  (3, 'Belo Horizonte'),
  (4, 'Curitiba'),       -- ficará sem clientes (RIGHT-only)
  (5, 'Porto Alegre');   -- ficará sem clientes (RIGHT-only)
 
-- POPULA CLIENTES
INSERT INTO clientes (id, nome, cidade_id) VALUES
  (101, 'Ana', 1),       -- tem cidade (match)
  (102, 'Bruno', 1),     -- tem cidade (match)
  (103, 'Carla', 2),     -- tem cidade (match)
  (104, 'Diego', 3),     -- tem cidade (match)
  (105, 'Eva', NULL),    -- sem cidade (LEFT-only)
  (106, 'Fábio', NULL);  -- sem cidade (LEFT-only)  


-- Rodar esse script    
USE relacionamento;  

-- SELECT
SELECT * FROM clientes;
 
SELECT * FROM cidades;
 
-- INNER JOIN 
SELECT 
  c.id AS cliente_id, 
  c.nome AS cliente, 
  ci.nome AS cidade 
FROM clientes c 
INNER JOIN cidades ci 
 ON c.cidade_id = ci.id 
ORDER BY c.id;
 
-- LEFT JOIN 
SELECT 
  c.id AS cliente_id, 
  c.nome AS cliente, 
COALESCE(ci.nome, 'Sem cidade') AS cidade 
FROM clientes c 
LEFT JOIN cidades ci 
  ON c.cidade_id = ci.id 
ORDER BY c.id;   

-- Testem também o RIGHT JOIN  
SELECT
  ci.id AS cidade_id,
  ci.nome AS cidade,
  c.id AS cliente_id,
  c.nome AS cliente
FROM clientes c
RIGHT JOIN cidades ci
 ON c.cidade_id = ci.id
ORDER BY ci.id, c.id;

-- O FULL OUTER JOIN, pouco usado  
SELECT 
  COALESCE(c.id, 0)                AS cliente_id, 
  COALESCE(c.nome, 'Sem cliente')  AS cliente, 
  COALESCE(ci.id, 0)               AS cidade_id, 
  COALESCE(ci.nome, 'Sem cidade')  AS cidade 
FROM clientes c 
LEFT JOIN cidades ci 
  ON c.cidade_id = ci.id 
 
UNION
 
SELECT
  COALESCE(c.id, 0)                AS cliente_id, 
  COALESCE(c.nome, 'Sem cliente')  AS cliente, 
  COALESCE(ci.id, 0)               AS cidade_id, 
  COALESCE(ci.nome, 'Sem cidade')  AS cidade 
FROM clientes c 
RIGHT JOIN cidades ci 
  ON c.cidade_id = ci.id 
WHERE c.id IS NULL 
ORDER BY cliente_id, cidade_id; 

