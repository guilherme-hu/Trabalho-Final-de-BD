USE BD_vacinacao;
GO


-- Limpando dados existentes na ordem correta para evitar conflitos de FK
DELETE FROM dbo.UnidadeMedica_Vacinador;
DELETE FROM dbo.Vacinacao;
DELETE FROM dbo.Endereco;
DELETE FROM dbo.Nacionalidade;
DELETE FROM dbo.Complemento;
DELETE FROM dbo.TipoComplemento;
DELETE FROM dbo.TipoEndereco;
DELETE FROM dbo.Dose;
DELETE FROM dbo.Ampola;
DELETE FROM dbo.Lote;
DELETE FROM dbo.TipoVacina;
DELETE FROM dbo.Paciente;
DELETE FROM dbo.Vacinador;
DELETE FROM dbo.Fabricante;
DELETE FROM dbo.UnidadeMedica;
DELETE FROM dbo.PessoaJuridica;
DELETE FROM dbo.PessoaFisica;
DELETE FROM dbo.Logradouro;
DELETE FROM dbo.Bairro;
DELETE FROM dbo.Municipio;
DELETE FROM dbo.UF;
DELETE FROM dbo.Pais;
DELETE FROM dbo.Pessoa;
DELETE FROM dbo.TipoLogradouro;
GO

-- Tabela Pais
INSERT INTO dbo.Pais (Cd_Pais, Nm_Pais) VALUES
(1, 'Brasil'), (2, 'Portugal'), (3, 'Angola'), (4, 'Argentina'), (5, 'Estados Unidos'), 
(6, 'Moçambique'), (7, 'Japão'), (8, 'China'), (9, 'Índia'), (10, 'Rússia'), (11, 'Canadá'),
(12, 'Austrália'), (13, 'Alemanha'), (14, 'França'), (15, 'Itália'), (16, 'Espanha'), 
(17, 'Reino Unido'), (18, 'África do Sul'), (19, 'México'), (20, 'Chile');
GO

-- Tabela UF
INSERT INTO dbo.UF (Cd_UF, Cd_Pais, Nm_UF) VALUES
(1, 1, 'Acre'), (2, 1, 'Alagoas'), (3, 1, 'Amapá'), (4, 1, 'Amazonas'), (5, 1, 'Bahia'),
(6, 1, 'Ceará'), (7, 1, 'Distrito Federal'), (8, 1, 'Espírito Santo'), (9, 1, 'Goiás'), 
(10, 1, 'Maranhão'), (11, 1, 'Mato Grosso'), (12, 1, 'Mato Grosso do Sul'), (13, 1, 'Minas Gerais'), 
(14, 1, 'Pará'), (15, 1, 'Paraíba'), (16, 1, 'Paraná'), (17, 1, 'Pernambuco'), (18, 1, 'Piauí'), 
(19, 1, 'Rio de Janeiro'), (20, 1, 'Rio Grande do Norte'), (21, 1, 'Rio Grande do Sul'), 
(22, 1, 'Rondônia'), (23, 1, 'Roraima'), (24, 1, 'Santa Catarina'), (25, 1, 'São Paulo'), 
(26, 1, 'Sergipe'), (27, 1, 'Tocantins');
GO

-- Tabela Municipio
INSERT INTO dbo.Municipio (Cd_Municipio, Cd_UF, Nm_Municipio) VALUES
(1, 25, 'São Paulo'), (2, 19, 'Rio de Janeiro'), (3, 5, 'Salvador'), (4, 7, 'Brasília'),
(5, 6, 'Fortaleza'), (6, 13, 'Belo Horizonte'), (7, 4, 'Manaus'), (8, 16, 'Curitiba'), (9, 17, 'Recife'), (10, 21, 'Porto Alegre'), (11, 14, 'Belém'), (12, 9, 'Goiânia'), (13, 10, 'São Luís'), (14, 2, 'Maceió'), (15, 25, 'Campinas'), (16, 19, 'Niterói'), (17, 24, 'Florianópolis'), (18, 8, 'Vitória'), (19, 12, 'Campo Grande'), (20, 11, 'Cuiabá'), (21, 25, 'Santos'), (22, 19, 'Duque de Caxias');
GO

