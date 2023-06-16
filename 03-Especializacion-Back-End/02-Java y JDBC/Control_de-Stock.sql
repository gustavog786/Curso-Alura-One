/*CREATE DATABASE control_de_stock;
 CREATE table producto(
	id INT auto_increment,
    nombre varchar(50) NOT NULL,
    descripcion varchar(255),
    cantidad INT default 0,
    primary key(id)
)engine=InnoDB; 

insert into producto(nombre, descripcion, cantidad) values('Mesa','Mesa de 4 lugares', 10);

insert into producto(nombre, descripcion, cantidad) values('Celular', 'Celular Samsung', 50); 

CREATE TABLE CATEGORIA( id INT auto_increment, nombre varchar(50) not null, primary key(id))engine=InnoDB; 

insert into CATEGORIA(nombre) values('Muebles'), ('Tegnologia'), ('Cocina'), ('Zapatillas');

select * from Categoria; 

alter table producto add column categoria_id int;  

alter table producto add foreign key (categoria_id) references categoria(id);  */  

update producto set categoria_id = 1 where id = 1;

update producto set categoria_id = 2 where id = 2;

update producto set categoria_id = 3 where id = 3;

update producto set categoria_id = 4 where id = 14;
update producto set categoria_id = 3 where id = 4;
update producto set categoria_id = 3 where id = 6;
update producto set categoria_id = 2 where id = 7;
update producto set categoria_id = 4 where id = 10;
update producto set categoria_id = 4 where id = 13;
update producto set categoria_id = 2 where id = 17;
update producto set categoria_id = 3 where id = 11;
update producto set categoria_id = 3 where id = 12;
update producto set categoria_id = 3 where id = 8;
update producto set categoria_id = 3 where id = 9;






