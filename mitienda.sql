-- Active: 1685758617511@@127.0.0.1@3306@mitienda
--iniciar MYSQl
--mysql -u [user] -p
--contraseña 

--visualisar la base de datos
SHOW DATABASES;

--crear una base de datos
CREATE DATABASE mitienda;

--Eliminar una base de datos
DROP DATABASE mitienda;

--seleccionar una base datos para administra cada uno de los objetos
USE mitienda;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--CRear una tabla pais dentro de la base de datos 
CREATE TABLE pais(
    idPais int NOT NULL AUTO_INCREMENT,
    nombrePais varchar(50) NOT NULL UNIQUE,
    CONSTRAINT PK_Pais PRIMARY KEY (idPais)

);

--CRear una tabla departamento dentro de la base de datos 
CREATE TABLE departamento(
    idDep int NOT NULL AUTO_INCREMENT,
    nombreDep varchar(58) NOT NULL UNIQUE,
    idPais int(11),
    CONSTRAINT PK_Departamento PRIMARY KEY (idDep),
    CONSTRAINT FK_PaisDep FOREIGN KEY (idPais) REFERENCES pais(idPais)
);

--CRear una tabla region dentro de la base de datos 
CREATE TABLE region(
    idReg int NOT NULL AUTO_INCREMENT,
    nombreReg varchar(58) NOT NULL UNIQUE,
    idDep int(11),
    CONSTRAINT PK_Region PRIMARY KEY (idReg),
    CONSTRAINT FK_DepRegion FOREIGN KEY (idDep) REFERENCES departamento(idDep)
);

--Creamos la tabla clientes de la base de datos
CREATE TABLE cliente(
    idCliente INT NOT NULL AUTO_INCREMENT,
    primerNombre    varchar(25) NOT NULL,
    segundoNombre   varchar(25) NOT NULL,
    primerApellido  varchar(25) NOT NULL,
    segundoApellido varchar(25) NOT NULL,
    emailCliente    varchar (100) NOT NULL UNIQUE,
    fechaNacimiento date NOT NULL,
    idReg Int(11),
    CONSTRAINT PK_Cliente PRIMARY KEY (idCliente),
    CONSTRAINT FK_ClienteRegion FOREIGN KEY (idReg) REFERENCES region(idReg)
);

--Ingresamos datos a las tablas de la base de datos
--llenando la tabla de pais
INSERT INTO pais(nombrePais) VALUES ('Colombia'), ('Ecuador'), ('España'), ('Argentina'), ('Estados Unidos');

--llenamos la tabla de departamento
INSERT INTO departamento(nombreDep, idPais) VALUES ('Santander', 1), ('Amazonas', 1), ('Norte de Santander', 1), ('Cundinamarca', 1), ('Nueva Inglatrra', 5), ('Atlantico Medio', 5), ('Atlantico Sur', 5), ('Centro Norte Oriental', 5), ('Centro sur oriental', 5), ('Centro Norte Occidental', 5), ('Centro Sur Occidental', 5);

--llenamos la tabla de region
INSERT INTO region(nombreReg, idDep) VALUES ('Maine Dos', 5), ('Nuevo Hampshire', 5), ('Vermont', 5), ('Massachusetts', 5), ('Connecticut', 5), ('Rhode', 5), ('Island', 5), ('Bucaramanga', 1), ('Floridablanca', 1), ('Barrancabermeja', 1), ('Giron', 1), ('Piedecuesta', 1), ('Lebrija', 1);

--llenamos la tabla de cliente
INSERT INTO cliente(primerNombre, segundoNombre, primerApellido, segundoApellido, emailCliente, fechaNacimiento, idReg) VALUE ('Edgar', 'Tomas', 'Torres', 'Ortiz', 'tomas@gmail.com', '1996-06-12', 12), ('Edgar', 'Anival', 'Suarez', 'Ortiz', 'anival@gmail.com', '1980-06-12', 13), ('Pedro', '', 'Sepulveda', 'Sepulveda', 'sepulveda@gmail.com', '2000-11-12', 10), ('Luis', 'Carlos', 'Avella', 'Cruz', 'luis@gmail.com', '1994-06-04', 8), ('Antonio', 'Homero', 'Prieto', 'Izquierdo', 'antonio@gmail.com', '2009-06-01', 2);

