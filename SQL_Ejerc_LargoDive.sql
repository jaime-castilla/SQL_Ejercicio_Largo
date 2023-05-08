create sequence seq_socios start 100;
create table socios(
id_socio serial,
nombre varchar(60) not null,
apellidos varchar(60) not null,
dni char(10) not null,
telefono integer,
poblacion varchar(60),
constraint pk_socios primary key (id_socio)
);


create sequence seq_pedidos start 100;
create table pedidos(
id_pedido serial,
id_socio serial,
forma_envio varchar(60),
forma_pago varchar(60),
constraint pk_pedidos primary key (id_pedido),
constraint fk_pedidos_socios foreign key (id_socio)
	references socios(id_socio)
	on update cascade on delete cascade
);


create table detalle_pedido(
isbn integer not null,
id_pedido serial,
cantidad integer not null,
constraint pk_detalle_pedido primary key (isbn),
constraint fk_detalle_pedido_pedidos foreign key (id_pedido)
	references pedidos(id_pedido)
	on update cascade on delete cascade
);


create table colecciones(
id_nombre_colec varchar(60) not null,
volumen integer,
constraint pk_colecciones primary key (id_nombre_colec)
);


create table libros(
isbn integer not null,
id_nombre_colec varchar(60) not null,
titulo varchar(60) not null,
autor varchar(60),
editorial varchar(60),
constraint pk_libros primary key (isbn),
constraint fk_libros_colecciones foreign key (id_nombre_colec)
	references colecciones(id_nombre_colec)
	on update cascade on delete cascade
);


create table poblaciones(
id_nombre_pobl varchar(60) not null,
habitantes integer,
provincia varchar(60),
constraint pk_poblaciones primary key (id_nombre_pobl)
);


create table almacenes(
id_nombre_alm varchar(60) not null,
isbn integer not null,
fecha_apertura date,
direccion varchar(60),
stock integer,
constraint pk_almacenes primary key (id_nombre_alm),
constraint fk_almacenes_libros foreign key (isbn)
	references libros(isbn)
	on update cascade on delete cascade
);


create table provincias(
id_nombre_prov varchar(60) not null,
id_nombre_alm varchar(60) not null,
extensio integer,
constraint pk_provincias primary key (id_nombre_prov),
constraint fk_provincias_almacenes foreign key (id_nombre_alm)
	references almacenes(id_nombre_alm)
	on update cascade on delete cascade
);