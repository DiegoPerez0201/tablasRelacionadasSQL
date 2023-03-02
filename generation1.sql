CREATE SCHEMA generation1;

USE generation1;

CREATE TABLE Cliente (
	cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(25),
    direccion VARCHAR(50),
    correo VARCHAR(50),
    medioPago VARCHAR(20),
    valoracion INTEGER,
    rutCliente VARCHAR(15)
);

CREATE TABLE Boleta (
	boleta_id 	INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nroBoleta BIGINT,
    fecha DATE,
    total FLOAT
);

ALTER TABLE Boleta ADD cliente_id INTEGER NOT NULL;

ALTER TABLE Boleta
ADD FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id);

INSERT INTO Cliente (nombre, direccion, correo, medioPago, valoracion, rutCliente) VALUES ("hola", "calle123", "hola@gmail.com", "efectivo", 5, "12345678-9");
INSERT INTO Cliente (nombre, direccion, correo, medioPago, valoracion, rutCliente) VALUES ("holo", "calle124", "holo@gmail.com", "crédito", 4, "12345678-k");

#Editar datos dentro de las tablas
UPDATE Cliente
SET correo = "hola1@gmail.com", medioPago = "débito"
WHERE cliente_id = 1;

#Eliminar
DELETE FROM Cliente WHERE cliente_id = 2;

#Borrar columnas
ALTER TABLE Cliente DROP COLUMN correo;

#Insertar columna
ALTER TABLE Cliente
ADD COLUMN correo VARCHAR(50);

#Editar valor
ALTER TABLE Boleta MODIFY COLUMN total DECIMAL(30,3);

#Renombrar columna
ALTER TABLE Cliente RENAME COLUMN medioPago TO medioDePago;

#Borrar tabla
ALTER TABLE Cliente DROP CONSTRAINT cliente_idfk_1;
DROP TABLE Cliente CASCADE;

#Traer todos los datos:
SELECT * FROM Cliente;

#Traer datos específicos:
SELECT Cliente.nombre, Cliente.medioPago FROM Cliente;
