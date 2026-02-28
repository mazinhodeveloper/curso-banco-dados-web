> Aula 07   
> Docente: Celso Luis Caldeira    
> Data: 28/02/2026   
   
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

ALTER TABLE produto     
ADD COLUMN id_fornecedor INT(11)     
AFTER id_categoria;            
SELECT * FROM produto;    
  
ALTER TABLE produto    
ADD CONSTRAINT fk_produto_fornecedor    
FOREIGN KEY (id_fornecedor)    
REFERENCES fornecedor(id_fornecedor);     
SELECT * FROM produtos;    

USE eletrocenter; 

ALTER TABLE produto 
ADD COLUMN id_fornecedor INT(11) 
AFTER id_categoria;     
SELECT * FROM produto;   
   
ALTER TABLE produto   
ADD CONSTRAINT fk_produto_fornecedor   
FOREIGN KEY (id_fornecedor)   
REFERENCES fornecedor(id_fornecedor);    
SELECT * FROM produto;    

CREATE TABLE pedido (    
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,    
    id_cliente INT NOT NULL,    
    id_usuario INT NOT NULL,    
    data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,   
    status ENUM('RASCUNHO', 'CONFIRMADO', 'FATURADO', 'CANCELADO'),   
    subtotal DECIMAL(12,2) NOT NULL DEFAULT 0.00,     
    desconto DECIMAL(12,2) NOT NULL DEFAULT 0.00,    
    frete DECIMAL(12,2) NOT NULL DEFAULT 0.00,    
    total DECIMAL(12,2) NOT NULL DEFAULT 0.00,    
    observacao TEXT NULL,    
    CONSTRAINT fk_pedido_cliente     
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)    
    ON UPDATE CASCADE     
    ON DELETE RESTRICT,    
    CONSTRAINT fk_pedido_usuario    
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)      
    ON UPDATE CASCADE    
    ON DELETE RESTRICT    
);    
SELECT * FROM pedido;     

CREATE TABLE pedido_item (     
    id_item INT AUTO_INCREMENT PRIMARY KEY,    
    id_pedido INT NOT NULL,    
    id_produto INT NOT NULL,    
    quantidade INT NOT NULL,     
    valor_unitario DECIMAL(12,2) NOT NULL DEFAULT 0.00,    
    desconto_item DECIMAL(12,2) NOT NULL DEFAULT 0.00,   
    total_item DECIMAL(12,2) NOT NULL DEFAULT 0.00,   
    UNIQUE KEY uk_item_pedido_produto(id_pedido, id_produto),    
    CONSTRAINT fk_item_pedido     
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)    
    ON UPDATE CASCADE    
    ON DELETE RESTRICT,    
    CONSTRAINT fk_item_produto    
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)    
    ON UPDATE CASCADE    
    ON DELETE RESTRICT     
);    
SELECT * FROM pedido_item;     




