USE BD_vacinacao;
GO

IF EXISTS (SELECT * FROM sys.check_constraints WHERE name = 'CK_Lote_QuantidadeMaxima')
BEGIN
    ALTER TABLE dbo.Lote DROP CONSTRAINT CK_Lote_QuantidadeMaxima;
END
GO

BEGIN TRANSACTION;

-- Adicionar a constraint de quantidade dentro da transação.
ALTER TABLE dbo.Lote
ADD CONSTRAINT CK_Lote_QuantidadeMaxima CHECK (Qt_Quantidade <= 100);

INSERT INTO dbo.Lote (Cd_Lote, Cd_Fabricante, Cd_Tipo_Vacina, Dt_Fabricacao, Dt_Vencimento, Qt_Quantidade)
VALUES ('LOTE_TESTE', 'PFIZER', 1, '2025-01-01', '2026-01-01', 150);

/*
INSERT INTO dbo.Lote (Cd_Lote, Cd_Fabricante, Cd_Tipo_Vacina, Dt_Fabricacao, Dt_Vencimento, Qt_Quantidade)
VALUES ('LOTE_TESTE', 'PFIZER', 1, '2025-01-01', '2026-01-01', 50);
SELECT * FROM dbo.Lote WHERE Cd_Lote = 'LOTE_TESTE';
*/

ROLLBACK TRANSACTION;
GO

	
