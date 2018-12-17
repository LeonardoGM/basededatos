--Subconsultas
--	Una subconsulta puede reemplazar una expresión. Dicha subconsulta
--	debe devolver un valor escalar (o una lista de valores de un campo).
--	Las subconsultas que retornan un solo valor escalar se utiliza con
--	un operador de comparación o en lugar de una expresión:

-- Llenamos las tablas para hacer las subconsultas
use entidad_bancaria

Insert into clientes(identificacion,nombre, direccion, telefono, correo, sexo, ocupacion, salario, f_naci) 
values('1017','Pedro','cra76','123','pedro@correo.com','hombre','desarrollador',1800000,GETDATE()),
	  ('123','Jacinto','cra67','321','jacinto@correo.com','hombre','Maquetador',1000000,GETDATE()),
	  ('124','Lupita','cra50','456','lupe1@correo.com','mujer','desarrolladora',1500000,GETDATE())


insert into cuentas(numero,sucursal, saldo, f_aper, tipo_cue, id_propietario)
values('123','villanueva',850000,GETDATE(),'corriente',1017),
('1234','villanueva',800000,GETDATE(),'corriente',123),
('124','villanueva',850000,GETDATE(),'ahorros',124)


insert into transacciones(id,num_cuenta, tipo, fecha_hora, sucursal, valor)
values ('123','123','consig',GETDATE(),'parque berrio',60000),
('124','124','retiro',GETDATE(),'parque berrio',600000),
('125','1234','consig',GETDATE(),'parque berrio',90000)

-- subconsultas

select saldo from cuentas where id_propietario = (select identificacion from clientes where identificacion = '1017')
select valor from transacciones where num_cuenta = (select numero from cuentas where numero = '123')
select sucursal from cuentas where id_propietario = (select identificacion from clientes where identificacion = '123')

