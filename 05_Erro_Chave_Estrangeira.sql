USE BD_vacinacao;
GO


SELECT * FROM dbo.Fabricante;

-- Tentar inserir um novo lote de vacina com fabricante com código desconhecido
INSERT INTO dbo.Lote (
    Cd_Lote,
    Cd_Fabricante,      
    Cd_Tipo_Vacina,
    Dt_Fabricacao,
    Dt_Vencimento
)
VALUES (
    'LOTE_TESTE',       
    'FABRICANTE_X', -- Este fabricante não existe na tabela dbo.Fabricante.
    4,              -- Tipo de Vacina 4 = Tríplice Viral
    '2025-01-01',
    '2026-01-01'
);
GO
