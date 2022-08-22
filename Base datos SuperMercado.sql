 create Table Empleados
(codempleado int not null,
nombreemp varchar(50),  
apellido1E varchar(50),
apellido2E varchar(50),
salario int not null,
telefonoE varchar (30),
primary key (codempleado));

create table Clientes (
codcliente int not null,
nombre varchar(30),
apellido1 varchar (30),
apellido2 varchar (30),
telefono1 varchar (30),
primary key (codcliente));

create Table Productos
(codproducto int not null,
nombreproducto varchar(50),  
descripcion varchar(50),
cantidadproducto int not null,
codCategoria int not null,
primary key (codproducto),
FOREIGN KEY (codCategoria) REFERENCES categoriaProducto(codCategoria));

create table categoriaProducto(
 codCategoria int not null,
 nombreCategoria varchar(30),
 primary key(codcategoria));

create table Local(
codlocal int not null,
nombrelocal varchar (30),
direccionlocal varchar(100),
telefonolocal varchar(20),
primary key (codlocal));

create table metodopago (
codpago int not null,
tipopago varchar (30),
primary key(codpago));

create table facturacliente (
codfactura int not null,
codcliente int not null,
codproducto int not null,
codpago int not null,
codlocal  int not null,
precio int not null,
subtotal int not null,
descuento int not null,
iva int not null,
total int not null,
primary key (codfactura),
FOREIGN KEY (codcliente) REFERENCES Clientes(codcliente),
FOREIGN KEY (codproducto) REFERENCES Productos(codproducto),
FOREIGN KEY (codpago) REFERENCES metodopago(codpago),
FOREIGN KEY (codlocal) REFERENCES Local(codlocal));

BEGIN
insert into facturaCliente(codfactura,codcliente,codproducto,codpago,codlocal,precio,subtotal,descuento,iva,total)
VALUES (1,00,4,0123,1,1000,1000,0,0.13,1000);
END;

BEGIN
 insert into Empleados(codempleado,nombreemp,  apellido1E, apellido2E, salario,telefonoE)
 values (425,'Steven','Hidalgo','Benavidez',200000,'84612364');
 insert into Empleados(codempleado,nombreemp,  apellido1E, apellido2E, salario,telefonoE)
 values (426,'Alex','Jimenez','Chavez',80000,'88612364');
insert into Empleados(codempleado,nombreemp,  apellido1E, apellido2E, salario,telefonoE)
 values (427,'Stefanie','Rodriguez','Lopes',50000,'84616364');
 insert into Empleados(codempleado,nombreemp,  apellido1E, apellido2E, salario,telefonoE)
 values (428,'Carlos','Aguero','Ovarez',60000,'84612300');
END;
 
BEGIN
insert into metodopago(codpago,tipopago)
 values (0123,'efectivo');
 
 insert into metodopago(codpago,tipopago)
 values (0124,'tarjeta');
END;



 BEGIN
 insert into Clientes (codcliente,nombre,apellido1,apellido2,telefono1)
 values (00,'Eduardo','Chavez','Hernandez','85464913');
insert into Clientes (codcliente,nombre,apellido1,apellido2,telefono1)
 values  (01,'Carlos','Hernandez','Hernandez','85444913');
insert into Clientes (codcliente,nombre,apellido1,apellido2,telefono1)
values   (02,'Edu','Soria','Chavez','85467913');
 END;
 
 BEGIN
insert into categoriaProducto(codCategoria,nombreCategoria)
values (010,'Alimentos frescos');
 
insert into categoriaProducto(codCategoria,nombreCategoria)
values(030,'Funciom');

insert into categoriaProducto(codCategoria,nombreCategoria)
values(040,'Basico');
END;


BEGIN
 insert into Productos(codproducto,nombreproducto,  descripcion, cantidadproducto, codCategoria)
 values (1-03,'Sandia','verdureia',50,010);
 insert into Productos(codproducto,nombreproducto,  descripcion, cantidadproducto, codCategoria)
 values (2-03,'Arroz','Abarrotes',1000,040);
 insert into Productos(codproducto,nombreproducto,  descripcion, cantidadproducto, codCategoria)
 values (3-03,'Frijoles','Abarrotes',4050,040);
 insert into Productos(codproducto,nombreproducto,  descripcion, cantidadproducto, codCategoria)
 values (4-03,'Aceite','Abarrotes',3350,040);
 insert into Productos(codproducto,nombreproducto,  descripcion, cantidadproducto, codCategoria)
 values (5-03,'Cafe','verdureia',2000,040);
 insert into Productos(codproducto,nombreproducto,  descripcion, cantidadproducto, codCategoria)
 values (6-03,'cebolla','verdureia',502,040);
 insert into Productos(codproducto,nombreproducto,  descripcion, cantidadproducto, codCategoria)
 values (7-03,'chile','verdureia',305,040);
  insert into Productos(codproducto,nombreproducto,  descripcion, cantidadproducto, codCategoria)
 values (13,'papaya','verdureia',0,010);
