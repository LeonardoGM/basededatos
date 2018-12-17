CREATE DATABASE club_nautico
USE club_nautico

CREATE TABLE socio(
	identificacion varchar(10) NOT NULL PRIMARY KEY,
	nombre varchar(25) NOT NULL,
	campo varchar(25) NOT NULL,
	direccion varchar(25) NOT NULL,
	telefono varchar(15) NOT NULL,
	fin_mem DATE NOT NULL,
	couta_mem MONEY NOT NULL
)

CREATE TABLE barco(
	num_matricula varchar(25) NOT NULL PRIMARY KEY,
	propietario varchar(10) NOT NULL,
	nombre varchar(10) NOT NULL,
	num_amarre varchar(10) NOT NULL,
	cuota_pago MONEY NOT NULL,
	FOREIGN KEY (propietario) REFERENCES socio(identificacion)
)

CREATE TABLE patron(
	identificacion varchar(10) NOT NULL PRIMARY KEY,
	nombre varchar(25) NOT NULL,
	direccion varchar(30) NOT NULL,
	telefono varchar(15) NOT NULL,
	licencia varchar(25) NOT NULL
)

CREATE TABLE salida(
	id varchar(30) NOT NULL PRIMARY KEY,
	fecha_hora DATE NOT NULL,
	destino varchar(15) NOT NULL,
	patron varchar(10) NOT NULL,
	cuota_mem MONEY NOT NULL,
	matricula_bote varchar(25) NOT NULL
	FOREIGN KEY (matricula_bote) REFERENCES barco(num_matricula),
	FOREIGN KEY (patron) REFERENCES patron(identificacion)
)

