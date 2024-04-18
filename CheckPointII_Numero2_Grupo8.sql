/*
camada 3
grupo 8
integrantes:
karina andrea arango cuevas
Yesenia Berrio Rendon
Tania G Jimenez Rodr?guez
Yosseline Gabriela Apcho Huaman
Waira Restrepo Agudelo
Karina Arango
Valerie Nicolle Cortes Isairias
*/


USE el_descubierto;
/*1. */
select id as "numero de cliente", concat(nombre, " ", apellido) as nombre_apellido
from cliente
where nombre like "A%";

/*2*/
select  numero, domicilio from sucursal
where domicilio = "Ramón Freire Serrano 7410";

/*3.*/
select max(importe) as importe_mayor
from prestamo;

/*4*/
select prestamo_id, importe from pago
where prestamo_id in (10,14,27,45) ;

/*5*/
select prestamo_id, count(prestamo_id) as "Numero de prestamo", 
sum(importe) as "Total pagado" from pago 
where prestamo_id=40
group by prestamo_id;

/*6*/
select sucursal_numero, concat(nombre, " ", apellido) as nombre_apellido, alta_contrato_laboral
 from empleado
where sucursal_numero !=2 and alta_contrato_laboral  > "2021-09-05" or alta_contrato_laboral = "2021-06-25"
order by alta_contrato_laboral;
 
 /*7*/
 select prestamo_id, importe from pago
 where importe > 1030.25 and importe <1666.66
 order by importe asc;

/*8*/
 select prestamo_id, importe from pago
order by importe limit 1 offset 4;

/*9*/
select id, importe, fecha_otorgado
from prestamo 
where importe=(select(max(importe))from prestamo);

/*10*/
select numero, saldo, cuenta_tipo_id from cuenta
where (select(min(saldo)) from cuenta)
order by saldo limit 10;

/*11*/
select id, fecha_otorgado from prestamo
where fecha_otorgado >"2021-07-10" and fecha_otorgado <"2021-08-10"
order by fecha_otorgado;

/*12*/
select numero, descubierto_otorgado from cuenta
where descubierto_otorgado = 8999.80 or descubierto_otorgado > 8999.80
order by descubierto_otorgado;

/*13*/
select legajo, concat(nombre, " ", apellido) as nombre_apellido, email
from empleado where apellido like "%do";

/*14*/
/*caja de ahorro id 1*/
select cuenta_tipo_id, avg(saldo) as saldo_promedio from cuenta
where cuenta_tipo_id=1;

/*15*/
select id, importe from prestamo
order by importe desc 
limit 1 offset 2;

/*16*/
select sucursal_numero as sucursal , count(*) as "cantidad de cuenta"
from cuenta group by sucursal_numero
having sucursal_numero =5;

/*17*/
select id, nombre from ciudad;
SELECT substring(nombre,1,5) 
FROM ciudad
WHERE nombre like '__n%';

/*18*/
select* from cuenta_tipo;
update cuenta_tipo 
set tipo = "CUENTA CORRIENTE"
where tipo = "cuenta especial";

/*19*/
select concat(nombre, " ", apellido) from empleado as nombre_apellido;
INSERT INTO empleado(legajo,sucursal_numero,apellido,nombre,domicilio,ciudad_id,email,telefono_movil,alta_contrato_laboral)
VALUES(default,9,"Quinteros Arias","Raúl Alejandro","Av. 25 de mayo 7410",14,"quiteros2021bs@gmail.com",
"+5491154000745",'2023-11-13');
select * from empleado
where sucursal_numero =9;

/*20*/
select* from prestamo;
DELETE FROM cliente_x_prestamo WHERE prestamo_id = 45;
DELETE FROM pago WHERE prestamo_id = 45;
DELETE FROM prestamo WHERE id = 45;

/*21*/
select sum(importe) as "Total prestado por el banco" from prestamo;

/*22*/
select count(*) as "Cuentas activas" from cuenta;

/*23*/
select apellido, count(apellido) as apellidos from cliente
group by apellido;

/*24*/
select pais_id, nombre, count(nombre) as "cantidad de ciudades" from ciudad
group by pais_id, nombre;

/*25*/
select sucursal_numero, fecha_otorgado, count(*) as "cantidad de prestamos" from prestamo
group by sucursal_numero, fecha_otorgado
having count(*)>1;
