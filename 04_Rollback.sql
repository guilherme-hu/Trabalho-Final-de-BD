USE BD_vacinacao;
GO


-- Verificar o paciente com Cd_Paciente = 3 ANTES da transação
SELECT * FROM dbo.Paciente WHERE Cd_Paciente = 3;
GO

-- Iniciar transação que deleta paciente com Cd_Paciente = 3
BEGIN TRANSACTION;
DELETE FROM dbo.Vacinacao WHERE Cd_Paciente = 3; -- Deletar tabela filha primeiro para não violar a FK
DELETE FROM dbo.Paciente WHERE Cd_Paciente = 3;

-- Verificar que o paciente foi removido DENTRO da transação
SELECT * FROM dbo.Paciente WHERE Cd_Paciente = 3;

-- Desfazer a transação
ROLLBACK TRANSACTION;
GO

-- Verificar o paciente FORA da transação
SELECT * FROM dbo.Paciente WHERE Cd_Paciente = 3;
GO
