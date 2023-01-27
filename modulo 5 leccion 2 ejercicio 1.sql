CREATE TABLE finanzas_personales
(
   nombre varchar(50) PRIMARY KEY,
   me_debe INT DEFAULT 0,
   cuotas_cobrar INT DEFAULT 0,
   le_debo INT DEFAULT 0,
   cuotas_pagar INT DEFAULT 0
);

insert into finanzas_personales (nombre,me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('tia carmen', 0, 0, 5000, 1);
insert into finanzas_personales (nombre,me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('papa', 0, 0, 15000, 3);
insert into finanzas_personales (nombre,me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('nacho', 10000, 2, 7000, 1);
insert into finanzas_personales (nombre,me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('almacen esquina', 0, 0, 13000, 2);
insert into finanzas_personales (nombre,me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('vicios varios', 0, 0, 35000, 35);
insert into finanzas_personales (nombre,me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('compañeros de trabajo',50000, 5, 0, 0);

select * from finanzas_personales;

-- aquien se le debe mas dinero y cuanto
SELECT nombre, le_debo
FROM finanzas_personales
ORDER BY le_debo DESC
LIMIT 1;

-- ¿quién me debe más dinero y cuánto?
SELECT nombre, me_debe
FROM finanzas_personales
ORDER BY me_debe DESC
LIMIT 1;

-- dinero que se debe en total
SELECT SUM(me_debe + le_debo) as total_deuda FROM finanzas_personales;

--promerio de dinero que se debe
SELECT AVG(le_debo) FROM finanzas_personales;

--suponiendo que no puede pagar mas de una cuota al mes cuantos meses demoraria en saldar su deuda
SELECT SUM(cuotas_pagar) FROM finanzas_personales;

-- pagar mi deuda con el dinero que me deben cuanto quedaria mi deuda
SELECT SUM(le_debo - me_debe) AS total_nueva_deuda FROM finanzas_personales;

-- nueva deuda reducida
SELECT  ((sum(le_debo) - sum(me_debe))/sum(cuotas_pagar)) from finanzas_personales;

-- ingresar un nuevo registro a la tabla
insert into finanzas_personales (nombre,me_debe, cuotas_cobrar, le_debo, cuotas_pagar)
values ('pareja',0, 0, 50000, 1);

--cuota a pagar este mes con el nuevo registro en la tabla
SELECT SUM(le_debo / cuotas_pagar) FROM finanzas_personales WHERE cuotas_pagar <>0;

--actualizar registro: "almacen esquina", cuotas=13
UPDATE finanzas_personales SET cuotas_pagar=13 WHERE nombre='almacen esquina';

--con el ajuste cuanto se debera pagar este mes
SELECT SUM(le_debo / cuotas_pagar) FROM finanzas_personales WHERE cuotas_pagar <>0;
