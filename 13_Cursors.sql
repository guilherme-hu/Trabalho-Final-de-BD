USE BD_vacinacao;
GO


DECLARE @DtVacinacao DATE;
DECLARE @NmPaciente VARCHAR(255);
DECLARE @CdLote VARCHAR(10);
DECLARE @NmFabricante VARCHAR(45);

-- Declarar cursor
DECLARE cursor_vacinacoes CURSOR FOR
    SELECT
        dbo.Vacinacao.Dt_Vacinacao,
        dbo.Pessoa.Nm_Pessoa,
        dbo.Lote.Cd_Lote,
        dbo.Fabricante.Nm_Fabricante
    FROM
        dbo.Vacinacao
    JOIN dbo.Paciente ON dbo.Vacinacao.Cd_Paciente = dbo.Paciente.Cd_Paciente
    JOIN dbo.Pessoa ON dbo.Paciente.Cd_Pessoa = dbo.Pessoa.Cd_Pessoa
    JOIN dbo.Dose ON dbo.Vacinacao.Cd_Dose = dbo.Dose.Cd_Dose
    JOIN dbo.Ampola ON dbo.Dose.Cd_Ampola = dbo.Ampola.Cd_Ampola
    JOIN dbo.Lote ON dbo.Ampola.Cd_Lote = dbo.Lote.Cd_Lote
    JOIN dbo.Fabricante ON dbo.Lote.Cd_Fabricante = dbo.Fabricante.Cd_Fabricante
    ORDER BY
        dbo.Vacinacao.Dt_Vacinacao;

-- Abrir o cursor
OPEN cursor_vacinacoes;

-- Obter a primeira linha do resultado do cursor.
FETCH NEXT FROM cursor_vacinacoes INTO
    @DtVacinacao,
    @NmPaciente,
    @CdLote,
    @NmFabricante;

-- Laço que percorre todas as linhas.
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Data: ' + CONVERT(VARCHAR, @DtVacinacao, 103) +
          ' | Paciente: ' + @NmPaciente +
          ' | Lote: ' + @CdLote +
          ' | Fabricante: ' + @NmFabricante;

    FETCH NEXT FROM cursor_vacinacoes INTO
        @DtVacinacao,
        @NmPaciente,
        @CdLote,
        @NmFabricante;
END;

-- Fechar o cursor
CLOSE cursor_vacinacoes;

-- Desalocar o cursor
DEALLOCATE cursor_vacinacoes;
GO
