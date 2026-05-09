SELECT * FROM SYS.DATABASES; 

SELECT SERVERPROPERTY('IsIntegratedSecurityOnly');

SELECT name, is_disabled
FROM sys.sql_logins
WHERE name = 'sa';

SELECT @@VERSION;
        
CREATE DATABASE BibliotecaDB;        
USE BibliotecaDB;  
