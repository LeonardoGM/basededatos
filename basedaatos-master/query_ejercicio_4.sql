CREATE DATABASE entidad_bancaria
USE entidad_bancaria

CREATE TABLE clientes(
	identificacion varchar(15) NOT NULL PRIMARY KEY,
	nombre varchar(20) NOT NULL,
	direccion varchar(25) NOT NULL,
	telefono varchar(15) NOT NULL,
	correo varchar(25) NOT NULL,
	sexo varchar(6) NOT NULL,
	ocupacion varchar(20) NOT NULL,
	salario MONEY NOT NULL,
	f_naci DATE NOT NULL
)

CREATE TABLE cuentas(
	numero varchar(100) NOT NULL PRIMARY KEY,
	sucursal varchar(25) NOT NULL,
	saldo MONEY NOT NULL,
	f_aper DATE NOT NULL,
	tipo_cue varchar(10) NOT NULL,
	id_propietario varchar(15) NOT NULL,
	FOREIGN KEY (id_propietario) REFERENCES clientes(identificacion)
)

CREATE TABLE transacciones(
	id varchar(25) NOT NULL PRIMARY KEY,
	num_cuenta varchar(100) NOT NULL,
	tipo varchar(10) NOT NULL,
	fecha_hora DATE NOT NULL,
	sucursal varchar(25) NOT NULL,
	valor MONEY NOT NULL
	FOREIGN KEY (num_cuenta) REFERENCES cuentas(numero)
)