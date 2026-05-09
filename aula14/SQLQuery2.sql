USE BibliotecaDB;        
             
CREATE TABLE Categorias (               
	id_categoria INT PRIMARY KEY IDENTITY(1,1),       
	nome_categoria VARCHAR(100) NOT NULL            
);               
SELECT * FROM Categorias;      
        
CREATE TABLE Editoras (        
	id_editora INT PRIMARY KEY IDENTITY(1,1),             
	nome_editora VARCHAR(150) NOT NULL,        
	telefone VARCHAR(20)       
);        
SELECT * FROM Editoras;       
        
CREATE TABLE Autores (           
	id_autor INT PRIMARY KEY IDENTITY(1,1),        
	nome_autor VARCHAR(150) NOT NULL            
);                
SELECT * FROM Autores;                
       
--DROP TABLE Livros; 	   
CREATE TABLE Livros (
 	id_livro INT PRIMARY KEY IDENTITY(1,1),
 	titulo VARCHAR(200) NOT NULL,
 	ano_publicacao INT NOT NULL,
 	isbn INT,
  	quantidade_estoque INT NOT NULL,
 	id_categoria INT,
 	id_editora INT,
 	CONSTRAINT fk_livro_categoria
    	FOREIGN KEY(id_categoria)
    	REFERENCES Categorias(id_categoria),
 	CONSTRAINT fk_livro_editora
    	FOREIGN KEY(id_editora)
    	REFERENCES Editoras(id_editora)
);   
SELECT * FROM Livros;                   
             
CREATE TABLE Livro_Autor (             
 	id_livro INT,             
 	id_autor INT,             
 	PRIMARY KEY(id_livro, id_autor),             
 	FOREIGN KEY(id_livro)             
    	REFERENCES Livros(id_livro),             
 	FOREIGN KEY(id_autor)             
    	REFERENCES Autores(id_autor)             
);              
SELECT * FROM Livro_Autor;             
             
CREATE TABLE Usuarios (             
 	id_usuario INT PRIMARY KEY IDENTITY,             
 	nome VARCHAR(150) NOT NULL,             
 	cpf VARCHAR (14) UNIQUE,             
	telefone VARCHAR(20),             
	email VARCHAR(150),             
	data_cadastro DATETIME DEFAULT GETDATE()             
);       
SELECT * FROM Usuarios;       
             
CREATE TABLE Funcionarios (             
	id_funcionario INT PRIMARY KEY IDENTITY(1,1),             
	nome_funcionario VARCHAR(150),              
	cargo VARCHAR(100)             
);               
SELECT * FROM Funcionarios;               
             
CREATE TABLE Emprestimos (             
	id_emprestimo INT PRIMARY KEY IDENTITY(1,1),              
	id_usuario INT NOT NULL,             
	id_funcionario INT NOT NULL,             
	id_livro INT NOT NULL,             
	
	data_emprestimo DATE DEFAULT GETDATE(),
	data_devolucao DATE,             

	status_emprestimo VARCHAR(30) DEFAULT 'EMPRESTADO',             
	FOREIGN KEY (id_usuario)             
		REFERENCES Usuarios (id_usuario),             
	FOREIGN KEY (id_funcionario)             
		REFERENCES Funcionarios (id_funcionario),             
	FOREIGN KEY (id_livro)              
		REFERENCES Livros (id_livro)             
);             
SELECT * FROM Emprestimos;              
             
CREATE TABLE Multas (           
	id_multa INT PRIMARY KEY IDENTITY,           
	id_emprestimo INT UNIQUE,           
	valor DECIMAL(10,2),           
	dias_atraso INT,           
	FOREIGN KEY(id_emprestimo)           
		REFERENCES Emprestimos(id_emprestimo)           
);            
SELECT * FROM Multas;              
