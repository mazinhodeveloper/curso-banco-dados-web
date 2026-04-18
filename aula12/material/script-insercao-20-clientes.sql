-- Script de inserção de 20 clientes ficticios 
USE biblioteca; 

INSERT INTO cliente 
    (nome_razao, cpf_cnpj, email, telefone, celular, cep, logradouro, numero, complemento, bairro, cidade, uf) 
VALUES 
    ('João da Silva', '123.456.789-00', 'joao.silva@email.com', '1133224455', '11987654321', '01001-000', 'Rua A', '100', 'Apto 101', 'Centro', 'São Paulo', 'SP'),
    ('Maria Oliveira', '987.654.321-00', 'maria.oliveira@email.com', '1122334455', '11976543210', '01002-000', 'Rua B', '200', 'Casa', 'Bela Vista', 'São Paulo', 'SP'),
    ('Carlos Pereira', '111.222.333-44', 'carlos.p@email.com', '1144556677', '11965432109', '01003-000', 'Rua C', '300', 'Fundos', 'Liberdade', 'São Paulo', 'SP'),
    ('Ana Costa', '222.333.444-55', 'ana.costa@email.com', '1133445566', '11954321098', '01004-000', 'Rua D', '400', 'Bloco A', 'Sé', 'São Paulo', 'SP'),
    ('Roberto Lima', '333.444.555-66', 'roberto.lima@email.com', '1155667788', '11943210987', '01005-000', 'Rua E', '500', 'Sala 02', 'República', 'São Paulo', 'SP'),
    ('Fernanda Alves', '444.555.666-77', 'fernanda.alves@email.com', '1166778899', '11932109876', '01006-000', 'Rua F', '600', 'Apto 202', 'Mooca', 'São Paulo', 'SP'),
    ('Paulo Santos', '555.666.777-88', 'paulo.santos@email.com', '1177889900', '11921098765', '01007-000', 'Rua G', '700', 'Casa 1', 'Ipiranga', 'São Paulo', 'SP'),
    ('Juliana Rocha', '666.777.888-99', 'juliana.rocha@email.com', '1188990011', '11910987654', '01008-000', 'Rua H', '800', 'Apto 303', 'Pinheiros', 'São Paulo', 'SP'),
    ('Marcos Araujo', '777.888.999-00', 'marcos.araujo@email.com', '1199001122', '11999887766', '01009-000', 'Rua I', '900', 'Sala 5', 'Lapa', 'São Paulo', 'SP'),
    ('Patricia Nunes', '888.999.000-11', 'patricia.nunes@email.com', '1144668800', '11988776655', '01010-000', 'Rua J', '1000', 'Apto 12', 'Butantã', 'São Paulo', 'SP'),
    ('Ricardo Freitas', '999.000.111-22', 'ricardo.freitas@email.com', '1133557799', '11977665544', '02001-000', 'Rua K', '110', 'Casa', 'Centro', 'Campinas', 'SP'),
    ('Daniela Pacheco', '000.111.222-33', 'daniela.p@email.com', '1133668899', '11966554433', '02002-000', 'Rua L', '220', 'Apto 11', 'Cambuí', 'Campinas', 'SP'),
    ('Eduardo Martins', '111.333.555-77', 'edu.martins@email.com', '1144779988', '11955443322', '02003-000', 'Rua M', '330', 'Fundos', 'Taquaral', 'Campinas', 'SP'),
    ('Renata Farias', '222.444.666-88', 'renata.f@email.com', '1155880099', '11944332211', '02004-000', 'Rua N', '440', 'Casa', 'Barão', 'Campinas', 'SP'),
    ('Thiago Rangel', '333.555.777-99', 'thiago.r@email.com', '1166991100', '11933221100', '03001-000', 'Rua O', '550', 'Apto 21', 'Centro', 'Santos', 'SP'),
    ('Vanessa Guedes', '444.666.888-00', 'vanessa.g@email.com', '1177002211', '11922110099', '03002-000', 'Rua P', '660', 'Sala 1', 'Gonzaga', 'Santos', 'SP'),
    ('Fábio Teixeira', '555.777.999-11', 'fabio.t@email.com', '1188113322', '11911009988', '03003-000', 'Rua Q', '770', 'Casa', 'Aparecida', 'Santos', 'SP'),
    ('Larissa Monteiro', '666.888.000-22', 'larissa.m@email.com', '1199224433', '11900998877', '04001-000', 'Rua R', '880', 'Apto 9', 'Centro', 'Sorocaba', 'SP'),
    ('Bruno Cordeiro', '777.999.111-33', 'bruno.c@email.com', '1133112244', '11999886655', '04002-000', 'Rua S', '990', 'Sala 3', 'Mangal', 'Sorocaba', 'SP'),
    ('Camila Bastos', '888.000.222-44', 'camila.b@email.com', '1144223355', '11988775544', '04003-000', 'Rua T', '1110', 'Casa', 'Éden', 'Sorocaba', 'SP');
