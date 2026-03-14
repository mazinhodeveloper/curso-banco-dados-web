> Aula 09   
> Docente: Celso Luis Caldeira    
> Data: 14/03/2026   
   
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
-- SHOW TABLES;    
-- DESCRIBE cliente; 
-- SELECT * FROM USUARIO;   
-- SELECT status,COUNT(id_pedido) AS total FROM `pedidos` GROUP BY status; 
-- SELECT status,COUNT(id_pedido) AS total FROM `pedidos` GROUP BY status HAVING status='ENTREGUE';
/* 
CREATE TABLE centro_custo (
	id_cc INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(60) NOT NULL, 
    ativo TINYINT(1) NOT NULL DEFAULT 1, 
    UNIQUE KEY uk_cc_nome(nome)
); 
*/ 
/*    
CREATE TABLE conta_receber (    
	id_cr INT AUTO_INCREMENT PRIMARY KEY,    
    id_pedido INT NOT NULL,    
    id_cliente INT NOT NULL,    
    data_geracao DATE NOT NULL,    
    valor_total DECIMAL(12,2) NOT NULL DEFAULT 0.00,    
    status ENUM('ABERTO','PARCIAL','PAGO') NOT NULL DEFAULT 'ABERTO',     
    UNIQUE KEY uk_cr_pedido(id_pedido),    
    KEY idx_cr_cliente(id_cliente),    
    KEY idx_cr_data(data_geracao),    
    CONSTRAINT fk_cr_pedido    
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)     
    ON UPDATE CASCADE    
    ON DELETE RESTRICT,     
    CONSTRAINT ck_cr_valor_nonneg CHECK(valor_total>=0)       
); 
*/    
   
/*   
CREATE TABLE cr_parcela (      
	id_parcela INT AUTO_INCREMENT PRIMARY KEY,     
    id_cr INT NOT NULL,    
    numero INT NOT NULL,    
    data_vencimento  DATE NOT NULL,    
    valor DECIMAL(10,2) NOT NULL DEFAULT 0.00,   
    status ENUM('ABERTA','PAGA','ATRASADA') NOT NULL DEFAULT 'ABERTA',     
    data_pagamento DATE NULL,    
    valor_pago DECIMAL(10,2) NULL,   
    UNIQUE KEY uk_parcela_cr_numero(id_cr, numero),    
    KEY idx_parcela_venc(data_vencimento),    
    CONSTRAINT fk_parcela_cr    
    FOREIGN KEY(id_cr) REFERENCES conta_receber(id_cr)    
    ON UPDATE CASCADE    
    ON DELETE CASCADE,    
    CONSTRAINT ck_parcela_num_pos CHECK(numero>0),    
    CONSTRAINT ck_parcela_pago_nonneg CHECK(valor>=0),    
    CONSTRAINT ck_parcela_valor_pago_nonneg CHECK(valor_pago IS NULL OR valor_pago>=0)    
);    
*/    
   
/*    
CREATE TABLE conta_pagar (
	id_cp INT AUTO_INCREMENT PRIMARY KEY,    
    id_fornecedor INT NULL,    
    id_plano INT NOT NULL,   
    id_cc INT NULL,   
    data_lancamento DATE NOT NULL,   
    data_vencimento DATE NOT NULL,    
    valor DECIMAL(10,2) NOT NULL DEFAULT 0.00,    
    status ENUM('ABERTA','PAGA','ATRASADA') NOT NULL DEFAULT 'ABERTA',    
    data_pagamento DATE NULL,    
    valor_pago DECIMAL(10,2) NULL DEFAULT 0.00,    
    observacao VARCHAR(150) NULL,   
    KEY idx_cp_fornecedor(id_fornecedor),     
    KEY idx_cp_plano(id_plano),     
    KEY idx_cp_cc(id_cc),     
    KEY idx_cp_venc(data_vencimento),     
    CONSTRAINT fk_cp_fornecedor    
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)    
    ON UPDATE CASCADE    
    ON DELETE SET NULL,    
    CONSTRAINT fk_cp_plano    
    FOREIGN KEY (id_plano) REFERENCES plano_contas(id_plano)    
    ON UPDATE CASCADE    
    ON DELETE RESTRICT,    
    CONSTRAINT fk_cp_cc    
    FOREIGN KEY (id_cc) REFERENCES centro_custo(id_cc)    
    ON UPDATE CASCADE    
    ON DELETE SET NULL,    
    CONSTRAINT ck_cp_valor_nonneg CHECK(valor>=0),    
    CONSTRAINT ck_cp_valor_pago_nonneg CHECK(valor_pago IS NULL or valor_pago>=0)    
);    
*/   
   
-- INSERT INTO centro_custo (id_cc, nome, ativo) VALUES (NULL, 'Matriz', '1'), (NULL, 'Filial', '1');    
-- INSERT INTO `plano_contas` (`id_plano`, `nome`, `tipo`, `ativo`) VALUES (NULL, 'Compras', 'DESPESA', '1');    
/*     
INSERT INTO conta_pagar (     
  id_fornecedor,    
  id_plano,     
  id_cc,    
  data_lancamento,   
  data_vencimento,     
  valor,     
  status,     
  data_pagamento,     
  valor_pago,     
  observacao)     
  VALUES (     
    '1', '3', '1', '2026-03-14', '2026-03-31', '2000', 'ABERTA', NULL, '0.00', 'Compra de 5 gabinetes conforme NF. 987'      
);    
*/    
    
### Material (Diretório)    
- aula_130326.pptx    
- exemplos_mysql_basico_intermediario.pdf    
- funcoes_mysql_1.docx     
   
#### Recomandações    
https://dev.mysql.com/doc     
  