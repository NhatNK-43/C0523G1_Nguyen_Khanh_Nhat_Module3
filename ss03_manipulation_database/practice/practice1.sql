create database student_management;

use student_management;

create table classroom(
	class_id int not null primary key auto_increment,
    class_name varchar(60) not null,
    start_date datetime not null,
    `status` bit
);

create table students(
	student_id int not null primary key auto_increment,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20) default '',
    `status` bit,
    class_id int not null,
    foreign key (class_id) references classroom(class_id)
);

create table subjects(
	subject_id int not null primary key,
    subject_name varchar(30) not null,
    credit tinyint not null default 1,
    check(credit>=1),
    `status` bit
);

create table marks(
	mark_id int not null primary key auto_increment,
    subject_id int not null,
    student_id int not null,
	mark float default 0,
    check(mark between 0 and 100),
    exam_time tinyint default 1,
    unique (subject_id,student_id),
    foreign key (subject_id) references subjects(subject_id),
    foreign key (student_id) references students(student_id)
);

insert into classroom (class_name, start_date, `status`)
value
	('A1','2008-12-20',1),
    ('A2','2008-12-22',1),
    ('B3',current_date,0);
    
insert into students (student_name, address, phone, `status`, class_id)
value	
	('Hung','Ha Noi','0912113113',1,1),
    ('Hoa','Hai phong','',1,1),
    ('Manh','HCM','0123123123',0,2);
    
insert into subjects (subject_id, subject_name, credit, `status`)
value
	(1, 'CF', 5, 1),
	(2, 'C', 6, 1),
	(3, 'HDJ', 5, 1),
	(4, 'RDBMS', 10, 1);
    
insert into marks (subject_id, student_id, mark, exam_time)
value
	(1, 1, 8, 1),
	(1, 2, 10, 2),
	(2, 1, 12, 1);
    