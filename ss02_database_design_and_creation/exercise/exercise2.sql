create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customers(
	id int not null primary key auto_increment,
    customer_name varchar(50) not null,
    age int
 );
 
 create table products(
	id int not null primary key auto_increment,
    product_name varchar(50) not null,
    price int
 );
 
 create table orders(
	id int not null primary key auto_increment,
    customer_id int not null,
    order_date datetime,
    total_price int,
    foreign key (customer_id) references customers(id)
 );
 
 create table order_detail(
	order_id int not null,
    product_id int not null,
    quantity int,
    primary key(order_id, product_id),
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
 );
 
 