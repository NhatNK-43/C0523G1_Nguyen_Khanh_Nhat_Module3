create database user_management;
use user_management;

create table users(
	id int not null primary key auto_increment,
    name varchar(50) not null,
    email varchar(50) not null,
    country varchar(50)
);

alter table users
add column is_delete bit(1) default 0;

set sql_safe_updates = 0;
update users set is_delete = 1 where id = 1;
set sql_safe_updates = 1;

select id, name, email, country from user_management.users 
where country like "%V%";

delimiter //
create procedure show_list()
begin
select id, name, email, country from user_management.users 
where is_delete = 0;
end //
delimiter ;

call show_list();

delimiter //
create procedure add_user(new_name varchar(50), new_email varchar(50), new_country varchar(50))
begin
insert into users (name, email,country,is_delete)
value 
	(new_name, new_email, new_country, b'0');
end //
delimiter ;

call add_new ('Hạnh','hanh@gmail.com','USA')

delimiter //
create procedure update_user(new_name varchar(50), new_email varchar(50), new_country varchar(50), id_update int)
begin
update users 
set 
	name = new_name, 
    email = new_email,
    country = new_country
where
	id = id_update;
end //
delimiter ;

delimiter //
create procedure delete_user(id_delete int)
begin
update users 
set 
	is_delete = b'1'
where
	id = id_delete;
end //
delimiter ;