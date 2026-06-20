-- DATABASE padaria_vila_romana;
USE padaria_vila_romana; 

-- Dados de Teste
-- Fornecedores
INSERT INTO fornecedores 
    (nome, email, celular) 
VALUES
    ('Moinho Paulista', 'contato@moinhopaulista.com.br', '11987654321'),
    ('Laticínios Vale do Leite', 'vendas@valedoleite.com.br', '11976543210'),
    ('Distribuidora Bom Preço', 'comercial@bompreco.com.br', '11965432109');

-- Categorias
INSERT INTO categorias 
    (descricao)
VALUES
    ('Padaria'),
    ('Confeitaria');

-- Produtos
INSERT INTO produtos
    (descricao_produto, id_categoria, preco_unitario)
VALUES
    ('Fermento Biológico 500g', 4, 18.50),
    ('Açúcar Refinado 5kg', 4, 24.90),
    ('Sal Refinado 1kg', 4, 3.50),
    ('Margarina 15kg', 4, 189.90),
    ('Óleo de Soja 900ml', 4, 8.50),
    ('Chocolate em Pó 1kg', 5, 29.90),
    ('Leite Condensado 395g', 5, 7.50),
    ('Creme de Leite 200g', 5, 4.20),
    ('Granulado Chocolate 1kg', 5, 18.90),
    ('Coco Ralado 1kg', 5, 22.50),
    ('Essência de Baunilha 100ml', 5, 12.90),
    ('Doce de Leite 1kg', 5, 19.90),
    ('Chocolate Meio Amargo 2kg', 5, 74.90),
    ('Emulsificante 200g', 5, 9.90),
    ('Corante Alimentício Vermelho', 5, 6.50),
    ('Cobertura Chocolate 1kg', 5, 27.90),
    ('Mistura para Bolo Chocolate 5kg', 5, 54.90);

-- Nota Fiscal
INSERT INTO notas_fiscais
    (id_fornecedor, numero_nota_fiscal, data)
VALUES 
    (3, 'NF2026001', '2026-06-01'),
    (4, 'NF2026002', '2026-06-05'),
    (5, 'NF2026003', '2026-06-10'),
    (3, 'NF2026004', '2026-06-15'),
    (4, 'NF2026005', '2026-06-20');

-- Itens da Nota
INSERT INTO itens_notas_fiscais
    (id_nota, id_produto, quantidade, preco_unitario)
VALUES 
    (2, 4, 20, 18.50),
    (2, 5, 15, 24.90),

    (3, 6, 50, 3.50),
    (3, 7, 5, 189.90),

    (4, 8, 30, 8.50),
    (4, 9, 12, 29.90),
    (4, 10, 24, 7.50),

    (5, 11, 20, 4.20),
    (5, 12, 10, 18.90),

    (6, 13, 15, 22.50),
    (6, 14, 8, 12.90),
    (6, 15, 6, 19.90);

