> Aula 02   
> Docente: Celso Luis Caldeira    
> Data: 24/01/2026   

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
  CREATE TABLE clientes ( id_cliente INT AUTO_INCREMENT PRIMARY KEY, nome_cliente varchar(70) NOT null, cpf_cnpj varchar(25), cep varchar(9), logradouro varchar(70), numero varchar(15), complemento varchar(15), bairro varchar(50), cidade varchar(60), estado varchar(2), email varchar(100), celular varchar(25), whatsapp boolean, faturamento float DEFAULT 0, data_aniversario date );    
  INSERT INTO `clientes` (`id_cliente`, `nome_cliente`, `cpf_cnpj`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `email`, `celular`, `whatsapp`, `faturamento`, `data_aniversario`) VALUES (NULL, 'Kalunga S/A', '11.111.111/0001-01', '21110-000', 'rua fulano', '123', 'sala 5', 'vila beleza', 'são paulo', 'sp', 'sac@kalunga.com.br', '(11) 98888-9999', '1', '550000.10', '2025-10-03');        
  