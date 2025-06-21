USE BD_vacinacao;
GO

-- Tabela País
CREATE TABLE dbo.Pais (
    Cd_Pais INT NOT NULL,
    Nm_Pais VARCHAR(45) NULL,
    PRIMARY KEY (Cd_Pais)
);
GO

-- Tabela UF
CREATE TABLE dbo.UF (
    Cd_UF INT NOT NULL,
    Cd_Pais INT NOT NULL,
    Nm_UF VARCHAR(45) NULL,
    PRIMARY KEY (Cd_UF),
    CONSTRAINT fk_UF_Pais1
        FOREIGN KEY (Cd_Pais)
        REFERENCES dbo.Pais (Cd_Pais)
);
CREATE INDEX fk_UF_Pais1_idx ON dbo.UF (Cd_Pais ASC);
GO

-- Tabela Municipio
CREATE TABLE dbo.Municipio (
    Cd_Municipio INT NOT NULL,
    Cd_UF INT NOT NULL,
    Nm_Municipio VARCHAR(45) NULL,
    PRIMARY KEY (Cd_Municipio),
    CONSTRAINT fk_Municipio_UF1
        FOREIGN KEY (Cd_UF)
        REFERENCES dbo.UF (Cd_UF)
);
CREATE INDEX fk_Municipio_UF1_idx ON dbo.Municipio (Cd_UF ASC);
GO

-- Tabela Bairro
CREATE TABLE dbo.Bairro (
    Cd_Bairro INT NOT NULL,
    Cd_Municipio INT NOT NULL,
    Nm_Bairro VARCHAR(45) NULL,
    PRIMARY KEY (Cd_Bairro),
    CONSTRAINT fk_Bairro_Municipio1
        FOREIGN KEY (Cd_Municipio)
        REFERENCES dbo.Municipio (Cd_Municipio)
);
CREATE INDEX fk_Bairro_Municipio1_idx ON dbo.Bairro (Cd_Municipio ASC);
GO

-- Tabela TipoLogradouro
CREATE TABLE dbo.TipoLogradouro (
    Cd_Tipo_Logradouro INT NOT NULL,
    Nm_Tipo_Logradouro VARCHAR(45) NULL,
    PRIMARY KEY (Cd_Tipo_Logradouro)
);
GO

-- Tabela Logradouro
CREATE TABLE dbo.Logradouro (
    Cd_Logradouro INT NOT NULL,
    Cd_Bairro INT NOT NULL,
    Cd_Tipo_Logradouro INT NOT NULL,
    Nm_Logradouro VARCHAR(45) NULL,
    PRIMARY KEY (Cd_Logradouro),
    CONSTRAINT fk_Logradouro_Bairro1
        FOREIGN KEY (Cd_Bairro)
        REFERENCES dbo.Bairro (Cd_Bairro),
    CONSTRAINT fk_Logradouro_TipoLogradouro1
        FOREIGN KEY (Cd_Tipo_Logradouro)
        REFERENCES dbo.TipoLogradouro (Cd_Tipo_Logradouro)
);
CREATE INDEX fk_Logradouro_Bairro1_idx ON dbo.Logradouro (Cd_Bairro ASC);
CREATE INDEX fk_Logradouro_TipoLogradouro1_idx ON dbo.Logradouro (Cd_Tipo_Logradouro ASC);
GO

-- Tabela Pessoa
CREATE TABLE dbo.Pessoa (
    Cd_Pessoa INT NOT NULL,
    Nm_Pessoa VARCHAR(255) NOT NULL,
    Dt_Nascimento DATE NOT NULL,
    PRIMARY KEY (Cd_Pessoa)
);
GO

-- Tabela PessoaFisica
CREATE TABLE dbo.PessoaFisica (
    Cd_Pessoa INT NOT NULL,
    Cd_CPF VARCHAR(11) NOT NULL,
    Nu_RG VARCHAR(8) NULL,
    PRIMARY KEY (Cd_Pessoa, Cd_CPF),
    CONSTRAINT fk_PessoaFisica_Pessoa1
        FOREIGN KEY (Cd_Pessoa)
        REFERENCES dbo.Pessoa (Cd_Pessoa)
);
CREATE INDEX fk_PessoaFisica_Pessoa1_idx ON dbo.PessoaFisica (Cd_Pessoa ASC);
GO

