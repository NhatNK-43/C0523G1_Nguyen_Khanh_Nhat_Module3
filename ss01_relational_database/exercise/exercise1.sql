CREATE DATABASE exercise_1;

USE exercise_1;

CREATE TABLE classroom(
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

CREATE TABLE teacher(
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `age` INT,
    `country` VARCHAR(100)
);