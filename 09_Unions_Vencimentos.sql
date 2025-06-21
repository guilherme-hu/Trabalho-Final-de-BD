USE BD_vacinacao;
GO


-- Seleciona os lotes que irão vencer nos próximos 30 dias
SELECT
    Cd_Lote,
    Cd_Fabricante,
    Dt_Vencimento,
    'A Vencer' AS Status_Lote 
FROM
    dbo.Lote
WHERE
    Dt_Vencimento BETWEEN GETDATE() AND DATEADD(day, 30, GETDATE())

UNION ALL

-- Seleciona os lotes que venceram nos últimos 30 dias
SELECT
    Cd_Lote,
    Cd_Fabricante,
    Dt_Vencimento,
    'Vencido' AS Status_Lote 
FROM
    dbo.Lote
WHERE
    Dt_Vencimento BETWEEN DATEADD(day, -30, GETDATE()) AND GETDATE()


ORDER BY
    Dt_Vencimento;
GO
