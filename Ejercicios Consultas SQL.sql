/* https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#tienda-de-inform%C3%A1tica */

DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS fabricante;

CREATE TABLE fabricante (
	codigo SERIAL PRIMARY KEY,
	nombre VARCHAR(100)
);

CREATE TABLE producto (
	codigo SERIAL PRIMARY KEY,
	nombre VARCHAR(100),
	precio DOUBLE PRECISION,
	codigo_fabricante INT REFERENCES fabricante(codigo)	
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT * FROM producto;
SELECT * FROM fabricante;

/* ejercicio 1.1.3 -> 1 */
SELECT nombre FROM producto;

/* ejercicio 1.1.3 -> 2 */
SELECT 	nombre, precio FROM producto;

/* ejercicio 1.1.3 -> 3*/
SELECT * FROM producto;

/* ejercicio 1.1.3 -> 4 y 5 */
SELECT nombre, precio, precio * 18.39 AS dolares, precio * 19.43 AS euros FROM producto;

/* ejercicio 1.1.3 -> 6 */
SELECT nombre, precio, upper(nombre) AS nombreMay FROM producto;

/* ejercicio 1.1.3 -> 7 */
SELECT nombre, precio, lower(nombre) AS nombreMis FROM producto;


/* ejercicio 1.1.3 -> 8 */
SELECT nombre, upper(substring(nombre,1,2)) AS dosPrimeraMayus FROM fabricante;

SELECT nombre, concat_ws('',upper(substring(nombre,1,2)), substring(nombre,3)) AS dosPrimeraMayus FROM fabricante;

/* ejercicio 1.1.3 -> 9 */
SELECT nombre, precio, round(precio) AS precioRedondeado FROM producto;

/* ejercicio 1.1.3 -> 10 */
SELECT nombre, precio, TRUNC(CAST(precio AS numeric),1) AS precioTruncado 
FROm producto;

/* ejercicio 1.1.3 -> 12 y 11 */
SELECT DISTINCT fab.codigo AS codigosConProductos
FROM producto As prod
RIGHT JOIN fabricante As fab
ON  prod.codigo_fabricante = fab.codigo;

/* ejercicio 1.1.3 -> 13 */
SELECT  nombre
FROM fabricante AS fab
ORDER BY  fab.nombre ASC;

/* ejercicio 1.1.3 -> 14 */
SELECT  nombre
FROM fabricante AS fab
ORDER BY  fab.nombre DESC;

/* ejercicio 1.1.3 -> 15 */
SELECT  *
FROM producto 
ORDER BY  producto.nombre ASC, producto.precio DESC;


/* ejercicio 1.1.3 -> 16 */
SELECT  *
FROM fabricante
LIMIT 5; 

/* ejercicio 1.1.3 -> 17 */
SELECT  *
FROM fabricante
WHERE fabricante.codigo >= 4
ORDER BY fabricante.codigo ASC
LIMIT 2;  

/* ejercicio 1.1.3 -> 18 */
SELECT  nombre, precio
FROM producto
ORDER BY producto.precio ASC
LIMIT 1;

/* ejercicio 1.1.3 -> 19 */
SELECT nombre, precio
FROM producto
ORDER BY producto.precio DESC
LIMIT 1;

/* ejercicio 1.1.3 -> 20 */
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

/* ejercicio 1.1.3 -> 21 */
SELECT nombre
FROM producto
WHERE precio <= 120;

/* ejercicio 1.1.3 -> 22 */
SELECT nombre
FROM producto
WHERE precio >= 400;

/* ejercicio 1.1.3 -> 23 */
SELECT nombre
FROM producto
WHERE  NOT precio >= 400;

/* ejercicio 1.1.3 -> 24 */
SELECT *
FROM producto
WHERE (precio >= 80) AND (precio <= 300);

/* ejercicio 1.1.3 -> 25 */
SELECT *
FROM producto
WHERE precio BETWEEN 60 AND 200;

/* ejercicio 1.1.3 -> 26 */
SELECT *
FROM producto
WHERE precio >= 200 AND codigo_fabricante = 6;

/* ejercicio 1.1.3 -> 27 */
SELECT *
FROM producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

/* ejercicio 1.1.3 -> 28 */
SELECT *
FROM producto
WHERE codigo_fabricante IN(1,3,5);

/* ejercicio 1.1.3 -> 29 */
SELECT nombre, TRUNC(CAST(precio AS numeric),2) AS centimos 
FROM producto;

/* ejercicio 1.1.3 -> 30 */
SELECT nombre
FROM fabricante
WHERE lower(substring(nombre,1,1)) = 's';


/* ejercicio 1.1.3 -> 30 */
SELECT nombre
FROM fabricante
WHERE lower(substring(nombre,1,1)) = 's';

/* ejercicio 1.1.3 -> 31 */
SELECT nombre
FROM fabricante
WHERE lower(substring(nombre,length(nombre),length(nombre))) = 'e';

/* ejercicio 1.1.3 -> 32 */
SELECT nombre
FROM fabricante
WHERE  lower(nombre) LIKE '%w%';

/* ejercicio 1.1.3 -> 33 */
SELECT nombre
FROM fabricante
WHERE  length(nombre) = 4;

/* ejercicio 1.1.3 -> 34 */
SELECT nombre
FROM producto
WHERE  nombre LIKE '%Portátil%';

/* ejercicio 1.1.3 -> 35 */
SELECT nombre, precio
FROM producto
WHERE (precio < 215 ) AND (nombre LIKE '%Portátil%');

/* ejercicio 1.1.3 -> 36 */
SELECT nombre, precio
FROM producto
WHERE (precio >=  180 ) 
ORDER BY precio DESC , nombre ASC;

/*--- 1.1.4 Consultas multitabla (Composición interna) -*/

/* ejercicio 1.1.4 -> 1 */
SELECT prod.nombre , prod.precio , fab.nombre
FROM producto As prod
INNER JOIN fabricante As fab
ON  prod.codigo_fabricante = fab.codigo;

/* ejercicio 1.1.4 -> 2 */
SELECT prod.nombre , prod.precio , fab.nombre
FROM producto As prod
INNER JOIN fabricante As fab
ON  prod.codigo_fabricante = fab.codigo
ORDER BY fab.nombre ASC;

/* ejercicio 1.1.4 -> 3 */
SELECT prod.codigo ,prod.nombre , fab.codigo, fab.nombre
FROM producto As prod
INNER JOIN fabricante As fab
ON  prod.codigo_fabricante = fab.codigo;

/* ejercicio 1.1.4 -> 4 */
SELECT prod.nombre , prod.precio , fab.nombre
FROM producto As prod
INNER JOIN fabricante As fab
ON  prod.codigo_fabricante = fab.codigo
ORDER BY prod.precio ASC
LIMIT 1;

/* ejercicio 1.1.4 -> 5 */
SELECT prod.nombre , prod.precio , fab.nombre
FROM producto As prod
INNER JOIN fabricante As fab
ON  prod.codigo_fabricante = fab.codigo
ORDER BY prod.precio DESC
LIMIT 1;

/* ejercicio 1.1.4 -> 6 */
SELECT prod
FROM producto AS prod ,fabricante AS fab 
WHERE (prod.codigo_fabricante = fab.codigo) AND (fabricante.nombre = 'Lenovo');

SELECT prod.nombre , prod.precio , fab.nombre
FROM producto As prod
INNER JOIN fabricante As fab
ON  prod.codigo_fabricante = fab.codigo
WHERE

/* ejercicio 1.1.4 -> 7 */
SELECT prod
FROM producto AS prod ,fabricante AS fab 
WHERE (prod.codigo_fabricante = fab.codigo) AND (fabricante.nombre = 'Lenovo');