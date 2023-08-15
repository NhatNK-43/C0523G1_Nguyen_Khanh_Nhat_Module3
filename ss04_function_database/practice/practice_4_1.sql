use student_management;

-- Hiển thị số lượng sinh viên ở từng nơi
select 
	students.address, 
    count(students.student_name) as quantity
from 
	students
group by 
	students.address;	

-- Tính điểm trung bình các môn học của mỗi học viên
select 
	students.*,
    avg(marks.mark) as average
from 
	students
    join marks on students.student_id = marks.student_id 
group by 
	students.student_id;

-- Hiển thị những bạn học viên có điểm trung bình các môn học lớn hơn 15
select 
	students.*,
    avg(marks.mark) as average
from 
	students
    join marks on students.student_id = marks.student_id 
group by 
	students.student_id
having 
	average > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select 
	students.*,
    avg(marks.mark) as average
from 
	students
    join marks on students.student_id = marks.student_id 
group by 
	students.student_id
having 
	average = all(
				select avg(marks.mark)
				from marks group by marks.student_id
				);