-- Tabela Bairro
INSERT INTO dbo.Bairro (Cd_Bairro, Cd_Municipio, Nm_Bairro) VALUES
(1, 1, 'Pinheiros'), (2, 1, 'Vila Madalena'), (3, 2, 'Copacabana'), (4, 2, 'Ipanema'), 
(5, 3, 'Barra'), (6, 3, 'Pituba'), (7, 4, 'Asa Sul'), (8, 4, 'Asa Norte'), (9, 5, 'Meireles'),
(10, 5, 'Aldeota'), (11, 6, 'Savassi'), (12, 6, 'Lourdes'), (13, 7, 'Adrianópolis'), 
(14, 7, 'Ponta Negra'), (15, 8, 'Batel'), (16, 8, 'Água Verde'), (17, 9, 'Boa Viagem'),
(18, 9, 'Casa Forte'), (19, 10, 'Moinhos de Vento'), (20, 10, 'Bela Vista'),
(21, 17, 'Jurerê Internacional'), (22, 17, 'Centro');
GO

-- Tabela TipoLogradouro
INSERT INTO dbo.TipoLogradouro (Cd_Tipo_Logradouro, Nm_Tipo_Logradouro) VALUES
(1, 'Rua'), (2, 'Avenida'), (3, 'Praça'), (4, 'Travessa'), (5, 'Alameda'), (6, 'Rodovia'),
(7, 'Estrada'), (8, 'Viela'), (9, 'Largo'), (10, 'Setor'), (11, 'Quadra'), (12, 'Loteamento'),
(13, 'Condomínio'), (14, 'Beco'), (15, 'Passarela'), (16, 'Parque'), (17, 'Jardim'), 
(18, 'Esplanada'), (19, 'Campo'), (20, 'Via');
GO

-- Tabela Logradouro
INSERT INTO dbo.Logradouro (Cd_Logradouro, Cd_Bairro, Cd_Tipo_Logradouro, Nm_Logradouro) VALUES
(1, 1, 1, 'dos Pinheiros'), (2, 2, 2, 'Paulista'), (3, 3, 2, 'Atlântica'), 
(4, 4, 1, 'Vinicius de Moraes'), (5, 5, 2, 'Oceânica'), (6, 6, 1, 'das Espatódias'), 
(7, 7, 11, 'SQS 302'), (8, 8, 11, 'SQN 205'), (9, 9, 2, 'Beira Mar'), 
(10, 10, 1, 'Santos Dumont'), (11, 11, 1, 'Antônio de Albuquerque'), (12, 12, 2, 'do Contorno'),
(13, 13, 1, 'Maceió'), (14, 14, 2, 'do Turismo'), (15, 15, 2, 'Sete de Setembro'), 
(16, 16, 2, 'República Argentina'), (17, 17, 2, 'Conselheiro Aguiar'), (18, 18, 2, 'Dezessete de Agosto'),
(19, 19, 1, 'Padre Chagas'), (20, 20, 2, 'Nilo Peçanha'), (21, 21, 2, 'dos Búzios'), (22, 22, 2, 'Rio Branco');
GO