-- Tabela Paciente
CREATE TABLE dbo.Paciente (
    Cd_Paciente INT NOT NULL,
    Cd_Pessoa INT NOT NULL,
    Cd_CPF VARCHAR(11) NOT NULL,
    PRIMARY KEY (Cd_Paciente),
    CONSTRAINT fk_Paciente_PessoaFisica1
        FOREIGN KEY (Cd_Pessoa, Cd_CPF)
        REFERENCES dbo.PessoaFisica (Cd_Pessoa, Cd_CPF)
);
CREATE INDEX fk_Paciente_PessoaFisica1_idx ON dbo.Paciente (Cd_Pessoa ASC, Cd_CPF ASC);
GO

-- Tabela Vacinador
CREATE TABLE dbo.Vacinador (
    Cd_COREN VARCHAR(12) NOT NULL,
    Cd_Pessoa INT NOT NULL,
    Cd_CPF VARCHAR(11) NOT NULL,
    PRIMARY KEY (Cd_COREN),
    CONSTRAINT fk_Vacinador_PessoaFisica1
        FOREIGN KEY (Cd_Pessoa, Cd_CPF)
        REFERENCES dbo.PessoaFisica (Cd_Pessoa, Cd_CPF)
);
CREATE INDEX fk_Vacinador_PessoaFisica1_idx ON dbo.Vacinador (Cd_Pessoa ASC, Cd_CPF ASC);
GO

-- Tabela PessoaJuridica
CREATE TABLE dbo.PessoaJuridica (
    Cd_Pessoa INT NOT NULL,
    Cd_CNPJ VARCHAR(14) NULL,
    Nm_Comercial VARCHAR(45) NULL,
    Dt_Fundacao DATE NULL,
    PRIMARY KEY (Cd_Pessoa),
    CONSTRAINT fk_PessoaJuridica_Pessoa1
        FOREIGN KEY (Cd_Pessoa)
        REFERENCES dbo.Pessoa (Cd_Pessoa)
);
GO

-- Tabela UnidadeMedica
CREATE TABLE dbo.UnidadeMedica (
    Cd_Unidade_Medica VARCHAR(25) NOT NULL,
    Nm_Unidade_Medica VARCHAR(45) NULL,
    Cd_Pessoa INT NOT NULL,
    PRIMARY KEY (Cd_Unidade_Medica),
    CONSTRAINT fk_UnidadeMedica_PessoaJuridica1
        FOREIGN KEY (Cd_Pessoa)
        REFERENCES dbo.PessoaJuridica (Cd_Pessoa)
);
CREATE INDEX fk_UnidadeMedica_PessoaJuridica1_idx ON dbo.UnidadeMedica (Cd_Pessoa ASC);
GO

-- Tabela Fabricante
CREATE TABLE dbo.Fabricante (
    Cd_Fabricante VARCHAR(15) NOT NULL,
    Nm_Fabricante VARCHAR(45) NOT NULL,
    Nu_Autorizacao_ANVISA INT NULL,
    Cd_Pessoa INT NOT NULL,
    PRIMARY KEY (Cd_Fabricante),
    CONSTRAINT fk_Fabricante_PessoaJuridica1
        FOREIGN KEY (Cd_Pessoa)
        REFERENCES dbo.PessoaJuridica (Cd_Pessoa)
);
CREATE INDEX fk_Fabricante_PessoaJuridica1_idx ON dbo.Fabricante (Cd_Pessoa ASC);
GO

-- Tabela Nacionalidade
CREATE TABLE dbo.Nacionalidade (
    Cd_Nacionalidade INT IDENTITY(1,1) NOT NULL, 
    Cd_Pessoa INT NOT NULL,
    Cd_Pais INT NOT NULL,
    PRIMARY KEY (Cd_Nacionalidade),
    CONSTRAINT UQ_Pessoa_Pais UNIQUE (Cd_Pessoa, Cd_Pais), -- Garante que uma pessoa não pode ter a mesma nacionalidade duas vezes
    CONSTRAINT fk_Nacionalidade_Pessoa1 FOREIGN KEY (Cd_Pessoa) REFERENCES dbo.Pessoa(Cd_Pessoa),
    CONSTRAINT fk_Nacionalidade_Pais1 FOREIGN KEY (Cd_Pais) REFERENCES dbo.Pais(Cd_Pais)
);
CREATE INDEX fk_Nacionalidade_Pessoa1_idx ON dbo.Nacionalidade (Cd_Pessoa ASC);
CREATE INDEX fk_Nacionalidade_Pais1_idx ON dbo.Nacionalidade (Cd_Pais ASC);
GO

-- Tabela TipoComplemento
CREATE TABLE dbo.TipoComplemento (
    Cd_Tipo_Complemento INT NOT NULL,
    Nm_Tipo_Complemento VARCHAR(MAX) NULL,
    PRIMARY KEY (Cd_Tipo_Complemento)
);
GO

