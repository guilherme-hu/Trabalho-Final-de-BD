USE BD_Vacinacao;
GO


-- Inserção de uma Vacinação com data antiga
BEGIN TRANSACTION;
INSERT INTO dbo.Vacinacao (Cd_Paciente, Cd_COREN, Cd_Unidade_Medica, Cd_Dose, Dt_Vacinacao)
VALUES (1, 'SC24680-ENF', 'CNES9988776', 40, '1999-12-31'); -- Data antiga

-- Verificação durante a transição
SELECT * FROM dbo.Vacinacao WHERE Cd_Paciente = 1 AND Cd_Dose = 40;

-- Desfazer a transação para não ficar adicionando informação nova nas tabelas
ROLLBACK TRANSACTION;
