USE BD_vacinacao;
GO


BEGIN TRANSACTION;

-- Inserindo um Fabricante que NÃO produz nenhuma vacina
INSERT INTO dbo.Pessoa (Cd_Pessoa, Nm_Pessoa, Dt_Nascimento) VALUES (200, 'BioTech Pharma', '2010-01-01');
INSERT INTO dbo.PessoaJuridica (Cd_Pessoa, Cd_CNPJ, Nm_Comercial, Dt_Fundacao) VALUES (200, '10101010000110', 'BioTech', '2010-01-01');

INSERT INTO dbo.Fabricante (Cd_Fabricante, Nm_Fabricante, Nu_Autorizacao_ANVISA, Cd_Pessoa)
VALUES ('BIOTECH', 'BioTech Pharma', 99999, 200);


-- Inserindo um Tipo de Vacina que NÃO é produzido por nenhum fabricante
INSERT INTO dbo.TipoVacina (Cd_Tipo_Vacina, Nm_Tipo_Vacina, Ds_Vacina)
VALUES (99, 'Vacina Experimental Z', 'Vacina em fase de pesquisa');
GO

-- FULL JOIN
SELECT DISTINCT 
    dbo.Fabricante.Nm_Fabricante,
    dbo.TipoVacina.Nm_Tipo_Vacina
FROM
    dbo.Fabricante
FULL JOIN
    dbo.Lote ON dbo.Fabricante.Cd_Fabricante = dbo.Lote.Cd_Fabricante
FULL JOIN
    dbo.TipoVacina ON dbo.Lote.Cd_Tipo_Vacina = dbo.TipoVacina.Cd_Tipo_Vacina
ORDER BY
    dbo.Fabricante.Nm_Fabricante,
    dbo.TipoVacina.Nm_Tipo_Vacina;
GO



-- Desfazer as inserções para limpar o banco de dados
ROLLBACK TRANSACTION;
GO
