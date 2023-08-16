create database demo;

create table products (
	id int not null primary key auto_increment,
    product_code varchar(50) not null,
    product_name varchar(50) not null,
    product_price int,
    product_amount int,
    product_description varchar(50),
    product_status bit
);

insert into products
value
	(1,'DL','Dell',500,20,'vip',1),
	(2,'LNV','Lenovo',400,3,'normal',1);
-- Tạo INDEX
create unique index index_code on products (product_code);
create unique index index_name_price on products (product_name, product_price);

explain 
select product_code
from products
where product_code = 'DL';

-- Tạo VIEW
create view product_view as
select product_code, product_name, product_price, product_status
from products;

update product_view
set product_price = 520
where product_name = 'Dell';

drop view product_view;

-- Tạo PROCEDURE
-- 1. show
delimiter //
create procedure product_show ()
begin
	select *
    from products;
end //
delimiter ;

-- 2. add
delimiter //
create procedure product_add 
	(id int, product_code varchar(50), product_name varchar(50), product_price int, 
	product_amount int,product_description varchar(50), product_status bit)
begin
	insert into products
    value 
		(id, product_code, product_name, product_price, product_amount, product_description, product_status);
end //
delimiter ;

-- 3. update
delimiter //
create procedure product_update (id_set int, amount int)
begin
	update products
    set  product_amount = amount
    where id = id_set;
end //
delimiter ;

-- 4. delete
delimiter //
create procedure product_delete (id_delete int)
begin
	delete from products
    where id = id_delete;
end //
delimiter ;

call product_show();
call product_add(3,'AS','Asus',240,14,'normal',1);
call product_add(4,'AC','Acer',320,9,'normal',1);
call product_update (4,350);
call product_delete(3);

