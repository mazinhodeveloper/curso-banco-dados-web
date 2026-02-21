> Aula 05   
> Docente: Celso Luis Caldeira    
> Data: 14/02/2026   

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
CREATE DATABASE weberp;    
SHOW DATABASES;   
USE weberp;     
  CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    nome_livro VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    autor VARCHAR(80) NOT NULL,
    resumo TEXT,
    isbn VARCHAR(20) UNIQUE,
    preco DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;     

INSERT INTO livros 
(id_livro, nome_livro, categoria, autor, resumo, isbn, preco) 
VALUES
(NULL, 'Os Discos Voadores', 'Ficção Científica', 'José Carlos', 'O livro fala sobre discos voadores e teorias extraterrestres.', '978000000001', 150.00),
(NULL, 'Viagem a Marte', 'Ficção Científica', 'Ana Souza', 'Uma missão tripulada ao planeta vermelho.', '978000000002', 120.00),
(NULL, 'A Última Fronteira', 'Ficção Científica', 'Carlos Mendes', 'Exploração do espaço profundo e seus perigos.', '978000000003', 135.00),
(NULL, 'Além da Galáxia', 'Ficção Científica', 'Marcos Silva', 'Civilizações avançadas fora da Via Láctea.', '978000000004', 160.00),
(NULL, 'Contato Imediato', 'Ficção Científica', 'José Carlos', 'Primeiro contato da humanidade com alienígenas.', '978000000005', 145.00),    
 
(NULL, 'O Código Perdido', 'Tecnologia', 'Fernanda Lima', 'Um mistério envolvendo sistemas e criptografia.', '978000000006', 90.00),
(NULL, 'Programando o Futuro', 'Tecnologia', 'Rafael Alves', 'Como a tecnologia molda o mundo moderno.', '978000000007', 110.00),
(NULL, 'Inteligência Artificial', 'Tecnologia', 'Lucas Rocha', 'Conceitos e aplicações da IA.', '978000000008', 180.00),
(NULL, 'Algoritmos Modernos', 'Tecnologia', 'Paula Nogueira', 'Estudo prático de algoritmos.', '978000000009', 130.00),
(NULL, 'Segurança Digital', 'Tecnologia', 'Bruno Teixeira', 'Proteção de dados no mundo digital.', '978000000010', 125.00),    
 
(NULL, 'Banco de Dados Essencial', 'Informática', 'Celso Caldeira', 'Introdução prática ao MySQL.', '978000000011', 200.00),
(NULL, 'SQL na Prática', 'Informática', 'Celso Caldeira', 'Consultas SQL para aplicações reais.', '978000000012', 220.00),
(NULL, 'Modelagem de Dados', 'Informática', 'Ana Paula', 'Como estruturar bancos de dados eficientes.', '978000000013', 195.00),
(NULL, 'APIs e Integrações', 'Informática', 'Ricardo Santos', 'Integração de sistemas via APIs.', '978000000014', 175.00),
(NULL, 'JSON e Web', 'Informática', 'Marina Lopes', 'Uso de JSON em aplicações web.', '978000000015', 160.00),    
 
(NULL, 'O Mistério da Casa Azul', 'Romance', 'Laura Pires', 'Um romance cheio de segredos.', '978000000016', 80.00),
(NULL, 'Amor em Paris', 'Romance', 'Juliana Costa', 'Uma história de amor na França.', '978000000017', 95.00),    
(NULL, 'Caminhos do Coração', 'Romance', 'Roberto Lima', 'Decisões difíceis movidas pelo amor.', '978000000018', 85.00),
(NULL, 'Entre Dois Mundos', 'Romance', 'Camila Duarte', 'Um amor impossível.', '978000000019', 100.00),
(NULL, 'Laços Eternos', 'Romance', 'Patrícia Gomes', 'Relações que atravessam o tempo.', '978000000020', 90.00),     
 
(NULL, 'História do Brasil', 'História', 'João Ferreira', 'Da colonização aos dias atuais.', '978000000021', 140.00),
(NULL, 'Guerras Mundiais', 'História', 'André Farias', 'Os maiores conflitos do século XX.', '978000000022', 155.00),
(NULL, 'Impérios Antigos', 'História', 'Renata Azevedo', 'Civilizações que marcaram o mundo.', '978000000023', 170.00),
(NULL, 'Brasil República', 'História', 'Marcos Vinícius', 'Transformações políticas do Brasil.', '978000000024', 145.00),
(NULL, 'Revoluções Históricas', 'História', 'Cláudio Moreira', 'Mudanças que moldaram sociedades.', '978000000025', 160.00),
 
(NULL, 'Lógica de Programação', 'Educação', 'Daniel Moraes', 'Base para aprender a programar.', '978000000026', 130.00),
(NULL, 'Aprendendo Python', 'Educação', 'Felipe Andrade', 'Introdução à linguagem Python.', '978000000027', 150.00),
(NULL, 'PHP para Iniciantes', 'Educação', 'Celso Caldeira', 'Desenvolvimento web com PHP.', '978000000028', 165.00),
(NULL, 'JavaScript Essencial', 'Educação', 'Tiago Ribeiro', 'Programação para web moderna.', '978000000029', 155.00),
(NULL, 'Desenvolvimento Web', 'Educação', 'Carolina Freitas', 'HTML, CSS e JS integrados.', '978000000030', 180.00),    
 
