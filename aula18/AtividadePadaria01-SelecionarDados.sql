-- DATABASE padaria_vila_romana;
USE padaria_vila_romana; 

-- Dados de Teste
-- Fornecedores
SELECT * FROM fornecedores;
-- Resultado esperado
-- Id     Nome                      Email                          Celular 
-- 1      Distribuidora São Paulo   contato@dsp.com.br             11999998888 
-- 2      Alimentos Brasil          vendas@ab.com.br               11988887777 
-- 3      Moinho Paulista           contato@moinhopaulista.com.br  11987654321 
-- 4      Laticínios Vale do Leite  vendas@valedoleite.com.br      11976543210 
-- 5      Distribuidora Bom Preço   comercial@bompreco.com.br      11965432109 

-- Categorias
SELECT * FROM categorias;
-- Resultado esperado 
-- Id Descricao 
-- 1  Farinhas 
-- 2  Laticínios 
-- 3  Bebidas 
-- 4  Padaria 
-- 5  Confeitaria 

SELECT * FROM produtos;
-- Produtos
-- Resultado esperado 
-- Id Descricao_produto                Id_categoria  Preco_unitario 
-- 1  Farinha de Trigo 25kg            1             120.00 
-- 2  Leite Integral 1L                2             5.50 
-- 3  Refrigerante Cola 2L             3             9.90 
-- 4  Fermento Biológico 500g          4             18.50 
-- 5  Açúcar Refinado 5kg              4             24.90 
-- 6  Sal Refinado 1kg                 4             3.50 
-- 7  Margarina 15kg                   4             189.90 
-- 8  Óleo de Soja 900ml               4,            8.50 
-- 9  Chocolate em Pó 1kg              5,            29.90 
-- 10 Leite Condensado 395g            5,            7.50 
-- 11 Creme de Leite 200g              5,            4.20 
-- 12 Granulado Chocolate 1kg          5,            18.90 
-- 13 Coco Ralado 1kg                  5,            22.50 
-- 14 Essência de Baunilha 100ml       5,            12.90 
-- 15 Doce de Leite 1kg                5,            19.90 
-- 16 Chocolate Meio Amargo 2kg        5,            74.90 
-- 17 Emulsificante 200g               5,            9.90 
-- 18 Corante Alimentício Vermelho     5,            6.50 
-- 19 Cobertura Chocolate 1kg          5,            27.90 
-- 20 Mistura para Bolo Chocolate 5kg  5,            54.90 

-- Nota Fiscal
SELECT * FROM notas_fiscais;
-- Resultado esperado 
-- Id  Id_fornecedor  Numero_nota_fiscal  Data 
-- 1   1              12345               2026-06-20 
-- 2   3              NF2026001           2026-06-01 
-- 3   4              NF2026002           2026-06-05 
-- 4   5              NF2026003           2026-06-10 
-- 5   3              NF2026004           2026-06-15 
-- 6   4              NF2026005           2026-06-20 

-- Itens da Nota
SELECT * FROM itens_notas_fiscais;
-- Resultado esperado 
-- Id  Id_nota  Id_produto  Quantidade  Preco_unitario 
-- 1   1        1           10          118.00 
-- 2   1        2           50          5.20 
-- 3   2        4           20          18.50 
-- 4   2        5           15          24.90 
-- 5   3        6           50          3.50 
-- 6   3        7           5           189.90 
-- 7   4        8           30          8.50
-- 8   4        9           12          29.90
-- 9   4        10          24          7.50
-- 10  5        11          20          4.20
-- 11  5        12          10          18.90    
-- 12  6        13          15          22.50
-- 13  6        14          8           12.90 
-- 14  6        15          6           19.90 

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
-- Nota      Data        Fornecedor                 Descricao_produto           Quantidade  Preco_unitario  Total_item
-- NF2026001 2026-06-01  Moinho Paulista            Fermento Biológico 500g     20          18.50           370.00
-- NF2026001 2026-06-01  Moinho Paulista            Açúcar Refinado 5kg         15          24.90           373.50
-- NF2026002 2026-06-05  Laticínios Vale do Leite   Margarina 15kg              5           189.90          949.50
-- NF2026002 2026-06-05  Laticínios Vale do Leite   Sal Refinado 1kg            50          3.50            175.00
-- NF2026003 2026-06-10  Distribuidora Bom Preço    Óleo de Soja 900ml          30          8.50            255.00
-- NF2026003 2026-06-10  Distribuidora Bom Preço    Leite Condensado 395g       24          7.50            180.00
-- NF2026003 2026-06-10  Distribuidora Bom Preço    Chocolate em Pó 1kg         12          29.90           358.80
-- NF2026004 2026-06-15  Moinho Paulista            Creme de Leite 200g         20          4.20            84.00
-- NF2026004 2026-06-15  Moinho Paulista            Granulado Chocolate 1kg     10          18.90           189.00
-- NF2026000 2026-06-20  Distribuidora São Paulo    Farinha de Trigo 25kg       10          118.00          1180.00 
-- NF2026005 2026-06-20  Laticínios Vale do Leite   Essência de Baunilha 100ml  8           12.90           103.20
-- NF2026005 2026-06-20  Laticínios Vale do Leite   Coco Ralado 1kg             15          22.50           337.50
-- NF2026000 2026-06-20  Distribuidora São Paulo    Leite Integral 1L           50          5.20            260.00
-- NF2026005 2026-06-20  Laticínios Vale do Leite   Doce de Leite 1kg           6           19.90           119.40


-- Consultas de Conferência
-- Resultado esperado - Quantidades 
SELECT COUNT(*) AS fornecedores FROM fornecedores; -- 5
SELECT COUNT(*) AS categorias FROM categorias; -- 5 
SELECT COUNT(*) AS produtos FROM produtos; -- 20 
SELECT COUNT(*) AS notas_fiscais FROM notas_fiscais; -- 6 
SELECT COUNT(*) AS itens_notas_fiscais FROM itens_notas_fiscais; -- 14 
