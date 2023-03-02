CREATE SCHEMA productoProveedor;

USE productoProveedor;

CREATE TABLE Producto(
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (25),
    precio DOUBLE
);

ALTER TABLE Producto MODIFY COLUMN precio INTEGER(30);

SELECT * FROM Producto;

CREATE TABLE Proveedor(
	proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (25),
    rol VARCHAR (15),
    contactoTelefono INTEGER (25),
    contactoCorreo VARCHAR (25),
    fechaVisita DATE
);

SELECT * FROM Proveedor;

CREATE TABLE ProductoProveedor(
	productoProveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Producto_id INTEGER NOT NULL,
    Proveedor_id INTEGER NOT NULL
);

ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (Producto_id) REFERENCES Producto (Producto_id);

ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (Proveedor_id) REFERENCES Proveedor (Proveedor_id);

#Ingresar datos a Producto
INSERT INTO Producto (nombre, precio) VALUES ("Pedro", 6500);
INSERT INTO Producto (nombre, precio) VALUES ("Juan", 5500);
INSERT INTO Producto (nombre, precio) VALUES ("Diego", 7800);

#Aquí me equivoqué eran nombres de productos jaja así que lo cambiaré
UPDATE Producto
SET nombre = "palta"
WHERE producto_id = 1;

UPDATE Producto
SET nombre = "tomate"
WHERE producto_id = 2;

UPDATE Producto
SET nombre = "lechuga"
WHERE producto_id = 3;

#Ingresar datos a Proveedor
INSERT INTO Proveedor (nombre, rol, contactoTelefono, contactoCorreo, fechaVisita) VALUES ("Pedro", "5681", 968435179, "Juan@gmial.com", '2023-03-25');
INSERT INTO Proveedor (nombre, rol, contactoTelefono, contactoCorreo, fechaVisita) VALUES ("Juan", "5792", 956842379, "Juan@gmial.com", '2023-01-31');
INSERT INTO Proveedor (nombre, rol, contactoTelefono, contactoCorreo, fechaVisita) VALUES ("Diego", "6185", 959761579, "Juan@gmial.com", '2023-01-15');

#Ingresar datos a tabla relacional
INSERT INTO ProductoProveedor (Producto_id, Proveedor_id) VALUES (1,1);
INSERT INTO ProductoProveedor (Producto_id, Proveedor_id) VALUES (3,2);

SELECT * FROM ProductoProveedor;