-- Tabela Pessoa
INSERT INTO dbo.Pessoa (Cd_Pessoa, Nm_Pessoa, Dt_Nascimento) VALUES
-- Pessoas Físicas (Pacientes e Vacinadores)
(1, 'João da Silva', '1980-01-15'), (2, 'Maria Oliveira', '1992-05-20'), 
(3, 'Pedro Santos', '1975-11-30'), (4, 'Ana Souza', '2000-07-07'), 
(5, 'Carlos Pereira', '1988-03-25'), (6, 'Mariana Ferreira', '1995-09-10'), 
(7, 'Lucas Gonçalves', '1960-02-28'), (8, 'Juliana Rodrigues', '1983-08-12'),
(9, 'Fernando Almeida', '1998-12-01'), (10, 'Beatriz Lima', '1979-06-05'),
(11, 'Rafael Costa', '1991-04-18'), (12, 'Larissa Martins', '1985-10-22'), 
(13, 'Gustavo Araujo', '1993-02-14'), (14, 'Camila Barbosa', '1989-07-29'),
(15, 'Ricardo Carvalho', '1978-01-19'), (16, 'Patrícia Ribeiro', '1996-06-08'),
(17, 'Felipe Castro', '1981-11-11'), (18, 'Amanda Cunha', '1990-03-03'), 
(19, 'Vinicius Moraes', '1982-04-04'), (20, 'Gabriela Barros', '1999-01-01'), 
(21, 'Leandro Azevedo', '1977-07-17'), (22, 'Tatiane Gomes', '1984-09-19'), 
(23, 'Eduardo Martins', '1990-11-05'),
-- Pessoas Jurídicas (Fabricantes e Unidades)
(101, 'Laboratório Pfizer Ltda', '1952-03-15'), (102, 'Fundação Oswaldo Cruz', '1900-05-25'), 
(103, 'Instituto Butantan', '1901-02-23'), (104, 'Clínica Saúde & Bem-Estar', '2005-08-10'), 
(105, 'Posto de Saúde Central', '1998-01-20'), (106, 'Hospital Municipal', '1970-06-12'), 
(107, 'Drogaria Confiança', '1995-04-01'), (108, 'Centro de Diagnóstico Imagem', '2010-10-10'),
(109, 'AstraZeneca do Brasil', '1999-05-20'), (110, 'Janssen-Cilag Farmacêutica', '1959-01-01');
GO

-- Tabela PessoaFisica
INSERT INTO dbo.PessoaFisica (Cd_Pessoa, Cd_CPF, Nu_RG) VALUES
(1, '11122233344', '12345678'), (2, '22233344455', '23456789'), 
(3, '33344455566', '34567890'), (4, '44455566677', '45678901'), 
(5, '55566677788', '56789012'), (6, '66677788899', '67890123'), 
(7, '77788899900', '78901234'), (8, '88899900011', '89012345'), 
(9, '99900011122', '90123456'), (10, '00011122233', '01234567'),
(11, '11133355577', '11223344'), (12, '22244466688', '22334455'), 
(13, '33355577799', '33445566'), (14, '44466688800', '44556677'), 
(15, '55577799911', '55667788'), (16, '66688800022', '66778899'), 
(17, '77799911133', '77889900'), (18, '88800022244', '88990011'), 
(19, '12121212121', '12121212'), (20, '23232323232', '23232323'), 
(21, '34343434343', '34343434'), (22, '45454545454', '45454545'), 
(23, '56565656565', '56565656');
GO

-- Tabela PessoaJuridica
INSERT INTO dbo.PessoaJuridica (Cd_Pessoa, Cd_CNPJ, Nm_Comercial, Dt_Fundacao) VALUES
(101, '46348607000153', 'Pfizer', '1952-03-15'), 
(102, '33781055000135', 'Fiocruz', '1900-05-25'), 
(103, '61610216000180', 'Instituto Butantan', '1901-02-23'), 
(104, '12345678000199', 'Clínica Saúde & Bem-Estar', '2005-08-10'), 
(105, '87654321000199', 'Posto de Saúde Central', '1998-01-20'), 
(106, '11223344000199', 'Hospital Municipal', '1970-06-12'), 
(107, '55667788000199', 'Drogaria Confiança', '1995-04-01'), 
(108, '99887766000199', 'Centro de Diagnóstico Imagem', '2010-10-10'), 
(109, '00923124000112', 'AstraZeneca', '1999-05-20'), 
(110, '51780468000187', 'Janssen', '1959-01-01');
GO

-- Tabela Paciente (18 pacientes)
INSERT INTO dbo.Paciente (Cd_Paciente, Cd_Pessoa, Cd_CPF)
SELECT Cd_Pessoa, Cd_Pessoa, Cd_CPF FROM dbo.PessoaFisica WHERE Cd_Pessoa IN (1,3,4,5,7,8,9,10,11,13,14,15,17,18,19,20,21,22);
GO

-- Tabela Vacinador (5 vacinadores)
INSERT INTO dbo.Vacinador (Cd_COREN, Cd_Pessoa, Cd_CPF) VALUES
('SP12345-ENF', 2, '22233344455'),
('RJ54321-ENF', 6, '66677788899'),
('MG67890-ENF', 12, '22244466688'),
('BA09876-ENF', 16, '66688800022'),
('SC24680-ENF', 23, '56565656565');
GO

