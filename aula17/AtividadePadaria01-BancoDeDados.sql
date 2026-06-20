-- DATABASE padaria_vila_romana;
CREATE DATABASE padaria_vila_romana;
USE padaria_vila_romana;

CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    celular VARCHAR(20)
);

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao_produto VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_categoria)
    REFERENCES categorias(id)
);

CREATE TABLE notas_fiscais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    numero_nota_fiscal VARCHAR(20) NOT NULL,
    data DATE NOT NULL,

    FOREIGN KEY (id_fornecedor)
    REFERENCES fornecedores(id)
);

CREATE TABLE itens_notas_fiscais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_nota INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_nota)
    REFERENCES notas_fiscais(id),

    FOREIGN KEY (id_produto)
    REFERENCES produtos(id)
);