--Triggers (Disparadores o Desencadenador)
--	son objetos que se asocian con tablas y se almacenan en la base de datos.
--	Su nombre se deriva por el comportamiento que presentan en su funcionamiento,
--  ya que se ejecutan cuando sucede alg�n evento sobre las tablas a las que se encuentra asociado.
--	Los eventos que hacen que se ejecute un trigger son las operaciones de inserci�n (INSERT),
--	borrado (DELETE) o actualizaci�n (UPDATE), ya que modifican los datos de una tabla.
--	La utilidad principal de un trigger es mejorar la administraci�n de la base de datos,
--	ya que no requieren que un usuario los ejecute. Por lo tanto, son empleados para implementar
--	las REGLAS DE NEGOCIO (tipo especial de integridad) de una base de datos. 
--	Una Regla de Negocio es cualquier restricci�n, requerimiento, necesidad o actividad especial que
--	debe ser verificada al momento de intentar agregar, borrar o actualizar la informaci�n de una base de datos.
--	Los triggers pueden prevenir errores en los datos, modificar valores de una vista, sincronizar tablas, entre otros.
--	La diferencia con los procedimientos almacenados del sistema es que los triggers:
--	1 no pueden ser invocados directamente; al intentar modificar los datos de una tabla para la que se ha definido un disparador,
--	el disparador se ejecuta autom�ticamente.
--	2 no reciben y retornan par�metros.
--	3 son apropiados para mantener la integridad de los datos, no para obtener resultados de consultas.


--Creaci�n de las tabla para llevar el registro de clientes, cuentas y transacciones con los trigger
create table reg_cliente(
	nombre varchar(20) NOT NULL PRIMARY KEY,
	fecha date NOT NULL,
	comentario varchar(300) NOT NULL)

create table reg_cuentas(
	numero varchar(100) NOT NULL PRIMARY KEY,
	fecha date NOT NULL,
	descripcion varchar(300) not null)

create table reg_trans(
	id varchar(25) NOT NULL PRIMARY KEY,
	fehca date NOT NULL,
	descripcion varchar(300) NOT NULL)

--Creacion de los trigger
create trigger registroInsert
on clientes
for insert --for |after |instead of insert | update | delete
as 
begin
insert into reg_cliente(nombre, fecha, comentario) select nombre, getdate(), 'se insert� un nuevo cliente' from inserted
end

create trigger registroUpdate
on clientes
after update
as 
begin
insert into reg_cliente(nombre, fecha, comentario) select nombre, getdate(), 'se actualiz� un cliente' from inserted
end

create trigger registroDelte
on clientes
for delete
as 
begin
insert into reg_cliente(nombre, fecha, comentario) select nombre, getdate(), 'se elimin� un cliente' from inserted
end



create trigger cuenasInsert
on cuentas
for insert
as 
begin
insert into reg_cuentas(numero, fecha, descripcion) select numero, getdate(), 'se insert� una nueva cuenta' from inserted
end

create trigger cuentasUpdate
on cuentas
after update
as 
begin
insert into reg_cuentas(numero, fecha, descripcion) select numero, getdate(), 'se actualiz� una cuenta' from inserted
end

create trigger cuentasDelte
on cuentas
for delete
as 
begin
insert into reg_cuentas(numero, fecha, descripcion) select numero, getdate(), 'se elimin� una cuenta' from inserted
end

create trigger transInsert
on transacciones
for insert
as 
begin
insert into reg_trans(id, fehca, descripcion) select id, getdate(), 'se insert� una nueva transacci�n' from inserted
end

create trigger transUpdate
on transacciones
after update
as 
begin
insert into reg_trans(id, fehca, descripcion) select id, getdate(), 'se actualiz� una transacci�n' from inserted
end

create trigger transDelete
on transacciones
for delete
as 
begin
insert into reg_trans(id, fehca, descripcion) select id, getdate(), 'se elimin� una transacci�n' from inserted
end