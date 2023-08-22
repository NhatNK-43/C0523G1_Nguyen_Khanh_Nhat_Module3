create database `laptop_store`;
use `laptop_store`;
create table `cpus`(
	`cpu_id` int primary key auto_increment,
    `name` varchar(50) not null,
	`manufacturer` varchar(50) not null,
    `status` bit(1) default 0
);
create table `rams`(
	`ram_id` int primary key auto_increment,
	`name` varchar(50) not null,
    `bus` int not null,
    `memory` int not null,
    `manufacturer` varchar(50) not null,
	`status` bit(1) default 0
);
create table `vgas`(
	`vga_id` int primary key auto_increment,
    `name` varchar(50) not null,
    `manufacturer` varchar(50) not null,
    `memory` int not null,
    `status` bit(1) default 0
);
create table `disks`(
	`disk_id` int primary key auto_increment,
    `name` varchar(50) not null,
    `manufacturer` varchar(50) not null,
    `memory` int not null,
    `status` bit(1) default 0
);
create table `colors`(
	`color_id` int primary key auto_increment,
    `name` varchar(50) not null,
    `red` int not null,
    `blue` int not null,
    `green` int not null,
    `alpha` int not null,
    `status` bit(1) default 0
);
create table `products`(
	`product_id` int primary key auto_increment,
    `image` varchar(50),
    `name` varchar(50) not null,
    `price` int not null,
	`screen_size` int not null,
    `available_amount` int not null,
    `cpu_id` int,
    `ram_id` int,
    `vga_id` int,
    `disk_id` int,
    `color_id` int,
    foreign key (`cpu_id`) references `cpus`(`cpu_id`),
    foreign key (`ram_id`) references `rams`(`ram_id`),
    foreign key (`vga_id`) references `vgas`(`vga_id`),
    foreign key (`disk_id`) references `disks`(`disk_id`),
    foreign key (`color_id`) references `colors`(`color_id`),
    `status` bit(1) default 0
);
create table `bundled_gifts`(
	`bundled_gift_id` int primary key auto_increment,
    `name` varchar(50) not null,
    `status` bit(1) default 0
);
create table `promotion_details`(
	`promotion_id` int primary key auto_increment,
    `amount` int,
    `bundled_gift_id` int,
    `product_id` int,
	foreign key (`bundled_gift_id`) references `bundled_gifts`(`bundled_gift_id`),
    foreign key (`product_id`) references `products`(`product_id`),
	`status` bit(1) default 0
);
create table `customer_types`(
	`customer_type_id` int primary key auto_increment,
    `name` varchar(50) not null,
    `status` bit(1) default 0
);
create table `customers`(
	`customer_id` int primary key auto_increment,
    `name` varchar(50) not null,
    `avatar` varchar(50),
    `date_of_birth` date not null,
	`password` varchar(30) not null,
    `phone_number` varchar(15),
    `address` varchar(50),
    `gender` bit(1),
    `email` varchar(50),
    `customer_type_id` int,
    foreign key (`customer_type_id`) references `customer_types`(`customer_type_id`),
	`status` bit(1) default 0
);
create table `carts`(
	`cart_id` int primary key auto_increment,
    `amount` int,
    `customer_id` int,
    `product_id` int,
	foreign key (`product_id`) references `products`(`product_id`),
	foreign key (`customer_id`) references `customers`(`customer_id`),
	`status` bit(1) default 0
);
create table `payments`(
	`payment_id` int primary key auto_increment,
    `name` varchar(50) not null,
    `card_number` int,
    `password` varchar(30),
    `customer_id` int,
	foreign key (`customer_id`) references `customers`(`customer_id`)
);