-- Tabela Complemento
CREATE TABLE dbo.Complemento (
    Ds_Complemento VARCHAR(255) NOT NULL,
    Cd_Tipo_Complemento INT NOT NULL,
    PRIMARY KEY (Ds_Complemento),
    CONSTRAINT fk_Complemento_TipoComplemento1
        FOREIGN KEY (Cd_Tipo_Complemento)
        REFERENCES dbo.TipoComplemento (Cd_Tipo_Complemento)
);
CREATE INDEX fk_Complemento_TipoComplemento1_idx ON dbo.Complemento (Cd_Tipo_Complemento ASC);
GO

-- Tabela TipoEndereco
CREATE TABLE dbo.TipoEndereco (
    Cd_Tipo_Endereco INT NOT NULL,
    Nm_Tipo_Endereco VARCHAR(45) NULL,
    PRIMARY KEY (Cd_Tipo_Endereco)
);
GO

-- Tabela Endereco
CREATE TABLE dbo.Endereco (
    Cd_Endereco INT NOT NULL,
    Nu_Logradouro INT NULL,
    Cd_Logradouro INT NOT NULL,
    Ds_Complemento VARCHAR(255) NULL,
    Cd_Tipo_Endereco INT NOT NULL,
    PF_Cd_Pessoa INT NULL,
    PF_Cd_CPF VARCHAR(11) NULL,
    PJ_Cd_Pessoa INT NULL,
    PRIMARY KEY (Cd_Endereco),
    CONSTRAINT fk_Endereco_Logradouro1
        FOREIGN KEY (Cd_Logradouro)
        REFERENCES dbo.Logradouro (Cd_Logradouro),
    CONSTRAINT fk_Endereco_Complemento1
        FOREIGN KEY (Ds_Complemento)
        REFERENCES dbo.Complemento (Ds_Complemento),
    CONSTRAINT fk_Endereco_TipoEndereco1
        FOREIGN KEY (Cd_Tipo_Endereco)
        REFERENCES dbo.TipoEndereco (Cd_Tipo_Endereco),
    CONSTRAINT fk_Endereco_PessoaFisica1
        FOREIGN KEY (PF_Cd_Pessoa, PF_Cd_CPF)
        REFERENCES dbo.PessoaFisica (Cd_Pessoa, Cd_CPF),
    CONSTRAINT fk_Endereco_PessoaJuridica1
        FOREIGN KEY (PJ_Cd_Pessoa)
        REFERENCES dbo.PessoaJuridica (Cd_Pessoa),
    CONSTRAINT CK_Endereco_TipoPessoa
        CHECK (
            (PF_Cd_Pessoa IS NOT NULL AND PF_Cd_CPF IS NOT NULL AND PJ_Cd_Pessoa IS NULL) OR
            (PF_Cd_Pessoa IS NULL AND PF_Cd_CPF IS NULL AND PJ_Cd_Pessoa IS NOT NULL)
        )
);
CREATE INDEX fk_Endereco_Logradouro1_idx ON dbo.Endereco (Cd_Logradouro ASC);
CREATE INDEX fk_Endereco_Complemento1_idx ON dbo.Endereco (Ds_Complemento ASC);
CREATE INDEX fk_Endereco_TipoEndereco1_idx ON dbo.Endereco (Cd_Tipo_Endereco ASC);
CREATE INDEX fk_Endereco_PessoaFisica1_idx ON dbo.Endereco (PF_Cd_Pessoa ASC, PF_Cd_CPF ASC);
CREATE INDEX fk_Endereco_PessoaJuridica1_idx ON dbo.Endereco (PJ_Cd_Pessoa ASC);
GO

-- Tabela TipoVacina
CREATE TABLE dbo.TipoVacina (
    Cd_Tipo_Vacina INT NOT NULL,
    Nm_Tipo_Vacina VARCHAR(45) NULL,
    Ds_Vacina VARCHAR(MAX) NULL,
    PRIMARY KEY (Cd_Tipo_Vacina)
);
GO

-- Tabela Lote
CREATE TABLE dbo.Lote (
    Cd_Lote VARCHAR(10) NOT NULL,
    Cd_Fabricante VARCHAR(15) NOT NULL,
    Cd_Tipo_Vacina INT NOT NULL,
    Dt_Fabricacao DATE NOT NULL,
    Dt_Vencimento DATE NOT NULL,
    PRIMARY KEY (Cd_Lote),
    CONSTRAINT fk_Lote_TipoVacina1
        FOREIGN KEY (Cd_Tipo_Vacina)
        REFERENCES dbo.TipoVacina (Cd_Tipo_Vacina),
    CONSTRAINT fk_Lote_Fabricante1
        FOREIGN KEY (Cd_Fabricante)
        REFERENCES dbo.Fabricante (Cd_Fabricante)
);
CREATE INDEX fk_Lote_TipoVacina1_idx ON dbo.Lote (Cd_Tipo_Vacina ASC);
CREATE INDEX fk_Lote_Fabricante1_idx ON dbo.Lote (Cd_Fabricante ASC);
GO

