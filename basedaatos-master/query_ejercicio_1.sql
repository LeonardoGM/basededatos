CREATE DATABASE gabinete
USE gabinete

--#Identificacion(varchar *)
CREATE TABLE clientes(
	id varchar(15) NOT NULL PRIMARY KEY,
	nombre varchar(25) NOT NULL,
	direccion varchar(25) NOT NULL,
	telefono varchar(25) NOT NULL,
	f_naci DATE NOT NULL
)

CREATE TABLE procuradores(
	num_procurador varchar(15) NOT NULL PRIMARY KEY,
	nombre varchar(25) NOT NULL,
	salario money NOT NULL,
	f_ingreso DATE NOT NULL,
	f_naci DATE NOT NULL
)

CREATE TABLE asunto(
	num_exp varchar(25) NOT NULL PRIMARY KEY,
	f_inicio DATE NOT NULL,
	f_archivado DATE NOT NULL,
	dni_cliente	varchar(15) NOT NULL ,
	procus varchar(15) NOT NULL,
	FOREIGN KEY (dni_cliente) REFERENCES clientes(id),
	FOREIGN KEY (procus) REFERENCES procuradores(num_procurador)
)

