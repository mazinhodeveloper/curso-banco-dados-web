> Aula 01   
> Docente: Celso Luis Caldeira    
> Data: 17/01/2026   

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
  CREATE DATABASE escola;    
  SHOW DATABASES;   
  CREATE TABLE `escola`.`alunos` (`id_aluno` INT NOT NULL AUTO_INCREMENT , `nome_aluno` VARCHAR(60) NOT NULL , `data_nascimento` DATE NOT NULL , `renda_familiar` FLOAT NOT NULL , `cpf` VARCHAR(20) NOT NULL , `celular` VARCHAR(20) NOT NULL , `email` VARCHAR(100) NOT NULL , `obs` TEXT NOT NULL , PRIMARY KEY (`id_aluno`)) ENGINE = InnoDB;   
  INSERT INTO `alunos` (`id_aluno`, `nome_aluno`, `data_nascimento`, `renda_familiar`, `cpf`, `celular`, `email`, `obs`) VALUES (NULL, 'Edmar', '1977-10-01', '2200', '9999999999', '3333333333', 'edmar@gmail.com', 'Aluno super dedicado!');    
  USE escola;    
  SELECT nome_aluno, data_nascimento, cpf FROM alunos;     
  INSERT INTO `alunos` (`id_aluno`, `nome_aluno`, `data_nascimento`, `renda_familiar`, `cpf`, `celular`, `email`, `obs`) VALUES (NULL, 'Maria José', '1988-12-11', '1600', '9999999999', '3333333333', 'edmar@gmail.com', 'Aluno super dedicado!');    
  INSERT INTO `alunos` (`id_aluno`, `nome_aluno`, `data_nascimento`, `renda_familiar`, `cpf`, `celular`, `email`, `obs`) VALUES (NULL, 'Roberto', '1988-12-11', '6200', '9999999999', '3333333333', 'edmar@gmail.com', 'Aluno super dedicado!');    
  USE escola;    
  SELECT nome_aluno, data_nascimento, cpf FROM alunos;     
  SELECT * FROM alunos WHERE id_aluno=2;    
  -- SELECT * FROM alunos;    
  SELECT COUNT(id_aluno) as total from alunos;    
  SELECT SUM(renda_familiar) as total from alunos;    
  SELECT AVG(renda_familiar) as total from alunos;    
  SELECT 25+10 as total;    
  SELECT * FROM alunos WHERE id_aluno=1;    
  SELECT *,renda_familiar*1.1 as reajustado FROM alunos WHERE id_aluno=1;    
  SHOW DATABASES;    
  DROP table alunos;   
  DROP DATABASE escola;
  SHOW DATABASES;   

### Utilizades
- https://viacep.com.br    
  https://viacep.com.br/ws/01001000/json/    
  