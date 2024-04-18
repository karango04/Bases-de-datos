use el_descubierto;

select concat(nombre, apellido) as Clientes, cliente.id, 
	count(*) as "cantidad de cuentas"  from cuenta 
inner join cliente_x_cuenta on cliente_x_cuenta.cuenta_numero=cuenta.numero
inner join cliente on cliente_x_cuenta.cliente_id = cliente.id
group by cliente.id, Clientes
having count(cliente.id) >=3;

select upper(nombre) as "cliente sin cuenta" from cliente
left join cliente_x_cuenta on cliente_x_cuenta.cliente_id=cliente.id
where cliente_x_cuenta.cliente_id is null;

select count(*) as "cantidad de prestamos", ciudad.nombre, apellido, cliente.nombre  from ciudad
inner join cliente on cliente.ciudad_id=ciudad.id
inner join cliente_x_prestamo on cliente_x_prestamo.cliente_id=cliente.id
inner join prestamo on cliente_x_prestamo.prestamo_id=prestamo.id
inner join sucursal on sucursal.numero = prestamo.sucursal_numero
where ciudad.nombre ="Pilar - Buenos Aires"
group by ciudad.nombre, apellido, cliente.nombre;

select count(*) as "cantidad de cuentas" ,cliente.id, apellido,nombre, tipo from cliente 
inner join cliente_x_cuenta on cliente_x_cuenta.cliente_id = cliente.id
inner join cuenta on cliente_x_cuenta.cuenta_numero=cuenta.numero
inner join cuenta_tipo on cuenta_tipo.id = cuenta.cuenta_tipo_id
where cuenta.cuenta_tipo_id=1 and substring(apellido, 2, 1)="e"
group by cliente.id, tipo, apellido, nombre
order by cliente. id desc;

select count(cliente.id) as "numero de clientes", pais.id, pais.nombre from pais 
left join ciudad on ciudad.pais_id=pais.id
left join cliente on cliente.ciudad_id=ciudad.id
group by pais.id, pais.nombre;

select sum(importe) importe_cliente, concat(nombre, apellido) as clientes from cliente
inner join cliente_x_prestamo on cliente_x_prestamo.cliente_id = cliente.id
inner join prestamo on prestamo.id= cliente_x_prestamo.prestamo_id
where fecha_otorgado like "2021-08%"
group by clientes;

select * from cliente
inner join cliente_x_prestamo on cliente_x_prestamo.cliente_id = cliente.id
inner join prestamo on prestamo.id= cliente_x_prestamo.prestamo_id;

select sum(pago.importe), count(pago.fecha) from pago
inner join prestamo on prestamo.id = pago.prestamo_id
where prestamo.id= 40
group by pago.importe;

select prestamo.importe-sum(pago.importe) as pagoFaltante from prestamo
inner join pago on prestamo.id = pago.prestamo_id
where prestamo.id= 45
group by pago.importe, prestamo.importe;

select sucursal.numero,prestamo_id, cliente.id,concat(cliente.nombre, cliente.apellido) as Cliente,
prestamo.importe from sucursal
inner join prestamo on sucursal.numero=prestamo.sucursal_numero
inner join cliente_x_prestamo on cliente_x_prestamo.prestamo_id=prestamo.id
inner join cliente on cliente.id=cliente_x_prestamo.cliente_id
where sucursal.numero=4;

select prestamo_id, cuota_nro, pago.importe,
	case 
		when cuota_nro= 1 then "1 cuota pagada"
        when cuota_nro>=2 then "2 cuotas pagadas"
        else "ninguna cuota pagada"
	end as cuotas_pagadas
from prestamo
inner join pago on prestamo.id=pago.prestamo_id
group by cuota_nro, pago.importe, prestamo_id;

select concat(empleado.nombre, empleado.apellido) as cliente, 
coalesce(concat(cuenta.numero,"-", cuenta_tipo.tipo) , "sin asignacion") as cuenta from empleado
left join cuenta on cuenta.ejecutivo_cuenta= empleado.legajo
left join cuenta_tipo on cuenta_tipo.id = cuenta.cuenta_tipo_id;

select * from cliente 
left join cliente_x_cuenta on cliente.id= cliente_x_cuenta.cliente_id
left join cuenta on cuenta.numero= cliente_x_cuenta.cuenta_numero;

select concat(cliente.nombre, cliente.apellido) as cliente, ciudad.* from cliente 
inner join ciudad on ciudad.id= cliente.ciudad_id 
where ciudad.nombre in ("Las Heras - Mendoza", "Viña del Mar - Valparaíso", 
"Córdoba - Córdoba", "Monroe - Buenos Aires");

select email, telefono_movil, prestamo.* from cliente
inner join cliente_x_prestamo on cliente_x_prestamo.cliente_id=cliente.id
inner join prestamo on cliente_x_prestamo.prestamo_id= prestamo.id
where fecha_otorgado between "2021-08-15" and "2021-09-5"
order by fecha_otorgado ;

select email, sucursal_numero, ciudad.nombre from empleado
left join sucursal on sucursal.numero=empleado.sucursal_numero
left join ciudad on ciudad.id=sucursal.Ciudad_id
where ciudad.nombre != "Monroe - Buenos Aires" and
alta_contrato_laboral between "2016-01-01" and "2018-12-31"
order by alta_contrato_laboral

