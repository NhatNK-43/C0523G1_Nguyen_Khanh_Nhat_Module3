create database quan_ly_ban_hang;
use quan_ly_ban_hang;
 create table customer(
	id varchar(20) not null primary key,
    `name` varchar(50) not null,
    age int
 );
 
 create table product(
	id varchar(20) not null primary key,
    `name` varchar(50) not null,
    price int
 );
 
 create table orders(
	id varchar(20) not null primary key,
    customer_id varchar(20) not null,
    order_date datetime,
    total_price int,
    foreign key (customer_id) references customer(id)
 );
 
 create table order_detail(
	order_id varchar(20) not null,
    product_id varchar(20) not null,
    quantity int,
    primary key(order_id,product_id),
    foreign key (product_id) references orders(id),
    foreign key (product_id) references product(id)
 );
 
 