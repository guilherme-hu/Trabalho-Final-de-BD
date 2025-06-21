USE BD_vacinacao;
GO
 

-- Verificar e remover a Tabela Temporária se ela já existe
IF OBJECT_ID('tempdb..##FabricantesTemporarios') IS NOT NULL
    DROP TABLE ##FabricantesTemporarios; 
GO

-- Criar e popular a Tabela Temporária Global com dados da tabela de Fabricantes
SELECT *
INTO ##FabricantesTemporarios
FROM dbo.Fabricante;
GO

-- Teste de inserção na tabela temporária
BEGIN TRANSACTION;

    INSERT INTO ##FabricantesTemporarios (Cd_Fabricante, Nm_Fabricante, Nu_Autorizacao_ANVISA, Cd_Pessoa)
    VALUES ('NOVOFAB', 'Novo Fabricante de Teste', 112233, 999);

    SELECT * FROM ##FabricantesTemporarios;

    SELECT * FROM dbo.Fabricante;

ROLLBACK TRANSACTION;
GO
