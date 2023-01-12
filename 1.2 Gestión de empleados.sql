DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS fabricante;

CREATE TABLE departamento (
  id  SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE PRECISION NOT NULL,
  gastos DOUBLE PRECISION NOT NULL
);

CREATE TABLE empleado (
  id  SERIAL PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  id_departamento INT ,
  id_departamento INT REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

SELECT * FROM empleado;
SELECT * FROM departamento;


/* ejercicio 1.2.3 -> 1 */
SELECT emp.apellido1
FROM empleado AS emp;

/* ejercicio 1.2.3 -> 2 */
SELECT DISTINCT emp.apellido1
FROM empleado AS emp;


/* ejercicio 1.2.3 -> 3 */
SELECT emp.*
FROM empleado AS emp;

/* ejercicio 1.2.3 -> 4 */
SELECT emp.nombre , emp.apellido1 , emp.apellido2
FROM empleado AS emp;

/* ejercicio 1.2.3 -> 5 */
SELECT emp.nombre , emp.apellido1 , emp.apellido2
FROM empleado AS emp;

/* ejercicio 1.2.3 -> 6 */
SELECT  DISTINCT  emp.id
FROM empleado AS emp;

/* ejercicio 1.2.3 -> 7 */
SELECT  CONCAT(emp.nombre,' ', emp.apellido1,' ', emp.apellido2)  
FROM empleado AS emp;

/* ejercicio 1.2.3 -> 8 */
SELECT upper(CONCAT(emp.nombre ,' ', emp.apellido1,' ',emp.apellido2))
FROM empleado AS emp;

/* ejercicio 1.2.3 -> 9 */
SELECT lower(CONCAT(emp.nombre,' ', emp.apellido1,' ', emp.apellido2))
FROM empleado AS emp;

/* ejercicio 1.2.3 -> 10 */
SELECT emp.id,emp.nif, regexp_replace(regexp_replace(emp.nif,'([^0-9])',''),'([^0-9])','') AS digitos, regexp_replace(emp.nif, '[^a-zA-Z]', '', 'g') AS letras
FROM empleado AS emp;

/* ejercicio 1.2.3 -> 11 */
SELECT dep.nombre AS nombre , dep.presupuesto AS  presupuesto, dep.gastos AS gastos, (dep.presupuesto - dep.gastos) AS presupuesto_actual
FROM departamento AS dep;

/* ejercicio 1.2.3 -> 12 */
SELECT dep.nombre AS nombre , (dep.presupuesto - dep.gastos) AS presupuesto_actual
FROM departamento AS dep
ORDER BY (dep.presupuesto - dep.gastos) ASC;

/* ejercicio 1.2.3 -> 13 */
SELECT dep.nombre AS nombre 
FROM departamento AS dep
ORDER BY dep.nombre ASC; 

/* ejercicio 1.2.3 -> 14 */
SELECT dep.nombre AS nombre 
FROM departamento AS dep
ORDER BY dep.nombre DESC;  

/* ejercicio 1.2.3 -> 15 */
SELECT  CONCAT( emp.apellido1,' ', emp.apellido2 , ' ',emp.nombre) 
FROM empleado AS emp
ORDER BY CONCAT( emp.apellido1, emp.apellido2,emp.nombre) ASC;

/* ejercicio 1.2.3 -> 16 */
SELECT dep.nombre AS nombre , dep.presupuesto AS presupuesto 
FROM departamento AS dep
ORDER BY dep.presupuesto DESC
LIMIT 3; 

/* ejercicio 1.2.3 -> 17 */
SELECT dep.nombre AS nombre , dep.presupuesto AS presupuesto 
FROM departamento AS dep
ORDER BY dep.presupuesto ASC
LIMIT 3; 

/* ejercicio 1.2.3 -> 18 */
SELECT dep.nombre AS nombre , dep.gastos AS gastos 
FROM departamento AS dep
ORDER BY dep.gastos DESC
LIMIT 2; 

/* ejercicio 1.2.3 -> 19 */
SELECT dep.nombre AS nombre , dep.gastos AS gastos 
FROM departamento AS dep
ORDER BY dep.gastos ASC
LIMIT 2;

/* ejercicio 1.2.3 -> 20 */
SELECT emp.* 
FROM empleado AS emp
LIMIT 2 OFFSET 3;

/* ejercicio 1.2.3 -> 21 */
SELECT dep.nombre , dep.presupuesto
FROM departamento AS dep
WHERE dep.presupuesto >= 150000;

/* ejercicio 1.2.3 -> 22 */
SELECT dep.nombre , dep.gastos
FROM departamento AS dep
WHERE dep.gastos <= 5000;

/* ejercicio 1.2.3 -> 23 */
SELECT dep.nombre , dep.presupuesto
FROM departamento AS dep
WHERE (dep.presupuesto >= 100000) AND (dep.presupuesto <= 200000);

/* ejercicio 1.2.3 -> 24 */
SELECT dep.nombre , dep.presupuesto
FROM departamento AS dep
WHERE NOT((dep.presupuesto >= 100000) AND (dep.presupuesto <= 200000));

/* ejercicio 1.2.3 -> 25 */
SELECT dep.nombre , dep.presupuesto
FROM departamento AS dep
WHERE dep.presupuesto BETWEEN  100000 AND  200000;

/* ejercicio 1.2.3 -> 26 */
SELECT dep.nombre , dep.presupuesto
FROM departamento AS dep
WHERE  NOT (dep.presupuesto BETWEEN  100000 AND  200000);

/* ejercicio 1.2.3 -> 27 */
SELECT dep.nombre , dep.presupuesto , dep.gastos
FROM departamento AS dep
WHERE  dep.gastos > dep.presupuesto;

/* ejercicio 1.2.3 -> 28 */
SELECT dep.nombre , dep.presupuesto , dep.gastos
FROM departamento AS dep
WHERE  dep.gastos < dep.presupuesto;

/* ejercicio 1.2.3 -> 29 */
SELECT dep.nombre , dep.presupuesto , dep.gastos
FROM departamento AS dep
WHERE  dep.gastos = dep.presupuesto;

/* ejercicio 1.2.3 -> 30 */
SELECT emp.*
FROM empleado AS emp
WHERE emp.apellido2 IS NULL;

/* ejercicio 1.2.3 -> 31 */
SELECT emp.*
FROM empleado AS emp
WHERE emp.apellido2 IS NOT NULL;

/* ejercicio 1.2.3 -> 32 */
SELECT emp.*
FROM empleado AS emp
WHERE emp.apellido2 = 'López';

SELECT emp.*
FROM empleado AS emp
WHERE emp.apellido2 LIKE '%López%';

/* ejercicio 1.2.3 -> 33 */
SELECT emp.*
FROM empleado AS emp
WHERE (emp.apellido2 = 'Díaz') OR (emp.apellido2 = 'Moreno');

SELECT emp.*
FROM empleado AS emp
WHERE (emp.apellido2 LIKE '%López%') OR (emp.apellido2 LIKE '%Moreno%');

/* ejercicio 1.2.3 -> 34 */
SELECT emp.*
FROM empleado AS emp
WHERE  emp.apellido2 IN ('López', 'Moreno');

/* ejercicio 1.2.3 -> 35 */
SELECT emp.nif,  emp.nombre, emp.apellido1, emp.apellido2, emp.id_departamento
FROM empleado AS emp
WHERE  emp.id_departamento = 3;

/* ejercicio 1.2.3 -> 36 */
SELECT emp.nif,  emp.nombre, emp.apellido1, emp.apellido2, emp.id_departamento
FROM empleado AS emp
WHERE  emp.id_departamento IN(2,4,5);

/*  1.2.4 Consultas multitabla (Composición interna)  */

/* ejercicio 1.2.4 -> 1 */
SELECT *
FROM empleado AS emp , departamento AS dep
WHERE emp.id_departamento = dep.id;


/* ejercicio 1.2.4 -> 2 */
SELECT dep.* , CONCAT(emp.nombre, emp.apellido1, emp.apellido2)
FROM empleado AS emp , departamento AS dep
WHERE emp.id_departamento = dep.id
ORDER BY dep.nombre ASC, CONCAT(emp.nombre,' ',emp.apellido1,' ',emp.apellido2) ASC;

/* ejercicio 1.2.4 -> 3 */
SELECT DISTINCT dep.id , dep.nombre
FROM empleado AS emp , departamento AS dep
WHERE emp.id_departamento = dep.id