END;
 
 
BEGIN
insert into Local (codlocal,nombrelocal,direccionlocal,telefonolocal)
values (1,'Merkadona Zona Alajuela','Alajuela','87042405');
insert into Local (codlocal,nombrelocal,direccionlocal,telefonolocal)
values (0,'Merkadona Zona Heredia','Heredia','85032465');
insert into Local (codlocal,nombrelocal,direccionlocal,telefonolocal)
values (2,'Merkadona Zona CHEPE','San Jose','83102939');
END;
 
CREATE OR REPLACE FUNCTION LISTAREMPLEADOS RETURN SYS_REFCURSOR IS
    L_CURSOR SYS_REFCURSOR;
BEGIN
    OPEN L_CURSOR FOR SELECT codempleado,nombreemp,apellido1E,salario FROM Empleados;
    RETURN L_CURSOR;
END;

 CREATE OR REPLACE FUNCTION LISTARCLIENTES RETURN SYS_REFCURSOR IS
    L_CURSOR SYS_REFCURSOR;
BEGIN
    OPEN L_CURSOR FOR SELECT codcliente,nombre,apellido1,telefono1 FROM Clientes;
    RETURN L_CURSOR;
END;

CREATE OR REPLACE FUNCTION LISTARPRODUCTOS RETURN SYS_REFCURSOR IS
    L_CURSOR SYS_REFCURSOR;
BEGIN
    OPEN L_CURSOR FOR SELECT codproducto,nombreproducto,descripcion FROM Productos;
    RETURN L_CURSOR;
END;

CREATE OR REPLACE FUNCTION BUSCAREMPLEADO(IDE IN NUMBER) RETURN VARCHAR IS
V_NOMBRE VARCHAR(50);
BEGIN
    SELECT nombreemp INTO V_NOMBRE FROM Empleados WHERE codempleado= IDE;
    RETURN V_NOMBRE;
END;

CREATE OR REPLACE FUNCTION SUMARSALARIOS RETURN NUMBER IS
V_SALARIO NUMBER;
BEGIN
    SELECT SUM(salario) INTO V_SALARIO FROM Empleados ;
    RETURN V_SALARIO;
END;



CREATE OR REPLACE FUNCTION BUSCARPRODUCTO(IDE IN NUMBER) RETURN VARCHAR IS
V_NOMBRE VARCHAR(50);
BEGIN
    SELECT nombreproducto INTO V_NOMBRE FROM Productos WHERE codproducto= IDE;
    RETURN V_NOMBRE;
END;

CREATE OR REPLACE FUNCTION BUSCARCLIENTE(IDE IN NUMBER) RETURN VARCHAR IS
V_NOMBRE VARCHAR(30);
BEGIN
    SELECT nombre INTO V_NOMBRE FROM Clientes WHERE codcliente= IDE;
    RETURN V_NOMBRE;
END;






CREATE OR REPLACE PROCEDURE Nuevo_Empleado(
VID in number,NOM in VARCHAR2,APE in VARCHAR2,APE2 in VARCHAR,TEL in VARCHAR,SAL in number )
AS
BEGIN
    insert into Empleados(codempleado,nombreemp,  apellido1E, apellido2E, salario,telefonoE) VALUES(VID,NOM,APE,APE2,TEL,SAL);
END;

CREATE OR REPLACE PROCEDURE Nuevo_Producto(
VID in number,NOM in VARCHAR2,DES in VARCHAR2,CANT in number,CODCAT in number )
AS
BEGIN
    insert into Productos(codproducto,nombreproducto,  descripcion, cantidadproducto, codCategoria) VALUES(VID,NOM,DES,CANT,CODCAT);
END;

CREATE OR REPLACE PROCEDURE Nuevo_Cliente(
VID in number,NOM in VARCHAR2,APE in VARCHAR2,APE2 in VARCHAR,TEL in VARCHAR )
AS
BEGIN
    insert into Clientes(codcliente,nombre,apellido1,apellido2,telefono1) VALUES(VID,NOM,APE,APE2,TEL);
END;

CREATE OR REPLACE PROCEDURE Eliminar_Cliente(VID in number)
AS
BEGIN
    DELETE FROM Clientes where codcliente=VID;
END;

CREATE OR REPLACE PROCEDURE Eliminar_Empleado(VID in number)
AS
BEGIN
    DELETE FROM Empleados where codempleado=VID;
END;

CREATE OR REPLACE PROCEDURE Eliminar_Producto(VID in number)
AS
BEGIN
    DELETE FROM Productos where codproducto=VID;
END;
--------trigger para actualizar el stock de productos despues de insertar en la tabla de categoriaProductos------------

create or replace trigger productos_actualizado
after insert on categoriaProducto
for each row --para cada fila
declare
begin
     update Productos
     set cantidadproducto = cantidadproducto - :new.cantidadproducto
     where codproducto = :new.codproducto;

end;

SELECT cantidadproducto, nombreproducto, codCategoria
FROM PRODUCTOS
WHERE CODPRODUCTO = '4';

 insert into Productos values(4,'chile','verdureria',200,040);

