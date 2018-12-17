CREATE DATABASE zoos
USE zoos

CREATE TABLE zoo(
	id_zoo varchar(100) NOT NULL PRIMARY KEY,
	nombre varchar(25) NOT NULL,
	ciudad varchar(25) NOT NULL,
	pais varchar(25) NOT NULL,
	tamano REAL NOT NULL,
	presupuesto MONEY NOT NULL
)

CREATE TABLE especie(
	idespecie varchar(25) NOT NULL PRIMARY KEY,
	nombre_vulgar varchar(25) NOT NULL,
	nombre_cientifico varchar(50) NOT NULL,
	familia varchar(25) NOT NULL,
	peligro varchar(10) NOT NULL
)

CREATE TABLE animales_del_zoo(
	id_zoo varchar(100) NOT NULL,
	especie varchar(25) NOT NULL,
	numIdAni varchar(50) NOT NULL,
	sexo varchar(10) NOT NULL,
	annio_naci DATE NOT NULL,
	pais_ori varchar(25) NOT NULL,
	conti_ori varchar(15) NOT NULL,
	nombre_animal varchar(25) NOT NULL
	PRIMARY KEY(id_zoo,especie),
	FOREIGN KEY (id_zoo) REFERENCES zoo(id_zoo),
	FOREIGN KEY (especie) REFERENCES especie(idespecie)
)