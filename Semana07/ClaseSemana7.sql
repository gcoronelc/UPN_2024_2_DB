
select * from curso where cur_id=1;
select * from MATRICULA where cur_id=1 and alu_id=4;
select * from PAGO where cur_id=1 and alu_id=4;
go


-- Ejemplo 1

create procedure usp_demo_01
as
begin
	select * from matricula;
end;
go

exec usp_demo_01;
go


-- Ejemplo 2
-- CREATE, ALTER y DROP

create procedure usp_demo_02
(@idCurso int)
as
begin
	select * from matricula
	where cur_id = @idCurso;
end;
go


execute usp_demo_02 1;
go


-- Ejemplo 3
-- Consultar el precio de un curso

create procedure usp_demo_03
(@idCurso int, @precio money OUTPUT)
as
begin
	select @precio = cur_precio
	from curso
	where cur_id = @idCurso;
end;
go


declare @precio money;
execute usp_demo_03 2, @precio OUTPUT;
print concat('Precio: ', @precio);
go


-- Ejemplo 4
-- Registrar una matricula

create procedure usp_registrar_matricula
(
	@idCurso int, @IdAlumno int, @IdEmpleado int,
	@Tipo varchar(20), @Cuotas int,
	@Estado int output, @Precio money output
)
as
begin
	-- Leer precio
	select @Precio = cur_precio from curso where cur_id = @idCurso;

end;
go





