-- DATABASE padaria_vila_romana;
USE padaria_vila_romana; 

-- Dados de Teste
-- Fornecedores
INSERT INTO fornecedores 
    (nome, email, celular)
VALUES
    ('Distribuidora São Paulo', 'contato@dsp.com.br', '11999998888'),
    ('Alimentos Brasil', 'vendas@ab.com.br', '11988887777');

-- Categorias
INSERT INTO categorias 
    (descricao)
VALUES
    ('Farinhas'),
    ('Laticínios'),
    ('Bebidas');

-- Produtos
INSERT INTO produtos
    (descricao_produto, id_categoria, preco_unitario)
VALUES
    ('Farinha de Trigo 25kg', 1, 120.00),
    ('Leite Integral 1L', 2, 5.50),
    ('Refrigerante Cola 2L', 3, 9.90);

-- Nota Fiscal
INSERT INTO notas_fiscais
    (id_fornecedor, numero_nota_fiscal, data)
VALUES
    (1, '12345', '2026-06-20');

-- Itens da Nota
INSERT INTO itens_notas_fiscais
    (id_nota, id_produto, quantidade, preco_unitario)
VALUES
    (1, 1, 10, 118.00),
    (1, 2, 50, 5.20);