(NULL, 'O Enigma do Tempo', 'Ficção', 'Eduardo Nunes', 'Viagens temporais e paradoxos.', '978000000031', 140.00),
(NULL, 'A Cidade Invisível', 'Ficção', 'Vanessa Prado', 'Um mundo oculto dentro da cidade.', '978000000032', 135.00),
(NULL, 'Sombras do Passado', 'Ficção', 'Leonardo Barros', 'Mistério e suspense psicológico.', '978000000033', 125.00),
(NULL, 'O Último Guardião', 'Ficção', 'Marcelo Pacheco', 'Uma antiga profecia.', '978000000034', 150.00),
(NULL, 'Além do Horizonte', 'Ficção', 'Sandra Melo', 'Descobertas inesperadas.', '978000000035', 145.00),    
 
(NULL, 'Empreendedor Digital', 'Negócios', 'Thiago Martins', 'Criando negócios online.', '978000000036', 190.00),
(NULL, 'Gestão Moderna', 'Negócios', 'Patrícia Rocha', 'Administração no século XXI.', '978000000037', 175.00),
(NULL, 'Marketing Estratégico', 'Negócios', 'Eduardo Campos', 'Estratégias para crescer empresas.', '978000000038', 185.00),
(NULL, 'Finanças Pessoais', 'Negócios', 'Luciana Torres', 'Controle financeiro eficiente.', '978000000039', 160.00),
(NULL, 'Startups de Sucesso', 'Negócios', 'Rogério Cunha', 'Do zero ao crescimento.', '978000000040', 200.00);    

SELECT * FROM livros;     
SELECT categoria,count(categoria) as total FROM livros group by categoria order by categoria;      

