#Bruno Mollo 47773 3k5  

# AD - 1. Sugerencias de tours. 
# Para una promoción se desea sugerir a cada asistente otros tours que sean de su interés. 

# Para cada asistente que haya realizado más de un tour en alguna temática, identificar la temática
# más frecuente elegida por el asistente y sugerirle todos los tours futuros con la misma temática.
# Indicar dni, nombre, apellido y teléfono del asistente y de los tours, número, temática, fecha y hora de salida y precio unitario.
# Ordenar por apellido y nombre alfabético y fecha y hora de salida descendente.

USE `role_play_events`;
DROP function IF EXISTS `tematica_favorita`;
DELIMITER $$
USE `role_play_events`$$
CREATE FUNCTION `tematica_favorita` (p_dni int unsigned)
RETURNS varchar(255)
reads sql data
BEGIN
	declare tem varchar(255);
    select t.tematica into tem
	from asistente_contrato ac
	inner join tour t
		on t.nro=ac.nro_tour
	where ac.dni_asistente=p_dni
	group by t.tematica
	order by count(*) desc
	limit 1;

RETURN tem;
END$$
DELIMITER ;


with asistentes_con_sus_tematicas as(
	select a.dni, a.nombre, a.apellido, a.telefono, tematica_favorita(a.dni) as tematica
	from asistente a
	inner join asistente_contrato ac
		on a.dni=ac.dni_asistente
	group by a.dni
	having count(*)>1
)
select acst.* , t.nro, t.fecha_hora_salida, t.precio_unitario_sugerido
from asistentes_con_sus_tematicas acst
inner join tour t
	on t.tematica=acst.tematica
where t.fecha_hora_salida>current_date()
order by acst.apellido asc, acst.nombre asc , t.fecha_hora_salida desc;














