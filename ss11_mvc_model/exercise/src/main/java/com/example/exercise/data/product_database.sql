create database product_management;
use product_management;

create table products(
	`id` int primary key auto_increment,
    `name` varchar(50) not null,
    `price` int,
    `description` varchar(50),
    `manufacturer` varchar(50)
);