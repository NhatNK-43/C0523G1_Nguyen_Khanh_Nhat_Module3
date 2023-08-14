use student_management;

select * from students;

select * from students
where `status` = true;

select * from subjects
where credit < 10;

select students.student_id, students.student_name, classroom.class_name
from students join classroom on students.student_id = classroom.class_id
where classroom.class_name = 'A1';

select students.student_id, students.student_name, subjects.subject_name, marks.mark
from students 
	join marks on students.student_id = marks.student_id
	join subjects on marks.subject_id = subjects.subject_id
where subjects.subject_name = 'CF';