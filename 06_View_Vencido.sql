USE BD_vacinacao;
GO


-- Primeiro, remove a VIEW se ela já existir 
IF OBJECT_ID('dbo.LotesVencidos', 'V') IS NOT NULL
    DROP VIEW dbo.LotesVencidos;
GO

-- Agora, cria a VIEW
CREATE VIEW dbo.LotesVencidos AS
SELECT
    Cd_Lote,
    Cd_Fabricante,
    Cd_Tipo_Vacina,
    Dt_Fabricacao,
    Dt_Vencimento
FROM
    dbo.Lote
WHERE
    Dt_Vencimento < GETDATE(); -- GETDATE() pega a data atual do sistema.
GO


-- Usar a View como tabela
SELECT * FROM dbo.LotesVencidos;
GO

