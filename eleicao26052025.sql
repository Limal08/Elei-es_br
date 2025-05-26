create database eleições_br;
use eleições_br;


CREATE TABLE Localidade (
    nome CHAR
);

CREATE TABLE Zona_Eleitoral (
    id_zona INTEGER PRIMARY KEY,
    numero INTEGER
);

CREATE TABLE Secao_Eleitoral (
    id_secao INTEGER PRIMARY KEY,
    numero INTEGER
);

CREATE TABLE Partido (
    Id_partido INTEGER PRIMARY KEY,
    nome_partido VARCHAR(35),
    sigla VARCHAR(15),
    fk_Cargo_Id_cargo INTEGER
);

CREATE TABLE Candidato (
    id_candidato INTEGER PRIMARY KEY,
    id_partido INTEGER,
    id_cargo INTEGER,
    nome VARCHAR(50),
    numero_candidato INTEGER,
    fk_Partido_Id_partido INTEGER
);

CREATE TABLE Apuracao (
    id_apuracao INTEGER PRIMARY KEY,
    resultados_apuracao VARCHAR(300)
);

CREATE TABLE Cargo (
    Id_cargo INTEGER PRIMARY KEY,
    Nome_cargo VARCHAR(30),
    fk_Apuracao_id_apuracao INTEGER
);

CREATE TABLE Eleitor (
    id_eleitor INTEGER PRIMARY KEY,
    nome VARCHAR(50),
    titulo_eleitor VARCHAR(20),
    fk_Zona_Eleitoral_id_zona INTEGER,
    fk_Secao_Eleitoral_id_secao INTEGER
);

CREATE TABLE Ocorre_ (
    fk_Secao_Eleitoral_id_secao INTEGER,
    fk_Apuracao_id_apuracao INTEGER
);

CREATE TABLE Voto (
    fk_Candidato_id_candidato INTEGER,
    fk_Zona_Eleitoral_id_zona INTEGER
);
 
ALTER TABLE Partido ADD CONSTRAINT FK_Partido_2
    FOREIGN KEY (fk_Cargo_Id_cargo)
    REFERENCES Cargo (Id_cargo)
    ON DELETE RESTRICT;
 
ALTER TABLE Candidato ADD CONSTRAINT FK_Candidato_2
    FOREIGN KEY (fk_Partido_Id_partido)
    REFERENCES Partido (Id_partido)
    ON DELETE RESTRICT;
 
ALTER TABLE Cargo ADD CONSTRAINT FK_Cargo_2
    FOREIGN KEY (fk_Apuracao_id_apuracao)
    REFERENCES Apuracao (id_apuracao)
    ON DELETE RESTRICT;
 
ALTER TABLE Eleitor ADD CONSTRAINT FK_Eleitor_2
    FOREIGN KEY (fk_Zona_Eleitoral_id_zona)
    REFERENCES Zona_Eleitoral (id_zona)
    ON DELETE RESTRICT;
 
ALTER TABLE Eleitor ADD CONSTRAINT FK_Eleitor_3
    FOREIGN KEY (fk_Secao_Eleitoral_id_secao)
    REFERENCES Secao_Eleitoral (id_secao)
    ON DELETE RESTRICT;
 
ALTER TABLE Ocorre_ ADD CONSTRAINT FK_Ocorre__1
    FOREIGN KEY (fk_Secao_Eleitoral_id_secao)
    REFERENCES Secao_Eleitoral (id_secao)
    ON DELETE RESTRICT;
 
ALTER TABLE Ocorre_ ADD CONSTRAINT FK_Ocorre__2
    FOREIGN KEY (fk_Apuracao_id_apuracao)
    REFERENCES Apuracao (id_apuracao)
    ON DELETE RESTRICT;
 
ALTER TABLE Voto ADD CONSTRAINT FK_Voto_1
    FOREIGN KEY (fk_Candidato_id_candidato)
    REFERENCES Candidato (id_candidato)
    ON DELETE RESTRICT;
 
ALTER TABLE Voto ADD CONSTRAINT FK_Voto_2
    FOREIGN KEY (fk_Zona_Eleitoral_id_zona)
    REFERENCES Zona_Eleitoral (id_zona)
    ON DELETE SET NULL;