use jugos_ventas ;
SELECT * from facturas;
SELECT nombre, direccion_1, direccion_2, barrio, ciudad,estado, cp,fecha_de_nacimiento, EDAD, SEXO, 
LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA,PRIMERA_COMPRA FROM tabla_de_clientes;

SELECT DNI AS dni, NOMBRE as n from tabla_de_clientes;

select * from tabla_de_productos where sabor = 'uva';
select * from tabla_de_productos where sabor = 'mango';
select * from tabla_de_productos where envase = 'botella de vidrio';
select * from tabla_de_productos where PRECIO_DE_LISTA > 16;
select * from tabla_de_productos where PRECIO_DE_LISTA between 16 and 16.02;
select * from tabla_de_productos where sabor = 'mango' and TAMANO = '470 ml';
SELECT * FROM tabla_de_productos WHERE sabor = 'mango' OR TAMANO = '470 ml';
SELECT * FROM tabla_de_productos WHERE NOT (sabor = 'mango') OR TAMANO = '470 ml';
SELECT * FROM tabla_de_productos WHERE NOT (sabor = 'mango' AND TAMANO = '470 ml');
SELECT * FROM tabla_de_productos WHERE sabor = 'mango' AND NOT (TAMANO = '470 ml');
SELECT * FROM tabla_de_productos WHERE sabor IN ('MANGO', 'UVA');
SELECT * FROM tabla_de_productos WHERE sabor = 'MANGO' OR SABOR = 'UVA';
SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('CIUDAD DE MEXICO', 'GUADALAJARA');
SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%MANZANA';
SELECT * FROM tabla_de_clientes WHERE NOMBRE LIKE '%ez';



