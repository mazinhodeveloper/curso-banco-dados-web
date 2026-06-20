> Aula 17    
> Docente: Celso Luis Caldeira    
> Data: 20/06/2026   
   
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
| Microsoft SQL Server 2025  | https://www.microsoft.com/en-us/sql-server |        
| MongoDB                    | https://www.mongodb.com |        
   
### Rodando o Projeto 
| Diretório                  | URL                           |   
|--------------------------- |------------------------------ |   
| Local                      | http://localhost              |      
| Local / PHPMyAdmin         | http://localhost/phpmyadmin   |      
| Docker MSSQL               | docker run -d --name some-mssql -e ACCEPT_EULA=Y -e SA_PASSWORD=Strong!Passw0rd -v "$PWD/mssql-data":/var/opt/mssql -p 1433:1433 mcr.microsoft.com/mssql/server:2022-latest |       
| DBeaver Community          | https://dbeaver.io            |             
| Docker MongoDB             | docker run -d --name some-mongodb -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=StrongMongoPass -v "$PWD/mongo-data":/data/db -p 27017:27017 mongo:latest |            

### Atividades       
Banco de Dados NoSQL          
- MongoDB        
            
### MongoDB Compass       
- URL: mongodb://localhost:27017          
- Name: recursos_humanos                        
- Database Name: recursos_humanos               
- Collection Name: folha_pagamento        
- MongoDBDocument0x.txt              
          
### Relação dos operadores de comparação MongoDB      
Operador - Significado     
$eq = Igual a      
$ne = Diferente de     
$gt = Maior que     
$gte = Maior ou igual      
$it = Menor que     
$ite =	Menor ou igual     
$in = Está na lista      
$nin = Não está na lista         
          
### Pesquisas               
{             
  "id_funcionario": 0,          
  "mes": "06/2026",          
  "salario_bruto": 3000,        
  "inss": 100,
  "irpf": 0,           
  "salario_liquido": 2900            
}              
                                             
### Arquivos        
MongoDBDocument01.txt             
MongoDBDocument02.txt                   
AtividadePadaria01-BancoDeDados.sql                  
AtividadePadaria02-InserirDados.sql                          
AtividadePadaria03-SelecionarDados.sql            
AtividadePadaria04-InserirDados.sql              
AtividadePadaria05-SelecionarDados.sql               
AtividadePadaria06-Update.sql          
           
### Atividade MySQL              
> Padaria Vila Romana                
Precisamos de um controle de entrada de mercadorias.                
                 
Cadastro de Fornecedores                
	id                
	nome                
	email	                
	celular                
                
Cadastro de Categorias                
	id                
	descricao                
                 
Cadastro de produtos                
	id                
	descricao_produto                
	id_categoria                
	preco_unitario                
                 
Entrada das Notas Fiscais                
	id                
	id_fornecedor                
	numero_nota_fiscal                
	data                
                 
Itens de Notas Fiscais                
	id                
	id_nota                
	id_produto                
	quantidade                
	preco_unitario                             
                
http://localhost/phpmyadmin        
             
#### Recomandações       
https://mongodb.com        
https://www.mongodb.com/docs       
https://learn.mongodb.com         
https://mongodb.com/books         
https://sqlite.org            
https://sqliteonline.com              
https://sqlitebrowser.org           
https://en.wikipedia.org/wiki/SQLite              
https://github.com/qasimhbti/books/blob/master/databases/sqlite/The%20Definitive%20Guide%20to%20SQLite.pdf               

          
    