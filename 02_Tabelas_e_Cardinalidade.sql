USE BD_vacinacao;
GO

SELECT 'Ampola' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Ampola
UNION ALL
SELECT 'Bairro' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Bairro
UNION ALL
SELECT 'Complemento' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Complemento
UNION ALL
SELECT 'Dose' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Dose
UNION ALL
SELECT 'Endereco' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Endereco
UNION ALL
SELECT 'Fabricante' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Fabricante
UNION ALL
SELECT 'Logradouro' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Logradouro
UNION ALL
SELECT 'Lote' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Lote
UNION ALL
SELECT 'Municipio' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Municipio
UNION ALL
SELECT 'Nacionalidade' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Nacionalidade
UNION ALL
SELECT 'Paciente' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Paciente
UNION ALL
SELECT 'Pais' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Pais
UNION ALL
SELECT 'Pessoa' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Pessoa
UNION ALL
SELECT 'PessoaFisica' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.PessoaFisica
UNION ALL
SELECT 'PessoaJuridica' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.PessoaJuridica
UNION ALL
SELECT 'TipoComplemento' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.TipoComplemento
UNION ALL
SELECT 'TipoEndereco' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.TipoEndereco
UNION ALL
SELECT 'TipoLogradouro' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.TipoLogradouro
UNION ALL
SELECT 'TipoVacina' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.TipoVacina
UNION ALL
SELECT 'UF' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.UF
UNION ALL
SELECT 'UnidadeMedica' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.UnidadeMedica
UNION ALL
SELECT 'UnidadeMedica_Vacinador' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.UnidadeMedica_Vacinador
UNION ALL
SELECT 'Vacinacao' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Vacinacao
UNION ALL
SELECT 'Vacinador' AS Tabela, COUNT(*) AS Cardinalidade FROM dbo.Vacinador
ORDER BY Tabela;
GO
