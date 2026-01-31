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

  