----------cursor para todos los empleados que tienen salario menores a 200000----------------
declare
  v_nombreemp EMPLEADOS.NOMBREEMP%type;
  cursor empleados_con_salarios_cursor is
  select nombreemp
  from Empleados c
  where c.SALARIO <= 200000;
begin
open empleados_con_salarios_cursor;
   loop
    fetch empleados_con_salarios_cursor into v_nombreemp;
    exit when empleados_con_salarios_cursor%notfound;
    
    DBMS_OUTPUT.PUT_LINE(v_nombreemp);
   end loop;

close empleados_con_salarios_cursor;
end;

select * from Empleados;
---------------------------------Cursor para hacer el llamado a los productos que estan solo en la parte de abarrotes----------

declare
  v_producto PRODUCTOS.NOMBREPRODUCTO%type;
  cursor prod_tipo_cursor is
  select nombreproducto
  from Productos c
  where c.DESCRIPCION = 'Abarrotes';
begin
open prod_tipo_cursor;
   loop
    fetch prod_tipo_cursor into  v_producto;
    exit when prod_tipo_cursor%notfound;
    
    DBMS_OUTPUT.PUT_LINE( v_producto);
   end loop;

close prod_tipo_cursor;
end;

select * from PRODUCTOS;

----------esta funcion creara una actualizacion de la cantidad de productos que existen por tipo de producto---------------------------

select * from Productos;

create or replace function actualiza_cantidad_producto(v_codigo Productos.codproducto%type,
                                                      v_nuevaCantidad_producto Productos.cantidadProducto%type)
return number
as
     v_cantidad Productos.cantidadProducto%type;
begin
      select cantidadProducto into v_cantidad
      from Productos 
      where codProducto = v_codigo;
      
    if v_cantidad is null then
      update Productos
      set cantidadProducto =  v_nuevaCantidad_producto+(cantidadProducto)
      where codproducto = v_codigo;  
    else
      update Productos
      set cantidadProducto = cantidadProducto+(cantidadProducto-v_nuevaCantidad_producto)
      where codproducto = v_codigo; 
    end if;
    
    return SQL%ROWCOUNT;
end;

declare 
   v_codigo Productos.codproducto%type := &codproducto;
   v_nuevaCantidad_producto Productos.cantidadProducto%type := &v_nuevaCantidad_producto;
   v_filas number(8);
begin
     v_filas :=  actualiza_cantidad_producto( v_codigo, v_nuevaCantidad_producto);
     
     DBMS_OUTPUT.put_line('Se han modificado' || v_filas || 'filas');

end;

select * from PRODUCTOS;

------PAQUETE PARA EN LISTAR UN PRODUCTO---------------
CREATE OR REPLACE PACKAGE PROD_SELECIONAR
AS
  TYPE C_SALIDA IS REF CURSOR;
  PROCEDURE SP_PRODUCT(xNom in varchar, xSalida out c_salida);
  PROCEDURE AGRE_PRODUCTO(xCOD IN INTEGER,xNom in varchar,xDescrip in varchar,xCantiProduc in INTEGER,xCodCatego IN INT);

END;

CREATE OR REPLACE PACKAGE BODY PROD_SELECIONAR
AS

    PROCEDURE SP_PRODUCT(xNom in varchar, xSalida out c_salida)
    is
    begin
    open xSalida for
    select * from Productos p 
    where p.NOMBREPRODUCTO = xNom;
    end;
    PROCEDURE AGRE_PRODUCTO(xCOD IN INTEGER,xNom in varchar,xDescrip varchar,xCantiProduc IN INTEGER,xCodCatego IN INT)
    is
    begin
    insert into Productos(codproducto,nombreproducto,descripcion,cantidadproducto,codCategoria) values (xCOD,xNom,xDescrip,xCantiProduc,xCodCatego);
    commit;
    end;
end;

begin
     PROD_SELECIONAR.AGRE_PRODUCTO(xCOD=>37,xNom =>'platanos',xDescrip =>'verdureria',xCantiProduc =>10000,xCodCatego =>40);
end;


select*from PRODUCTOS;

----------activacipn de trigger al insertar un cliente dependiendo del dia en el que se encuentre se activara el trigger para dejar ingresar un cliente------------

CREATE OR REPLACE TRIGGER TR_INSERTA_CLIENTES
BEFORE INSERT ON Clientes
BEGIN
    IF(TO_CHAR(SYSDATE, 'DY') IN ('LUN'))
    OR (TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '06:00' AND '23:50')
    THEN RAISE_APPLICATION_ERROR(-20000,'NO SE ENCUENTRA DENTRO DE LOS HORARIOS LABORALES, CONTARTAR A SOPORTE DB');
    END IF;
END;
    
    
    
insert into Clientes (codcliente,nombre,apellido1,apellido2,telefono1)
 values (9,'Diana','Saez','Gonzales','88788453');
    
    
    

-----------VERIFICACION DE FECHA
SELECT To_CHAR(SYSDATE, 'dy')
FROM DUAL;

select * FROM SYSDATE;

SELECT * FROM CLIENTES;

DROP TRIGGER TR_INSERTA_CLIENTES;