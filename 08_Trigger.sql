USE BD_vacinacao;
GO


-- Remove trigger se ele já existedbo.trg_AtualizaDataVacinacao
IF OBJECT_ID('dbo.trg_AtualizaDataVacinacao', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_AtualizaDataVacinacao;
GO


CREATE TRIGGER dbo.trg_AtualizaDataVacinacao
ON dbo.Vacinacao -- O trigger será disparado na tabela Vacinacao
AFTER INSERT -- A ação acontecerá DEPOIS que um novo registro for inserido
AS
BEGIN
    UPDATE dbo.Vacinacao
    SET
        Dt_Vacinacao = GETDATE() -- GETDATE() pega a data e hora atuais do servidor.
    FROM
        dbo.Vacinacao
    INNER JOIN inserted ON dbo.Vacinacao.Cd_Paciente = inserted.Cd_Paciente
                       AND dbo.Vacinacao.Cd_COREN = inserted.Cd_COREN
                       AND dbo.Vacinacao.Cd_Unidade_Medica = inserted.Cd_Unidade_Medica
                       AND dbo.Vacinacao.Cd_Dose = inserted.Cd_Dose;
END;
GO

