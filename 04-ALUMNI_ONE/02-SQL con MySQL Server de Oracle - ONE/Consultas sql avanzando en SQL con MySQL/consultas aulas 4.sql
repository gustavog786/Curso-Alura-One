#JOINS
SELECT * FROM tabla_de_vendedores;
SELECT * FROM facturas;

SELECT * FROM tabla_de_vendedores AS A
INNER JOIN 
facturas AS B
ON A.MATRICULA = B.MATRICULA;

SELECT A.NOMBRE, B.MATRICULA, COUNT(*) FROM tabla_de_vendedores AS A
INNER JOIN 
facturas AS B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, B.MATRICULA;

SELECT YEAR(FECHA_VENTA), SUM(CANTIDAD * PRECIO) AS FACTURACION
FROM facturas F 
INNER JOIN 
items_facturas IFa 
ON F.NUMERO = IFa.NUMERO
GROUP BY YEAR(FECHA_VENTA);

#LEFT JOIN
SELECT count(*) FROM tabla_de_clientes;

SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI FROM tabla_de_clientes AS A
INNER JOIN 
facturas AS B
ON A.DNI = B.DNI;

SELECT DISTINCT A.DNI, A.NOMBRE, A.CIUDAD, B.DNI FROM tabla_de_clientes AS A
LEFT JOIN 
facturas AS B
ON A.DNI = B.DNI
WHERE B.DNI IS NULL; 

#RIGHT JOIN 
SELECT DISTINCT B.DNI, B.NOMBRE, B.CIUDAD, A.DNI FROM facturas AS A
RIGHT JOIN 
tabla_de_clientes AS B
ON A.DNI = B.DNI
WHERE A.DNI IS NULL;   

#FULL JOIN
SELECT * FROM tabla_de_clientes;
SELECT * FROM tabla_de_vendedores;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_vendedores.NOMBRE
FROM tabla_de_clientes
INNER JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.VACACIONES
FROM tabla_de_clientes
RIGHT JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, VACACIONES
FROM tabla_de_clientes
FULL JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO; # DA ERROR LO VEMOS DESPUES

#CROSS JOIN
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, VACACIONES
FROM tabla_de_clientes , tabla_de_vendedores
WHERE tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

#UNION (PERMITE UNIR 2 O MAS TABLAS. IMPLICITAMENTE EJECUTA DISTINCT)
SELECT DISTINCT BARRIO FROM tabla_de_clientes;
SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT DISTINCT BARRIO FROM tabla_de_clientes
UNION
SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT DISTINCT BARRIO FROM tabla_de_clientes
UNION ALL
SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT DISTINCT BARRIO, NOMBRE, 'CIENTE' AS TIPO FROM tabla_de_clientes
UNION
SELECT DISTINCT BARRIO, NOMBRE, 'VENDEDOR' AS TIPO FROM tabla_de_vendedores;

SELECT DISTINCT BARRIO, NOMBRE, 'CIENTE' AS TIPO, DNI FROM tabla_de_clientes
UNION
SELECT DISTINCT BARRIO, NOMBRE, 'VENDEDOR' AS TIPO, MATRICULA FROM tabla_de_vendedores;

#ASI SE HACE EL FULL JOIN
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.VACACIONES
FROM tabla_de_clientes
LEFT JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO
UNION
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.VACACIONES
FROM tabla_de_clientes
RIGHT JOIN tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

#SUBCONSULTAS
SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT * FROM tabla_de_clientes
WHERE BARRIO IN('CONDESA','DEL VALLE','CONTADERO','OBLATOS');

SELECT * FROM tabla_de_clientes
WHERE BARRIO IN(SELECT DISTINCT BARRIO FROM tabla_de_vendedores);

SELECT ENVASE, MAX(PRECIO_DE_LISTA)
AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE;

SELECT X.ENVASE, X.PRECIO_MAXIMO FROM 
(SELECT ENVASE, MAX(PRECIO_DE_LISTA)
AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE) X
WHERE X.PRECIO_MAXIMO >= 10;

SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;

SELECT X.DNI, X.CONTADOR FROM 
(SELECT DNI, COUNT(*) AS CONTADOR FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI) X WHERE X.CONTADOR > 2000;

#VIEW
SELECT ENVASE, MAX(PRECIO_DE_LISTA)
AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE;

SELECT X.ENVASE, X.PRECIO_MAXIMO FROM 
vw_envases_grandes X
WHERE PRECIO_MAXIMO >=10;

SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA,
B.PRECIO_MAXIMO FROM tabla_de_productos AS A
INNER JOIN
vw_envases_grandes B 
ON A.ENVASE = B.ENVASE;

SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA,
((A.PRECIO_DE_LISTA/B.PRECIO_MAXIMO)-1)*100 AS PORCENTAJE_DE_VARIACION FROM tabla_de_productos AS A
INNER JOIN
vw_envases_grandes B 
ON A.ENVASE = B.ENVASE;

