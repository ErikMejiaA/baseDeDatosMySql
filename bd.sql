-- Active: 1685709011854@@127.0.0.1@3306@mitienda
--CRear una tabala dentro de la base de datos 
CREATE TABLE cliente(
    idCliente       varchar(15),
    primerNombre    varchar(25),
    segundoNombre   varchar(25),
    primerApellido  varchar(25),
    segundoApellido varchar(25)
);

--CRear una tabala dentro de la base de datos 
CREATE TABLE pais(
    idPais int NOT NULL AUTO_INCREMENT,
    nombrePais varchar(50) NOT NULL,
    CONSTRAINT PK_Pais PRIMARY KEY (idPais)

);

--CRear una tabala dentro de la base de datos 
CREATE TABLE departamento(
    idDep int NOT NULL AUTO_INCREMENT,
    nombreDep varchar(58) NOT NULL,
    idPais int(11),
    CONSTRAINT PK_Departamento PRIMARY KEY (idDep),
    CONSTRAINT FK_PaisDep FOREIGN KEY (idPais) REFERENCES pais(idPais)
);

--CRear una tabala dentro de la base de datos 
CREATE TABLE region(
    idReg int NOT NULL AUTO_INCREMENT,
    nombreReg varchar(58) NOT NULL,
    idDep int(11),
    CONSTRAINT PK_Region PRIMARY KEY (idReg),
    CONSTRAINT FK_DepRegion FOREIGN KEY (idDep) REFERENCES departamento(idDep)
);

--ingresar un registro 
INSERT INTO pais(nombrePais) VALUES ('Colombia');
INSERT INTO pais(nombrePais) VALUES ('Colombia'), ('Peru'), ('Argentina'), ('EStados Unidos');

--modificar un campo de la tabla metod UPDATE
UPDATE pais
SET nombrePais = 'España'
WHERE idPais = 3;

--selecionar una tabla para visualisar sus datos
SELECT * FROM pais;

--Eliminar datos de una tabla metodo DELETE
DELETE FROM pais 
WHERE idPais = 2;

--seleccionar un solo campo de la tabla 
SELECT idPais, nombrePais
FROM pais
WHERE idPais = 1;

--Visualizar todas las trablas de la base de datos
SHOW TABLES;

--borrar todos los datos de la tabla 
DELETE FROM region;

--Llenamos la tabla departamentos 

INSERT INTO departamento(nombreDep, idPais) VALUES ('Santander', 1), ('Amazonas', 1), ('Norte de Santander', 1), ('Cundinamarca', 1), ('Nueva Inglaterra', 5), ('Atlantico Medio', 5), ('Atlantico Sur', 5), ('Centro Norte Oriental', 5), ('Centro Sur Oriental', 5), ('Centro Nort Oriental', 5), ('Centro Norte Ocidental', 5), ('Centro sur Occidental', 5);

--llenamos la tabla de region de la base de datos
INSERT INTO region(nombreReg, idDep) VALUES ('Maine', 5), ('Nuevo Hampshive', 5), ('Vermont', 5), ('Massachusetts', 5), ('Connecticut', 5), ('Rhode', 5), ('Island', 5), ('Bucaramaga', 1), ('Floridablanca', 1), ('Giron', 1), ('Piedecuesta', 1), ('Lebrija', 1);

--hacer consultas con las tablas de la base de datos (ver patallaso)

