> Aula 06   
> Docente: Celso Luis Caldeira    
> Data: 21/02/2026   

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
CREATE DATABASE eletrocenter;     
SHOW DATABASES;     
USE eletrocenter;    
CREATE TABLE perfil (     
  id_perfil INT AUTO_INCREMENT PRIMARY KEY,    
  nome VARCHAR(50) NOT NULL,    
  descricao VARCHAR(150) NULL,    
  ativo TINYINT(1) NOT NULL DEFAULT 1,     
  UNIQUE KEY uk_perfil_nome (nome)    
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;  
SELECT * FROM perfil;   

INSERT INTO perfil (nome,descricao) VALUES ('Administrador', 'Gerencia usuários, perfis, cadastro e regras.');    
SELECT * FROM perfil;    

CREATE TABLE usuario (     
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,    
  id_perfil INT NOT NULL,    
  nome VARCHAR(100) NOT NULL,    
  email VARCHAR(100) NULL,    
  senha_hash VARCHAR(255),    
  ativo TINYINT(1) NOT NULL DEFAULT 1,   
  dt_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,        
  UNIQUE KEY uk_usuario_nome (nome)    
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;     
SELECT * FROM usuario;    
    
INSERT INTO usuario (id_perfil, nome, email, senha_hash)     
  VALUES (1, 'José da Silva', 'js@hotmail.com', SHA2('123456', 256));        
SELECT * FROM usuario;    