-- Tabela UnidadeMedica
INSERT INTO dbo.UnidadeMedica (Cd_Unidade_Medica, Nm_Unidade_Medica, Cd_Pessoa) VALUES
('CNES1234567', 'Clínica Saúde & Bem-Estar', 104), ('CNES7654321', 'Posto de Saúde Central', 105), 
('CNES1122334', 'Hospital Municipal', 106), ('CNES5566778', 'Drogaria Confiança', 107), 
('CNES9988776', 'Centro de Diagnóstico Imagem', 108);
GO

-- Tabela Fabricante
INSERT INTO dbo.Fabricante (Cd_Fabricante, Nm_Fabricante, Nu_Autorizacao_ANVISA, Cd_Pessoa) VALUES
('PFIZER', 'Pfizer', 12345, 101), ('FIOCRUZ', 'Fiocruz', 54321, 102), ('BUTANTAN', 'Butantan', 67890, 103), 
('ASTRAZENECA', 'AstraZeneca', 98765, 109), ('JANSSEN', 'Janssen', 13579, 110);
GO

-- Tabela Nacionalidade
INSERT INTO dbo.Nacionalidade (Cd_Pessoa, Cd_Pais)
SELECT Cd_Pessoa, 1 FROM dbo.Pessoa WHERE Cd_Pessoa <= 23 -- Pessoas físicas brasileiras
UNION ALL
SELECT 2, 2 -- Adicionando dupla nacionalidade para Maria Oliveira (Portuguesa)
UNION ALL
SELECT 101, 5 -- Pfizer é dos EUA
UNION ALL
SELECT 109, 17 -- AstraZeneca é do Reino Unido
UNION ALL
SELECT Cd_Pessoa, 1 FROM dbo.Pessoa WHERE Cd_Pessoa IN (102, 103, 104, 105, 106, 107, 108, 110); -- Outras pessoas jurídicas do Brasil
GO

-- Tabela TipoComplemento
INSERT INTO dbo.TipoComplemento (Cd_Tipo_Complemento, Nm_Tipo_Complemento) VALUES
(1, 'Apartamento'), (2, 'Casa'), (3, 'Fundos'), (4, 'Sobrado'), (5, 'Bloco'), 
(6, 'Sala'), (7, 'Loja'), (8, 'Galpão'), (9, 'Sítio'), (10, 'Chácara'), (11, 'Fazenda'), 
(12, 'Prédio'), (13, 'Edifício'), (14, 'Galeria'), (15, 'Sobreloja'), (16, 'Térreo'), 
(17, 'Vila'), (18, 'Letra'), (19, 'Lote'), (20, 'Quadra');
GO

-- Tabela Complemento
INSERT INTO dbo.Complemento (Ds_Complemento, Cd_Tipo_Complemento) VALUES
('Apto 101', 1), ('Casa 2', 2), ('Bloco B', 5), ('Sala 305', 6), ('Loja A', 7), 
('Apto 502', 1), ('Casa 1', 2), ('Bloco C', 5), ('Sala 101', 6), ('Loja B', 7), 
('Apto 202', 1), ('Casa 3', 2), ('Bloco A', 5), ('Sala 202', 6), ('Loja C', 7), 
('Apto 303', 1), ('Casa 4', 2), ('Bloco D', 5), ('Sala 404', 6), ('Loja D', 7),
('Prédio Principal', 12), ('Andar 5', 1), ('Galpão 3', 8), ('Edifício Sede', 13), 
('Torre Norte', 13), ('Térreo', 16);
GO

-- Tabela TipoEndereco
INSERT INTO dbo.TipoEndereco (Cd_Tipo_Endereco, Nm_Tipo_Endereco) VALUES
(1, 'Residencial'), (2, 'Comercial'), (3, 'Cobrança'), (4, 'Entrega'), (5, 'Principal');
GO

