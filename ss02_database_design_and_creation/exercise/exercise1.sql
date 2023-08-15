create database quan_ly_vat_tu;
use quan_ly_vat_tu;

create table vat_tu(
	ma_vt varchar(20) not null primary key auto_increment,
    ten_vt varchar(50) not null
);

create table phieu_xuat(
	so_px varchar(20) not null primary key,
    ngay_xuat datetime
);

create table phieu_nhap(
	so_pn varchar(20) not null primary key,
    ngay_nhap datetime
);

create table nha_cc(
	ma_ncc varchar(20) not null primary key,
	ten_ncc varchar(50) not null,
    dia_chi varchar(100),
    sdt varchar (20)
);

create table don_hang(
	so_dh varchar(20) not null primary key,
    ngay_dh datetime, 
    ma_ncc varchar(20) not null,
    foreign key (ma_ncc) references nha_cc(ma_ncc)
);

create table chi_tiet_phieu_xuat(
	ma_vt varchar(20) not null,
    so_px varchar(20) not null,
    primary key(ma_vt,so_px),
    foreign key (ma_vt) references vat_tu(ma_vt),
    foreign key (so_px) references phieu_xuat(so_px),
    so_luong_xuat int,
    don_gia_xuat int
);

create table chi_tiet_phieu_nhap(
	ma_vt varchar(20) not null,
    so_pn varchar(20) not null,
    primary key(ma_vt,so_pn),
    foreign key (ma_vt) references vat_tu(ma_vt),
    foreign key (so_pn) references phieu_nhap(so_pn),
    so_luong_nhap int,
    don_gia_nhap int
);

create table chi_tiet_don_hang(
	ma_vt varchar(20) not null,
	so_dh varchar(20) not null,
    primary key (ma_vt,so_dh),
	foreign key (ma_vt) references vat_tu(ma_vt),
    foreign key (so_dh) references don_hang(so_dh)
);


