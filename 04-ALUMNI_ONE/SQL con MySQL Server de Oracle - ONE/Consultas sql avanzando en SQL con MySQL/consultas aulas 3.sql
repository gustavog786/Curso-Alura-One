SELECT DISTINCT ENVASE, TAMANO FROM tabla_de_productos; 
SELECT DISTINCT ENVASE, TAMANO, SABOR FROM tabla_de_productos
WHERE SABOR = 'NARANJA'; 
SELECT DISTINCT BARRIO FROM tabla_de_clientes WHERE CIUDAD = 'Ciudad de México';
SELECT * FROM tabla_de_productos;
SELECT * FROM tabla_de_productos LIMIT 5;
SELECT * FROM tabla_de_productos LIMIT 5,4; 
SELECT * FROM facturas  WHERE FECHA_VENTA = '2017-01-01' LIMIT 10;
SELECT * FROM tabla_de_productos order by PRECIO_DE_LISTA;
SELECT * FROM tabla_de_productos order by PRECIO_DE_LISTA DESC;
SELECT * FROM tabla_de_productos order by NOMBRE_DEL_PRODUCTO;
SELECT * FROM tabla_de_productos order by ENVASE ASC, NOMBRE_DEL_PRODUCTO DESC;
SELECT CODIGO_DEL_PRODUCTO FROM tabla_de_productos 
WHERE NOMBRE_DEL_PRODUCTO = "Refrescante" AND TAMANO = "1 Litro" 
AND SABOR = "Frutilla/Limón";
SELECT * FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035" ORDER BY CANTIDAD DESC;
SELECT ESTADO, LIMITE_DE_CREDITO FROM tabla_de_clientes;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabla_de_clientes GROUP BY ESTADO;
SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE; 
SELECT ENVASE, COUNT(*) FROM tabla_de_productos GROUP BY ENVASE; 
SELECT MAX(CANTIDAD) AS CANTIDAD_MAXIMA FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035";
SELECT COUNT(*) FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035" AND CANTIDAD = 99;

#having (DESPUES DEL GROUP BY)
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabla_de_clientes 
GROUP BY ESTADO 
HAVING LIMITE_TOTAL >300000; 

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO,  MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO
FROM tabla_de_productos 
GROUP BY ENVASE;
SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO,  MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO,
SUM(PRECIO_DE_LISTA) AS SUMA_PRECIO
FROM tabla_de_productos 
GROUP BY ENVASE
HAVING SUM(PRECIO_DE_LISTA) >80;
SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO,  MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO,
SUM(PRECIO_DE_LISTA) AS SUMA_PRECIO
FROM tabla_de_productos 
GROUP BY ENVASE
HAVING SUM(PRECIO_DE_LISTA) >=80
AND MAX(PRECIO_DE_LISTA) >= 5;

SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;

#CASE
SELECT * FROM tabla_de_productos;
SELECT NOMBRE_DEL_PRODUCTO, PRECIO_DE_LISTA,
CASE
    WHEN PRECIO_DE_LISTA >=12 THEN 'Costoso'
    WHEN PRECIO_DE_LISTA >=5 AND PRECIO_DE_LISTA <12 THEN 'Asequible'
    ELSE 'Barato'
    END AS PRECIO
FROM tabla_de_productos;
SELECT ENVASE, SABOR,
CASE
    WHEN PRECIO_DE_LISTA >=12 THEN 'Costoso'
    WHEN PRECIO_DE_LISTA >=5 AND PRECIO_DE_LISTA <12 THEN 'Asequible'
    ELSE 'Barato'
    END AS PRECIO, MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO
FROM tabla_de_productos
WHERE TAMANO = '700 ML'
GROUP BY ENVASE,
CASE
    WHEN PRECIO_DE_LISTA >=12 THEN 'Costoso'
    WHEN PRECIO_DE_LISTA >=5 AND PRECIO_DE_LISTA <12 THEN 'Asequible'
    ELSE 'Barato'
END
ORDER BY ENVASE;
SELECT NOMBRE,
CASE 
    WHEN YEAR(fecha_de_nacimiento) < 1990 THEN 'Viejos'
    WHEN YEAR(fecha_de_nacimiento) >= 1990 
    AND YEAR(fecha_de_nacimiento) <= 1995 THEN 'Jóvenes' 
    ELSE 'Niños' 
END AS CLASIFICACION_EDAD
FROM tabla_de_clientes;

    
    
    