-- Tabela Endereco (Garantindo endereço para todos)
INSERT INTO dbo.Endereco (Cd_Endereco, Nu_Logradouro, Cd_Logradouro, Ds_Complemento, Cd_Tipo_Endereco, PF_Cd_Pessoa, PF_Cd_CPF, PJ_Cd_Pessoa) VALUES
-- Endereços Pessoa Física
(1, 100, 1, 'Apto 101', 1, 1, '11122233344', NULL), 
(2, 200, 3, 'Casa 2', 1, 2, '22233344455', NULL), 
(3, 300, 5, 'Apto 202', 1, 3, '33344455566', NULL), 
(4, 400, 7, 'Bloco B', 1, 4, '44455566677', NULL), 
(5, 500, 9, 'Sala 305', 1, 5, '55566677788', NULL), 
(6, 600, 11, 'Loja A', 1, 6, '66677788899', NULL), 
(7, 700, 13, 'Casa 3', 1, 7, '77788899900', NULL), 
(8, 800, 15, 'Apto 502', 1, 8, '88899900011', NULL), 
(9, 900, 17, 'Casa 1', 1, 9, '99900011122', NULL), 
(10, 1000, 19, 'Apto 303', 1, 10, '00011122233', NULL), 
(11, 101, 20, 'Casa 4', 1, 11, '11133355577', NULL), 
(12, 202, 18, 'Apto 101', 1, 12, '22244466688', NULL), 
(13, 303, 16, 'Bloco A', 1, 13, '33355577799', NULL), 
(14, 404, 14, 'Sala 404', 1, 14, '44466688800', NULL), 
(15, 505, 12, 'Casa 1', 1, 15, '55577799911', NULL), 
(16, 606, 10, 'Apto 202', 1, 16, '66688800022', NULL), 
(17, 707, 8, 'Bloco D', 1, 17, '77799911133', NULL), 
(18, 808, 6, 'Sala 101', 1, 18, '88800022244', NULL), 
(19, 909, 4, 'Apto 502', 1, 19, '12121212121', NULL), 
(20, 110, 2, 'Casa 2', 1, 20, '23232323232', NULL), 
(21, 220, 1, 'Bloco C', 1, 21, '34343434343', NULL), 
(22, 330, 3, 'Sala 202', 1, 22, '45454545454', NULL), 
(23, 440, 21, 'Apto 101', 1, 23, '56565656565', NULL),
-- Endereços Pessoa Jurídica
(101, 1100, 2, 'Sala 101', 2, NULL, NULL, 101), 
(102, 1200, 4, 'Bloco A', 2, NULL, NULL, 102), 
(103, 1300, 6, 'Prédio Principal', 2, NULL, NULL, 103), 
(104, 1400, 8, 'Loja B', 2, NULL, NULL, 104), 
(105, 1500, 10, 'Térreo', 2, NULL, NULL, 105), 
(106, 1600, 12, 'Andar 5', 2, NULL, NULL, 106), 
(107, 1700, 14, 'Galpão 3', 2, NULL, NULL, 107), 
(108, 1800, 16, 'Bloco C', 2, NULL, NULL, 108),
(109, 1900, 18, 'Edifício Sede', 2, NULL, NULL, 109),
(110, 2000, 20, 'Torre Norte', 2, NULL, NULL, 110);
GO

-- Tabela TipoVacina
INSERT INTO dbo.TipoVacina (Cd_Tipo_Vacina, Nm_Tipo_Vacina, Ds_Vacina) VALUES
(1, 'COVID-19 Pfizer', 'Vacina de mRNA contra SARS-CoV-2'), 
(2, 'Coronavac', 'Vacina de vírus inativado contra SARS-CoV-2'), 
(3, 'Influenza (Gripe)', 'Vacina tetravalente contra o vírus da gripe'), 
(4, 'Tríplice Viral', 'Vacina contra sarampo, caxumba e rubéola'), 
(5, 'Febre Amarela', 'Vacina contra o vírus da febre amarela'), 
(6, 'Hepatite B', 'Vacina contra o vírus da Hepatite B'), 
(7, 'HPV', 'Vacina quadrivalente contra o Papilomavírus Humano'), 
(8, 'Difteria e Tétano (dT)', 'Vacina dupla tipo adulto'), 
(9, 'Poliomielite', 'Vacina oral contra a poliomielite (gotinha)'), 
(10, 'BCG', 'Vacina contra formas graves de tuberculose'), 
(11, 'Rotavírus', 'Vacina oral contra o rotavírus'), 
(12, 'Meningocócica C', 'Vacina contra a meningite tipo C'), 
(13, 'Pneumocócica 10', 'Vacina contra doenças causadas pelo pneumococo'), 
(14, 'Varicela', 'Vacina contra a catapora'), 
(15, 'Hepatite A', 'Vacina contra o vírus da Hepatite A'), 
(16, 'DTPa', 'Vacina tríplice bacteriana acelular'), 
(17, 'COVID-19 AstraZeneca', 'Vacina de vetor viral contra SARS-CoV-2'), 
(18, 'COVID-19 Janssen', 'Vacina de vetor viral contra SARS-CoV-2 (dose única)'), 
(19, 'Dengue', 'Vacina tetravalente contra a dengue'), 
(20, 'Raiva Humana', 'Vacina para profilaxia pré e pós-exposição');
GO

