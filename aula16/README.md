> Aula 16    
> Docente: Celso Luis Caldeira    
> Data: 13/06/2026   
   
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
- Name: controle_financeiro             
- Database Name: controle_financeiro       
- Collection Name: movimentacoes        
- MongoDocument0x.txt        
          
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
{ _id: ObjectId("6a2d4562907518286203cce3") }      
{ Tipo: "Despesas" }        
{ Tipo: "Receitas" }        
{ Valor:  { "$gt:200"} }       
{ Valor: { $gt: 500 } }        
{ Valor:  { "$gte":100", "$ite:500"} }        
{ Valor:  { "$gte":200", "$ite:500"} }             
{ Categoria:  { "$in": {"Alimentação", "Transporte"} } }         
{ Categoria:  { "$in": {"Alimentação", "Serviços"} } }           
{ Categoria:  { "$nin": {"Alimentação", "Serviços"} } }          
{ Valor:  { "$gt": 200 } }         
{ $or:  [ { "Categoria": "Alimentação" }, { "Categoria": "Serviços"} ] }                 
                      
### MongoDB Compass       
- URL: mongodb://localhost:27017          
- Name: recursos_humanos                        
- Database Name: recursos_humanos               
- Collection Name: funcionarios        
- MongoDBDocument0x.txt          
          
### Pesquisas             
{ Departamento: "TI"}                  
{ Salario: { "$gt": 3000 } }                  
{ Salario: { "$lt": 3000 } }                 
           
db.funcionarios.updateOne(           
{           
    Nome: "José Fernando"            
},            
{           
    $set: {           
        Salario: 3000           
    }           
})           
                   
### Arquivos        
MongoDBDocument01.txt             
MongoDBDocument02.txt           
MongoDBDocument03.txt         
MongoDBDocument04.txt        
MongoDocument01.txt           
MongoDocument02.txt           
MongoDocument03.txt                               
             
### Material (Diretório)    
- MongoDB.pptx          
             
#### Recomandações       
https://mongodb.com        
https://www.mongodb.com/docs       
https://learn.mongodb.com         
https://mongodb.com/books         
https://viacep.com.br                
https://viacep.com.br/ws/01001000/json        
https://minhareceita.org          
https://docs.minhareceita.org         
https://minhareceita.org/33.683.111/0002-80          
    