> Aula 03   
> Docente: Celso Luis Caldeira    
> Data: 31/01/2026   

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
  CREATE DATABASE weberp;    
  SHOW DATABASES;  
  USE weberp;    
  CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY, 
    descricao_produto VARCHAR(70) NOT NULL,
    id_categoria INT,
    observacao TEXT
  ) ENGINE=INNODB;   
  CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY, 
    descricao_produto VARCHAR(70) NOT NULL,
    id_categoria INT,
    observacao TEXT, 
    preco_compra DECIMAL(12,2) NOT NULL DEFAULT 0.00, 
    estoque_minimo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estoque_maximo DECIMAL(10,2) NOT NULL DEFAULT 0.00
  ) ENGINE=INNODB;   
  ALTER TABLE produtos 
  ADD CONSTRAINT fk_produtos_categorias 
  FOREIGN KEY (id_categoria) 
  REFERENCES categorias(id_categoria);   
  INSERT INTO `categorias` (`id_categoria`, `descricao_categoria`) VALUES (NULL, 'Impressoras');    
  INSERT INTO categorias (descricao_categoria) VALUES ('Notebooks');    
  INSERT INTO `produtos` (`id_produto`, `descricao_produto`, `id_categoria`, `observacao`, `preco_compra`, `estoque_minimo`, `estoque_maximo`) VALUES (NULL, 'Notebook Sansumg Mod. 2345', '2', 'I7 com 64GB Ram, 2TB SSD, etc.', '5000', '2', '20');   
  INSERT INTO produtos (descricao_produto, id_categoria, observacao, preco_compra, estoque_minimo, estoque_maximo) VALUES ('Impressora Laser Mod. 123', '1', 'Impressora Rápida', '3000', '1', '10');    
  ALTER TABLE `produtos` CHANGE `preco_venda` `preco_venda` DECIMAL(12,2) NOT NULL DEFAULT '0.00';    
  SELECT descricao_produto,preco_compra from produtos;   
  SELECT descricao_produto,preco_compra,preco_compra*1.60 as preco_sugerido from produtos;    
  UPDATE produtos SET preco_venda = preco_compra*1.6;   
  SELECT * FROM produtos;    
  UPDATE produtos SET descricao_produto = 'Impressora Laser Mod. 125' WHERE id_produto=2;   
  INSERT INTO `produtos` (`id_produto`, `descricao_produto`, `id_categoria`, `observacao`, `preco_compra`, `preco_venda`, `estoque_minimo`, `estoque_maximo`) VALUES (NULL, 'Computador 1234', '2', 'Computador 1234', '100', '0.00', '0.00', '0.00');    
  SELECT * FROM produtos;    
  DELETE FROM produtos WHERE id_produto=3;    
  SELECT * FROM produtos;    
  INSERT INTO `produtos` (`id_produto`, `descricao_produto`, `id_categoria`, `observacao`, `preco_compra`, `preco_venda`, `estoque_minimo`, `estoque_maximo`) VALUES (NULL, 'Note book da Xuxa', NULL, 'tdsfdfsdfds', '0.00', '0.00', '0.00', '0.00');    
  ALTER TABLE `produtos` ADD `oculto` BOOLEAN NOT NULL DEFAULT FALSE AFTER `estoque_maximo`, ADD `id_usuario_deletou` INT(11) NOT NULL AFTER `oculto`, ADD `data_excusao` INT(11) NOT NULL AFTER `id_usuario_deletou`;    
  



  