-- Tabela Lote
INSERT INTO dbo.Lote (Cd_Lote, Cd_Fabricante, Cd_Tipo_Vacina, Dt_Fabricacao, Dt_Vencimento, Qt_Quantidade) VALUES
-- Lotes Válidos
('PF2025A', 'PFIZER', 1, '2024-01-10', '2025-07-10', 100), 
('CV2025B', 'BUTANTAN', 2, '2024-02-15', '2025-08-15', 80), 
('GR2025C', 'FIOCRUZ', 3, '2024-03-20', '2025-09-20', 95), 
('TV2026A', 'FIOCRUZ', 4, '2024-04-25', '2026-04-25', 70), 
('FA2026B', 'FIOCRUZ', 5, '2024-05-01', '2026-05-01', 50), 
('HB2027A', 'BUTANTAN', 6, '2024-06-05', '2027-06-05', 100), 
('HP2027B', 'BUTANTAN', 7, '2024-07-10', '2027-07-10', 85), 
('DT2028A', 'FIOCRUZ', 8, '2024-08-15', '2028-08-15', 60), 
('PF2025D', 'PFIZER', 1, '2024-02-10', '2025-08-10', 100), 
('CV2025E', 'BUTANTAN', 2, '2024-03-15', '2025-09-15', 75), 
('PO2026A', 'FIOCRUZ', 9, '2024-05-15', '2026-05-15', 90), 
('BCG2027A', 'FIOCRUZ', 10, '2024-06-20', '2027-06-20', 95), 
('ROTA2026B','BUTANTAN', 11, '2024-07-25', '2026-07-25', 80), 
('MENINGO27B','FIOCRUZ', 12, '2024-08-01', '2027-08-01', 100), 
('PNEUMO28B','PFIZER', 13, '2024-09-05', '2028-09-05', 65), 
('VARI2026C','BUTANTAN', 14, '2024-10-10', '2026-10-10', 70), 
('HEPA2027C','FIOCRUZ', 15, '2024-11-15', '2027-11-15', 88), 
('DTPa2028C','PFIZER', 16, '2024-12-20', '2028-12-20', 90), 
('AZ2025A','ASTRAZENECA', 17, '2024-01-20', '2025-07-20', 100), 
('JANSS2025A','JANSSEN', 18, '2024-02-25', '2025-08-25', 55), 
('DENG2026A','BUTANTAN', 19, '2024-03-30', '2026-03-30', 78), 
('RAIVA2027A','FIOCRUZ', 20, '2024-04-05', '2027-04-05', 92), 
('VENCEJUL25', 'BUTANTAN', 19, '2024-07-15', '2025-07-15', 40),
-- Lotes Vencidos
('EXP2024A', 'PFIZER', 1, '2023-12-01', '2024-12-01', 100), 
('EXP2025B', 'FIOCRUZ', 3, '2024-01-15', '2025-01-15', 100), 
('EXP2024C', 'JANSSEN', 18, '2023-05-20', '2024-05-20', 80), 
('EXP2023D', 'BUTANTAN', 6, '2022-10-10', '2023-10-10', 90), 
('EXP2025E', 'ASTRAZENECA', 17, '2024-02-01', '2025-02-01', 70), 
('EXP_JUN25', 'FIOCRUZ', 5, '2024-06-01', '2025-06-01', 50);
GO


