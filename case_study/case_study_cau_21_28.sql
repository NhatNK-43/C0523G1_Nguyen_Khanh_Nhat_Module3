insert into nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
value 
	('Nguyễn Văn Long','1970-11-29','456231723','10000000','0901234145','"longnguyen@gmail.com"','Hải Châu, Đà Nẵng',1,3,1);


/* 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên
có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với 
ngày lập hợp đồng là “12/12/2019”.*/
 
 create view v_nhan_vien as
 select
	ma_nhan_vien, ho_ten, ngay_sinh, dia_chi
from
	nhan_vien
where
	dia_chi like '%hai chau%'
    and ma_nhan_vien in (
			select ma_nhan_vien
            from hop_dong
            where ngay_lam_hop_dong = '2019-12-12'
            group by ma_nhan_vien
            having count(ma_nhan_vien) > 0);
    
drop view v_nhan_vien;

/* 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với 
tất cả các nhân viên được nhìn thấy bởi khung nhìn này.*/

alter table nhan_vien
drop constraint ma_nhan_vien;
set sql_safe_updates = 0;
update v_nhan_vien
set dia_chi = 'Liên Chiểu';
set sql_safe_updates = 1;

/* 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó
 với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.*/
 
/* 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu 
sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc 
không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.*/

/* 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng 
số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.*/

/* 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra 
xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn 
hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu
 không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít 
 nhất là 2 ngày” trên console của database.
Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.*/

/* 27.	Tạo Function thực hiện yêu cầu sau:
a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với 
tổng tiền là > 2.000.000 VNĐ.
b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ 
lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch 
vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không 
xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham 
số của function này.*/

/* 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách 
hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các 
dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng 
dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên 
quan khác.*/
