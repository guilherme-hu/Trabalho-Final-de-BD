USE BD_vacinacao;
GO


-- Verificar o nome original da pessoa com Cd_Pessoa = 2 ANTES da transação
SELECT Nm_Pessoa FROM dbo.Pessoa WHERE Cd_Pessoa = 2;
GO

-- Iniciar a transação que atualiza nome da pessoa
BEGIN TRANSACTION;
UPDATE dbo.Pessoa
SET Nm_Pessoa = 'Maria Josephina Coquinho'
WHERE Cd_Pessoa = 2;

-- Verificar o nome DENTRO da transação 
SELECT Nm_Pessoa FROM dbo.Pessoa WHERE Cd_Pessoa = 2;

-- Confirmar a transação -> as alterações agora são permanentes
COMMIT TRANSACTION;
GO

-- Verificar o nome FORA da transação
SELECT Nm_Pessoa FROM dbo.Pessoa WHERE Cd_Pessoa = 2;
GO
