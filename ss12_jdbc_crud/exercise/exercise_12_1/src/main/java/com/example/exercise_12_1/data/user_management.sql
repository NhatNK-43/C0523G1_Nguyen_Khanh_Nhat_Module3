create database user_manangement;
use user_manangement;

create table users(
	id int(3) not null primary key auto_increment,
    name varchar(50) not null,
    email varchar(50) not null,
    country varchar(50)
);