-- DATABASE padaria_vila_romana;
USE padaria_vila_romana; 

-- Dados de Teste
-- Fornecedores
SELECT * FROM fornecedores;
-- Resultado esperado
-- Id     Nome                      Email               Celular 
-- 1      Distribuidora São Paulo   contato@dsp.com.br  11999998888 
-- 2      Alimentos Brasil          vendas@ab.com.br    11988887777 

-- Categorias
SELECT * FROM categorias;
-- Resultado esperado 
-- Id Descricao 
-- 1  Farinhas 
-- 2  Laticínios 
-- 3  Bebidas 

SELECT * FROM produtos;
-- Produtos
-- Resultado esperado 
-- Id Descricao_produto       Id_categoria  Preco_unitario 
-- 1  Farinha de Trigo 25kg   1             120.00 
-- 2  Leite Integral 1L       2             5.50 
-- 3  Refrigerante Cola 2L    3             9.90 

-- Nota Fiscal
SELECT * FROM notas_fiscais;
-- Resultado esperado 
-- Id  Id_fornecedor  Numero_nota_fiscal  Data 
-- 1   1              12345               2026-06-20 

-- Itens da Nota
SELECT * FROM itens_notas_fiscais;
-- Resultado esperado 
-- Id  Id_nota  Id_produto  Quantidade  Preco_unitario 
-- 1   1        1           10          118.00 
-- 2   1        2           50          5.20 

-- Consulta das Entradas
SELECT
    nf.numero_nota_fiscal,
    nf.data,
    f.nome AS fornecedor,
    p.descricao_produto,
    inf.quantidade,
    inf.preco_unitario,
    (inf.quantidade * inf.preco_unitario) AS total_item
FROM notas_fiscais nf
INNER JOIN fornecedores f
    ON nf.id_fornecedor = f.id
INNER JOIN itens_notas_fiscais inf
    ON nf.id = inf.id_nota
INNER JOIN produtos p
    ON inf.id_produto = p.id
ORDER BY nf.data;
-- Resultado esperado
-- Nota	    Data	    Fornecedor	            Produto	                Qtd	  Valor Unit.   Total
-- 12345	2026-06-20	Distribuidora São Paulo	Farinha de Trigo 25kg	10	  118,00	    1180,00
-- 12345	2026-06-20	Distribuidora São Paulo	Leite Integral 1L	    50	  5,20          260,00