-- Estrutura para tabela `itens_pedidos` 
CREATE TABLE `itens_pedidos` (
  `id_item` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;    

-- Despejando dados para a tabela `itens_pedidos`
INSERT INTO `itens_pedidos` (`id_item`, `id_pedido`, `id_produto`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 1, 1, 4500.00),
(2, 1, 2, 2, 120.00),
(3, 1, 16, 3, 60.00),
(4, 2, 3, 1, 350.00),
(5, 2, 4, 2, 900.00),
(6, 2, 5, 1, 400.00),
(7, 3, 6, 1, 750.00),
(8, 3, 7, 2, 250.00),
(9, 3, 8, 1, 300.00),
(10, 4, 9, 1, 1200.00),
(11, 4, 10, 1, 800.00),
(12, 4, 2, 1, 120.00),
(13, 5, 11, 1, 2800.00),
(14, 5, 12, 2, 90.00),
(15, 5, 16, 5, 60.00),
(16, 6, 13, 1, 2200.00),
(17, 6, 14, 1, 3200.00),
(18, 6, 15, 1, 1100.00),
(19, 7, 17, 2, 450.00),
(20, 7, 18, 1, 380.00),
(21, 7, 19, 1, 250.00),
(22, 8, 20, 1, 300.00),
(23, 8, 1, 1, 4500.00),
(24, 8, 2, 1, 120.00),
(25, 9, 3, 2, 350.00),
(26, 9, 4, 1, 900.00),
(27, 9, 5, 2, 400.00),
(28, 10, 6, 1, 750.00),
(29, 10, 7, 1, 250.00),
(30, 10, 8, 2, 300.00),
(31, 11, 9, 1, 1200.00),
(32, 11, 10, 1, 800.00),
(33, 11, 11, 1, 2800.00),
(34, 12, 12, 3, 90.00),
(35, 12, 13, 1, 2200.00),
(36, 12, 16, 2, 60.00),
(37, 13, 17, 1, 450.00),
(38, 13, 18, 2, 380.00),
(39, 13, 19, 1, 250.00),
(40, 14, 20, 1, 300.00),
(41, 14, 1, 1, 4500.00),
(42, 14, 3, 1, 350.00),
(43, 15, 4, 1, 900.00),
(44, 15, 5, 1, 400.00),
(45, 15, 6, 1, 750.00),
(46, 2, 8, 1, 300.00),
(47, 3, 2, 3, 120.00),
(48, 5, 18, 1, 380.00),
(49, 7, 12, 2, 90.00),
(50, 9, 16, 4, 60.00),
(51, 10, 15, 1, 1100.00),
(52, 11, 17, 1, 450.00),
(53, 12, 2, 2, 120.00),
(54, 13, 5, 1, 400.00),
(55, 14, 7, 1, 250.00),
(56, 15, 11, 1, 2800.00),
(57, 1, 18, 1, 380.00),
(58, 6, 2, 1, 120.00),
(59, 8, 12, 3, 90.00);     

-- Estrutura para tabela `pedidos`    
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `cliente_nome` varchar(100) NOT NULL,
  `data_pedido` datetime DEFAULT current_timestamp(),
  `status` varchar(30) DEFAULT 'Pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;    

-- Despejando dados para a tabela `pedidos`     
INSERT INTO `pedidos` (`id_pedido`, `cliente_nome`, `data_pedido`, `status`) VALUES
(1, 'Carlos Silva', '2026-02-14 09:56:52', 'Entregue'),
(2, 'Maria Souza', '2026-02-14 09:56:52', 'Entregue'),
(3, 'João Lima', '2026-02-14 09:56:52', 'Pendente'),
(4, 'Ana Costa', '2026-02-14 09:56:52', 'Cancelado'),
(5, 'Fernanda Alves', '2026-02-14 09:56:52', 'Entregue'),
(6, 'Ricardo Mendes', '2026-02-14 09:56:52', 'Pendente'),
(7, 'Juliana Rocha', '2026-02-14 09:56:52', 'Entregue'),
(8, 'Paulo Santos', '2026-02-14 09:56:52', 'Entregue'),
(9, 'Beatriz Oliveira', '2026-02-14 09:56:52', 'Pendente'),
(10, 'Rafael Martins', '2026-02-14 09:56:52', 'Entregue'),
(11, 'Camila Ferreira', '2026-02-14 09:56:52', 'Entregue'),
(12, 'Eduardo Gomes', '2026-02-14 09:56:52', 'Entregue'),
(13, 'Patrícia Lima', '2026-02-14 09:56:52', 'Pendente'),
(14, 'Marcelo Costa', '2026-02-14 09:56:52', 'Entregue'),
(15, 'Luciana Ribeiro', '2026-02-14 09:56:52', 'Entregue');     

-- Estrutura para tabela `produtos`   
CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;    

-- Despejando dados para a tabela `produtos`    
INSERT INTO `produtos` (`id_produto`, `nome_produto`, `categoria`, `preco`, `estoque`, `ativo`) VALUES
(1, 'Notebook Dell', 'Informática', 4500.00, 10, 1),
(2, 'Mouse Logitech', 'Informática', 120.00, 50, 1),
(3, 'Teclado Mecânico', 'Informática', 350.00, 30, 1),
(4, 'Monitor 24\"', 'Informática', 900.00, 15, 1),
(5, 'HD Externo 1TB', 'Informática', 400.00, 20, 1),
(6, 'Impressora HP', 'Informática', 750.00, 12, 1),
(7, 'Webcam Full HD', 'Informática', 250.00, 25, 1),
(8, 'Headset Gamer', 'Informática', 300.00, 18, 1),
(9, 'Cadeira Gamer', 'Móveis', 1200.00, 8, 1),
(10, 'Mesa Escritório', 'Móveis', 800.00, 10, 1),
(11, 'Smartphone Samsung', 'Telefonia', 2800.00, 14, 1),
(12, 'Carregador USB-C', 'Telefonia', 90.00, 60, 1),
(13, 'Tablet Samsung', 'Telefonia', 2200.00, 9, 1),
(14, 'Smart TV 50\"', 'Eletrônicos', 3200.00, 6, 1),
(15, 'Soundbar', 'Eletrônicos', 1100.00, 7, 1),
(16, 'Pendrive 64GB', 'Informática', 60.00, 100, 1),
(17, 'SSD 480GB', 'Informática', 450.00, 20, 1),
(18, 'Roteador Wi-Fi', 'Redes', 380.00, 15, 1),
(19, 'Switch 8 portas', 'Redes', 250.00, 12, 1),
(20, 'Estabilizador', 'Energia', 300.00, 11, 1);    

-- Índices para tabelas despejadas    
-- Índices de tabela `itens_pedidos`
ALTER TABLE `itens_pedidos`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_produto` (`id_produto`);    

-- Índices de tabela `pedidos`   
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);   

-- Índices de tabela `produtos`
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);   

-- AUTO_INCREMENT para tabelas despejadas     
-- AUTO_INCREMENT de tabela `itens_pedidos`    
ALTER TABLE `itens_pedidos`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;   

-- AUTO_INCREMENT de tabela `pedidos`   
ALTER TABLE `pedidos`   
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;     

-- AUTO_INCREMENT de tabela `produtos`    
ALTER TABLE `produtos`    
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;   

-- Restrições para tabelas despejadas   
-- Restrições para tabelas `itens_pedidos`   
ALTER TABLE `itens_pedidos` 
  ADD CONSTRAINT `itens_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `itens_pedidos_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);   

  -- Consulta com relacionamento e calculo    
  SELECT cliente_nome,nome_produto,quantidade,preco_unitario,quantidade*preco_unitario as total from produtos INNER JOIN itens_pedidos on produtos.id_produto=itens_pedidos.id_produto inner JOIN pedidos on pedidos.id_pedido=itens_pedidos.id_pedido;    

  -- Consulta avançada    
SELECT nome_produto,sum(quantidade) as qtde,sum(quantidade*preco_unitario) as total from produtos INNER JOIN itens_pedidos on produtos.id_produto=itens_pedidos.id_produto inner JOIN pedidos on pedidos.id_pedido=itens_pedidos.id_pedido group by nome_produto order by nome produto;    

