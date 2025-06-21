USE BD_vacinacao;
GO

-- Para selecionar todas as pessoas e quais vacinas tomaram
/*
SELECT
    dbo.Pessoa.Nm_Pessoa AS Nome_Paciente,
    dbo.Fabricante.Nm_Fabricante AS Fabricante_Vacina,
    dbo.TipoVacina.Nm_Tipo_Vacina AS Nome_Vacina,
    dbo.Dose.Nu_Dose AS Numero_Dose,
    dbo.Vacinacao.Dt_Vacinacao AS Data_Vacinacao
FROM dbo.Pessoa
JOIN dbo.Paciente ON dbo.Pessoa.Cd_Pessoa = dbo.Paciente.Cd_Pessoa
JOIN dbo.Vacinacao ON dbo.Paciente.Cd_Paciente = dbo.Vacinacao.Cd_Paciente
JOIN dbo.Dose ON dbo.Vacinacao.Cd_Dose = dbo.Dose.Cd_Dose
JOIN dbo.Ampola ON dbo.Dose.Cd_Ampola = dbo.Ampola.Cd_Ampola
JOIN dbo.Lote ON dbo.Ampola.Cd_Lote = dbo.Lote.Cd_Lote
JOIN dbo.Fabricante ON dbo.Lote.Cd_Fabricante = dbo.Fabricante.Cd_Fabricante
JOIN dbo.TipoVacina ON dbo.Lote.Cd_Tipo_Vacina = dbo.TipoVacina.Cd_Tipo_Vacina
ORDER BY
    dbo.Pessoa.Nm_Pessoa,
    dbo.Fabricante.Nm_Fabricante;

GO
*/

SELECT
    dbo.Pessoa.Nm_Pessoa
FROM
    dbo.Pessoa
JOIN dbo.Paciente ON dbo.Pessoa.Cd_Pessoa = dbo.Paciente.Cd_Pessoa
JOIN dbo.Vacinacao ON dbo.Paciente.Cd_Paciente = dbo.Vacinacao.Cd_Paciente
JOIN dbo.Dose ON dbo.Vacinacao.Cd_Dose = dbo.Dose.Cd_Dose
JOIN dbo.Ampola ON dbo.Dose.Cd_Ampola = dbo.Ampola.Cd_Ampola
JOIN dbo.Lote ON dbo.Ampola.Cd_Lote = dbo.Lote.Cd_Lote
GROUP BY
    dbo.Pessoa.Nm_Pessoa
HAVING
    COUNT(DISTINCT dbo.Lote.Cd_Fabricante) = (SELECT COUNT(*) FROM dbo.Fabricante);

GO
