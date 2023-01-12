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
FROM empleado As emp;

/* ejercicio 1.2.3 -> 7 */
SELECT  CONCAT(emp.nombre, emp.apellido1, emp.apellido2)  
FROM empleado As emp;

/* ejercicio 1.2.3 -> 8 */
SELECT upper(CONCAT(emp.nombre, emp.apellido1, emp.apellido2))
FROM empleado;

/* ejercicio 1.2.3 -> 9 */
SELECT lower(CONCAT(emp.nombre, emp.apellido1, emp.apellido2))
FROM empleado;

/* ejercicio 1.2.3 -> 10 */
SELECT emp.id, emp.nif
FROM empleado;