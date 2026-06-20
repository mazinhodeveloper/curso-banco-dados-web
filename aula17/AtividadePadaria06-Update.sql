-- DATABASE padaria_vila_romana; 
USE padaria_vila_romana; 

UPDATE notas_fiscais
SET numero_nota_fiscal = 'NF2026000'
WHERE Id = 1;

SELECT * FROM notas_fiscais;
-- Resultado esperado 
-- Id  Id_fornecedor  Numero_nota_fiscal  Data 
-- 1   1              NF2026000           2026-06-20 
-- 2   3              NF2026001           2026-06-01 
-- 3   4              NF2026002           2026-06-05 
-- 4   5              NF2026003           2026-06-10 
-- 5   3              NF2026004           2026-06-15 
-- 6   4              NF2026005           2026-06-20 