-- Tabela Ampola 
INSERT INTO dbo.Ampola (Cd_Ampola, Qt_Doses, Vl_Volume, Ds_Condicoes_Armazenamento, Cd_Lote) VALUES
('AMP001', 6, 0.3, 'Manter ultra-congelado', 'PF2025A'), 
('AMP002', 1, 0.5, 'Manter refrigerado', 'CV2025B'), 
('AMP003', 10, 5.0, 'Manter refrigerado', 'GR2025C'), 
('AMP004', 10, 5.0, 'Manter refrigerado', 'TV2026A'), 
('AMP005', 10, 5.0, 'Manter refrigerado', 'FA2026B'), 
('AMP006', 1, 1.0, 'Manter refrigerado', 'HB2027A'), 
('AMP007', 1, 0.5, 'Manter refrigerado', 'HP2027B'), 
('AMP008', 20, 10.0, 'Manter refrigerado', 'DT2028A'), 
('AMP009', 6, 0.3, 'Manter ultra-congelado', 'PF2025D'), 
('AMP010', 1, 0.5, 'Manter refrigerado', 'CV2025E'), 
('AMP011', 20, 2.0, 'Manter refrigerado', 'PO2026A'), 
('AMP012', 20, 2.0, 'Manter refrigerado', 'BCG2027A'), 
('AMP013', 1, 1.5, 'Manter refrigerado', 'ROTA2026B'), 
('AMP014', 10, 5.0, 'Manter refrigerado', 'MENINGO27B'), 
('AMP015', 10, 5.0, 'Manter refrigerado', 'PNEUMO28B'), 
('AMP016', 1, 0.5, 'Manter congelado', 'VARI2026C'), 
('AMP017', 1, 0.5, 'Manter refrigerado', 'HEPA2027C'),
('AMP018', 10, 5.0, 'Manter refrigerado', 'DTPa2028C'),
('AMP019', 10, 5.0, 'Manter refrigerado', 'AZ2025A'), 
('AMP020', 5, 2.5, 'Manter refrigerado', 'JANSS2025A'), 
('AMP021', 5, 2.5, 'Manter refrigerado', 'DENG2026A'), 
('AMP022', 1, 1.0, 'Manter refrigerado', 'RAIVA2027A'), 
('AMPVENCE01', 5, 2.5, 'Manter refrigerado', 'VENCEJUL25'),
-- Ampolas de Lotes Vencidos
('AMPEXP01', 6, 0.3, 'Manter ultra-congelado', 'EXP2024A'), 
('AMPEXP02', 10, 5.0, 'Manter refrigerado', 'EXP2025B'), 
('AMPEXP03', 5, 2.5, 'Manter refrigerado', 'EXP2024C'), 
('AMPEXP_JUN25', 10, 5.0, 'Manter refrigerado', 'EXP_JUN25');
GO

-- Tabela Dose 
INSERT INTO dbo.Dose (Cd_Dose, Nu_Dose, Cd_Ampola) VALUES
(1, 1, 'AMP001'), (2, 2, 'AMP001'), (3, 1, 'AMP002'), (4, 1, 'AMP003'), 
(5, 2, 'AMP003'), (6, 1, 'AMP004'), (7, 1, 'AMP005'), (8, 1, 'AMP006'), 
(9, 1, 'AMP007'), (10, 1, 'AMP008'), (11, 3, 'AMP001'), (12, 1, 'AMP009'), 
(13, 1, 'AMP010'), (14, 3, 'AMP003'), (15, 1, 'AMP011'), (16, 2, 'AMP011'), 
(17, 1, 'AMP012'), (18, 1, 'AMP013'), (19, 1, 'AMP014'), (20, 2, 'AMP014'), 
(21, 1, 'AMP015'), (22, 2, 'AMP015'), (23, 1, 'AMP016'), (24, 1, 'AMP017'), 
(25, 1, 'AMP018'), (26, 2, 'AMP018'), (27, 1, 'AMP019'), (28, 2, 'AMP019'), 
(29, 1, 'AMP020'), (30, 1, 'AMP021'), (31, 1, 'AMP022'), (32, 4, 'AMP001'), 
(33, 5, 'AMP001'), (34, 6, 'AMP001'), (35, 4, 'AMP003'), (36, 5, 'AMP003'), 
(37, 2, 'AMP008'), (38, 3, 'AMP008'), (39, 4, 'AMP008'), (40, 3, 'AMP011'), 
(41, 3, 'AMP014'), (42, 3, 'AMP015'), (43, 3, 'AMP018'), (44, 3, 'AMP019'), 
(53, 1, 'AMPVENCE01'),
-- Doses de Ampolas Vencidas
(50, 1, 'AMPEXP01'), (51, 1, 'AMPEXP02'), (52, 1, 'AMPEXP03'), (54, 1, 'AMPEXP_JUN25');
GO



