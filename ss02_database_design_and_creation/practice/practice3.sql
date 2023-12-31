create database student_management;

use student_management;

create table classroom(
	class_id int not null primary key auto_increment,
    class_name varchar(60) not null,
    start_date datetime not null,
    `status` bit
);

create table student(
	student_id int not null primary key auto_increment,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    `status` bit,
    class_id int not null,
    foreign key (class_id) references classroom(class_id)
);

create table subjection(
	subject_id int not null primary key auto_increment,
    subject_name varchar(30) not null,
    credit tinyint not null default 1,
    check(credit>=1),
    `status` bit
);

create table mark(
	mark_id int not null primary key auto_increment,
    subject_id int not null,
    student_id int not null,
	mark float default 0,
    check(mark between 0 and 100),
    exam_time tinyint default 1,
    unique (subject_id,student_id),
    foreign key (subject_id) references subjection(subject_id),
    foreign key (student_id) references student(student_id)
);