-- Tabela Ampola
CREATE TABLE dbo.Ampola (
    Cd_Ampola VARCHAR(45) NOT NULL,
    Qt_Doses INT NOT NULL,
    Vl_Volume FLOAT NOT NULL,
    Ds_Condicoes_Armazenamento VARCHAR(MAX) NULL,
    Cd_Lote VARCHAR(10) NOT NULL,
    PRIMARY KEY (Cd_Ampola),
    CONSTRAINT fk_Ampola_Lote1
        FOREIGN KEY (Cd_Lote)
        REFERENCES dbo.Lote (Cd_Lote)
);
CREATE INDEX fk_Ampola_Lote1_idx ON dbo.Ampola (Cd_Lote ASC);
GO

-- Tabela Dose
CREATE TABLE dbo.Dose (
    Cd_Dose INT NOT NULL,
    Nu_Dose INT NULL,
    Cd_Ampola VARCHAR(45) NOT NULL,
    PRIMARY KEY (Cd_Dose),
    CONSTRAINT fk_Dose_Ampola1
        FOREIGN KEY (Cd_Ampola)
        REFERENCES dbo.Ampola (Cd_Ampola)
);
CREATE INDEX fk_Dose_Ampola1_idx ON dbo.Dose (Cd_Ampola ASC);
GO

-- Tabela Vacinação
CREATE TABLE dbo.Vacinacao (
    Cd_Paciente INT NOT NULL,
    Cd_COREN VARCHAR(12) NOT NULL,
    Cd_Unidade_Medica VARCHAR(25) NOT NULL,
    Cd_Dose INT NOT NULL,
    Dt_Vacinacao DATE NULL,
    PRIMARY KEY (Cd_Paciente, Cd_COREN, Cd_Unidade_Medica, Cd_Dose),
    CONSTRAINT fk_Vacinacao_Paciente1
        FOREIGN KEY (Cd_Paciente)
        REFERENCES dbo.Paciente (Cd_Paciente),
    CONSTRAINT fk_Vacinacao_Vacinador1
        FOREIGN KEY (Cd_COREN)
        REFERENCES dbo.Vacinador (Cd_COREN),
    CONSTRAINT fk_Vacinacao_UnidadeMedica1
        FOREIGN KEY (Cd_Unidade_Medica)
        REFERENCES dbo.UnidadeMedica (Cd_Unidade_Medica),
    CONSTRAINT fk_Vacinacao_Dose1
        FOREIGN KEY (Cd_Dose)
        REFERENCES dbo.Dose (Cd_Dose)
);
CREATE INDEX fk_Vacinacao_Paciente1_idx ON dbo.Vacinacao (Cd_Paciente ASC);
CREATE INDEX fk_Vacinacao_Vacinador1_idx ON dbo.Vacinacao (Cd_COREN ASC);
CREATE INDEX fk_Vacinacao_UnidadeMedica1_idx ON dbo.Vacinacao (Cd_Unidade_Medica ASC);
CREATE INDEX fk_Vacinacao_Dose1_idx ON dbo.Vacinacao (Cd_Dose ASC);
GO

-- Tabela de relacionamento UnidadeMedica_Vacinador
CREATE TABLE dbo.UnidadeMedica_Vacinador (
    Cd_Unidade_Medica VARCHAR(25) NOT NULL,
    Cd_COREN VARCHAR(12) NOT NULL,
    PRIMARY KEY (Cd_Unidade_Medica, Cd_COREN),
    CONSTRAINT fk_UnidadeMedica_has_Vacinador_UnidadeMedica1
        FOREIGN KEY (Cd_Unidade_Medica)
        REFERENCES dbo.UnidadeMedica (Cd_Unidade_Medica),
    CONSTRAINT fk_UnidadeMedica_has_Vacinador_Vacinador1
        FOREIGN KEY (Cd_COREN)
        REFERENCES dbo.Vacinador (Cd_COREN)
);
CREATE INDEX fk_UnidadeMedica_has_Vacinador_Vacinador1_idx ON dbo.UnidadeMedica_Vacinador (Cd_COREN ASC);
CREATE INDEX fk_UnidadeMedica_has_Vacinador_UnidadeMedica1_idx ON dbo.UnidadeMedica_Vacinador (Cd_Unidade_Medica ASC);
GO