-- ++++++++++HACER CONSULTAS +++++++++++
----consulta UNO
SELECT p.idPais, p.nombrePais, dep.nombreDep, r.nombreReg
FROM pais AS p, departamento AS dep, region AS r
WHERE p.`idPais` = dep.`idPais` AND dep.`idDep` = r.`idReg`
AND p.`idPais` = 1;

---consulta DOS
SELECT p.idPais, p.nombrePais, dep.nombreDep, r.nombreReg
FROM pais AS p, departamento AS dep, region AS r
WHERE p.`idPais` = dep.`idPais` AND dep.`idDep` = r.`idDep`
AND p.`idPais` = 1;

--consulta TRES
SELECT p.`idPais`, p.`nombrePais`, dep.nombreDep, r.nombreReg
FROM pais AS p
INNER JOIN departamento as dep ON dep.`idPais` = p.`idPais`
INNER JOIN region AS r ON r.`idDep` = dep.`idDep`
WHERE p.`idPais` = 1
ORDER BY r.`nombreReg` ASC;



--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--selecionar una tabla para visualisar sus datos
SELECT * FROM pais;

--Eliminar una tabla por completo de la base de datos 
DROP TABLE nombre de la tabla

--para visualizar la estructura de una tabla en la base de datos
DESCRIBE "nombre_tabla";

--+++++++++++++OPERADORES LOGICOS++++++++++++++++++++++++++++++++++++
--la AND Ejemplo de como podria ser 
SELECT * FROM [Nombre_tabla] WHERE [columna] > 30 AND [columna] > 50000;

--la OR ejemplo de prueba
SELECT * FROM [Nombre_tabla] WHERE [Coumna] > 30 OR [Columna] > 50000;

--la NOT (negcion) ejemplo de prueba
SELECT * FROM [Nombre_tabla] WHERE NOT [colunma] > 50000;
--esn esta parte los no se selecionara los campos que tengan un valor de mas de 50000

--+++++++++++++++++++OPREDORES DE COMPARACION+++++++++++++++++++++++++++++++++
-- = (Igual  a) para saber si dos valores son iguales
-- <> o != (Diferentes) para saber si dos valores no son iguales
-- > (Mayor que) para saber si un valor es mayor que el
-- < (Menor que) para saber si un valor es menor que el otro
-- >= (Mayor o igual a) para saber si un valor es mayor que o igual a
-- <= (Menor o igual a) para saber si un valor es menor que o igual a

--+++++++++++++++++++++++++OPRERADOR LIKE++++++++++++++++++++++++++++++++++++++
-- % (Porcentaje) este signo representa cero, uno o varios caracteres
-- _ (Guion bajo) representa un solo caracter
SELECT * FROM [Nombre_tabla] WHERE [columna] LIKE 'J%';
-- sirve para buscar nombres o caracteres en una tabla, en este caso 
-- se quiere buscar un palabra que comienza por la letra J
SELECT * FROM [Nombre_tabla] WHERE [Columna] LIKE '123-456-_ _ _ _';
-- esta consulta selecionara un registro de nuemero el cual contedra 
-- cuatro caracteres.

--++++++++++++++++++++++++OPERADOR BETWEEN+++++++++++++++++++++++++++++++++
-- Se utiliza para seleccioner valores de un rango determinado 
-- este rango puede ser numerico, fecha o de texto
-- la sintaxis basica de BETWEEN es:
SELECT Columna_name(s)
FROM Tabla_name
WHERE columna_name BETWEEN value1 AND value2;
