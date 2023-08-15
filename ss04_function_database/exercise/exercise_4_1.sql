use student_management;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subjects
where credit in (
				select max(credit) 
                from subjects);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select 
	subjects.subject_id, 
	subjects.subject_name, 
    marks.mark
from 
	subjects
    join marks on subjects.subject_id = marks.subject_id
where mark in (
				select max(marks.mark) 
                from marks);

/* Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
xếp hạng theo thứ tự điểm giảm dần*/
select 
	students.*, 
    avg(marks.mark) as average
from 
	students
    join marks on students.student_id = marks.student_id
group by 
	students.student_id
order by 
	average desc;