-- Tabela Vacinacao
INSERT INTO dbo.Vacinacao (Cd_Paciente, Cd_COREN, Cd_Unidade_Medica, Cd_Dose, Dt_Vacinacao) VALUES
-- Histórico completo para o "Superpaciente" João da Silva (Cd_Paciente = 1)
(1, 'SP12345-ENF', 'CNES1234567', 1, '2025-01-20'), (1, 'SP12345-ENF', 'CNES1234567', 2, '2025-02-10'),
(1, 'RJ54321-ENF', 'CNES7654321', 3, '2025-03-01'), (1, 'MG67890-ENF', 'CNES1122334', 4, '2025-03-05'),
(1, 'BA09876-ENF', 'CNES5566778', 6, '2025-04-10'), (1, 'SP12345-ENF', 'CNES1234567', 7, '2025-04-12'),
(1, 'RJ54321-ENF', 'CNES7654321', 8, '2025-05-15'), (1, 'MG67890-ENF', 'CNES1122334', 9, '2025-05-20'),
(1, 'BA09876-ENF', 'CNES5566778', 10, '2025-06-01'), (1, 'SP12345-ENF', 'CNES1234567', 15, '2025-06-05'),
(1, 'RJ54321-ENF', 'CNES7654321', 17, '2025-06-10'), (1, 'MG67890-ENF', 'CNES1122334', 18, '2025-06-15'),
(1, 'BA09876-ENF', 'CNES5566778', 19, '2025-06-20'), (1, 'SP12345-ENF', 'CNES1234567', 21, '2025-06-25'),
(1, 'RJ54321-ENF', 'CNES7654321', 23, '2025-06-30'), (1, 'MG67890-ENF', 'CNES1122334', 24, '2025-07-05'),
(1, 'BA09876-ENF', 'CNES5566778', 25, '2025-07-10'), (1, 'SP12345-ENF', 'CNES1234567', 27, '2025-07-15'),
(1, 'RJ54321-ENF', 'CNES7654321', 29, '2025-07-20'), (1, 'MG67890-ENF', 'CNES1122334', 30, '2025-07-25'),
(1, 'BA09876-ENF', 'CNES5566778', 31, '2025-07-30'),
-- Outras vacinações
(3, 'SP12345-ENF', 'CNES1234567', 12, '2025-08-01'), (4, 'RJ54321-ENF', 'CNES7654321', 13, '2025-08-02'),
(5, 'MG67890-ENF', 'CNES1122334', 14, '2025-08-03'), (7, 'BA09876-ENF', 'CNES5566778', 16, '2025-08-04'),
(8, 'SP12345-ENF', 'CNES1234567', 20, '2025-08-05'), (9, 'RJ54321-ENF', 'CNES7654321', 22, '2025-08-06'),
-- Vacinações com doses vencidas
(19, 'SC24680-ENF', 'CNES1122334', 50, '2025-08-10'), -- Vinicius Moraes tomando Pfizer vencida
(20, 'SC24680-ENF', 'CNES1122334', 51, '2025-08-11'), -- Gabriela Barros tomando Gripe vencida
(21, 'SC24680-ENF', 'CNES1122334', 52, '2025-08-12'); -- Leandro Azevedo tomando Janssen vencida
GO

-- Tabela UnidadeMedica_Vacinador
INSERT INTO dbo.UnidadeMedica_Vacinador (Cd_Unidade_Medica, Cd_COREN) VALUES
('CNES1234567', 'SP12345-ENF'), ('CNES7654321', 'RJ54321-ENF'), ('CNES1122334', 'MG67890-ENF'),
('CNES5566778', 'BA09876-ENF'), ('CNES1234567', 'BA09876-ENF'), ('CNES1234567', 'RJ54321-ENF'),
('CNES7654321', 'SP12345-ENF'), ('CNES1122334', 'SC24680-ENF');
GO
