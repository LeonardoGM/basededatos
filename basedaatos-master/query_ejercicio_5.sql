CREATE DATABASE institucion_educativa
USE institucion_educativa

CREATE TABLE prog_edu(
	codigo varchar(10) NOT NULL PRIMARY KEY,
	nombre varchar(25) NOT NULL,
	num_sem varchar(2) NOT NULL,
	f_naci DATE NOT NULL,
)

CREATE TABLE asignatura(
	codigo varchar(10) NOT NULL PRIMARY KEY,
	nombre varchar(25) NOT NULL,
	horas_curso varchar(3) NOT NULL
)

CREATE TABLE alumnos(
	identificaion varchar(10) NOT NULL PRIMARY KEY,
	nombre varchar(25) NOT NULL,
	direccion varchar(25) NOT NULL,
	telefono varchar(15) NOT NULL,
	sexo varchar(10) NOT NULL,
	ocupacion varchar(25) NOT NULL,
	salario MONEY NOT NULL,
	correo varchar(25) NOT NULL,
	f_naci DateTime NOT NULL,
	cod_programa varchar(10) NOT NULL,
	FOREIGN KEY (cod_programa) REFERENCES prog_edu(codigo)
)

CREATE TABLE asign_alum(
	codigo varchar(10) NOT NULL,
	id_est varchar(10) NOT NULL,
	PRIMARY KEY(codigo, id_est),
	FOREIGN KEY (codigo) REFERENCES asignatura(codigo),
	FOREIGN KEY (id_est) REFERENCES alumnos(identificaion)
)

CREATE TABLE notas(
	codigo varchar(10) NOT NULL,
	id_est varchar(10) NOT NULL,
	num_notas varchar(1) NOT NULL,
	nota float(1) NOT NULL,
	FOREIGN KEY (codigo, id_est) REFERENCES asign_alum(codigo, id_est)
)