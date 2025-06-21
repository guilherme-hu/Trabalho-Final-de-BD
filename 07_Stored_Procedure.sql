USE BD_vacinacao;
GO


-- Remove o procedimento se ele já existir
IF OBJECT_ID('dbo.sp_PacientesComVacinaVencida', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_PacientesComVacinaVencida;
GO


CREATE PROCEDURE dbo.sp_PacientesComVacinaVencida
AS
BEGIN
    
    SELECT
        dbo.Pessoa.Nm_Pessoa AS Nome_Paciente,
        dbo.TipoVacina.Nm_Tipo_Vacina AS Nome_Vacina,
        dbo.Fabricante.Nm_Fabricante AS Fabricante,
        dbo.Lote.Cd_Lote AS Lote,
        dbo.Lote.Dt_Vencimento AS Data_Vencimento_Lote,
        dbo.Vacinacao.Dt_Vacinacao AS Data_Aplicacao
    FROM
        dbo.Pessoa
    JOIN dbo.Paciente ON dbo.Pessoa.Cd_Pessoa = dbo.Paciente.Cd_Pessoa
    JOIN dbo.Vacinacao ON dbo.Paciente.Cd_Paciente = dbo.Vacinacao.Cd_Paciente
    JOIN dbo.Dose ON dbo.Vacinacao.Cd_Dose = dbo.Dose.Cd_Dose
    JOIN dbo.Ampola ON dbo.Dose.Cd_Ampola = dbo.Ampola.Cd_Ampola
    JOIN dbo.Lote ON dbo.Ampola.Cd_Lote = dbo.Lote.Cd_Lote
    JOIN dbo.TipoVacina ON dbo.Lote.Cd_Tipo_Vacina = dbo.TipoVacina.Cd_Tipo_Vacina
    JOIN dbo.Fabricante ON dbo.Lote.Cd_Fabricante = dbo.Fabricante.Cd_Fabricante
    WHERE
        dbo.Lote.Dt_Vencimento < dbo.Vacinacao.Dt_Vacinacao -- Condição de vencimento da vacina
END;
GO

-- Usar a procedure
EXEC dbo.sp_PacientesComVacinaVencida;
GO
