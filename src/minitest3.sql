create database minitest3;
use minitest3;

create table PXUAT(
                      id int primary key ,
                      ngayxuat DATE,
                      tenKH varchar(255)
);

create table VATTU(
                      id int primary key ,
                      tenVatTu varchar(255),
                      donvitinh int,
                      giatien double
);

create table CTPXUAT(
                        id int primary key ,
                        idPxuat int,
                        idVatTu int,
                        soluongXuat int,
                        dongiaXuat double,
                        description varchar(255),
                        foreign key (idPxuat) references PXUAT(id),
                        foreign key (idVatTu) references VATTU(id)
);

create table TONKHO(
                       id int primary key ,
                       idVatTu int,
                       soluongDau int,
                       sumSoluongNhap int,
                       sumSoluongXuat int,
                       foreign key (idVatTu) references VATTU(id)
);

create table NHACC(
                      id int primary key ,
                      tenNCC varchar(255),
                      diachi varchar(255),
                      dienthoai varchar(255)
);

create table DONDH(
                      id int primary key ,
                      ngayDH DATE,
                      idNhaCC int,
                      foreign key (idNhaCC) references NHACC(id)
);

create table CTDONDH(
                        id int primary key ,
                        idDonDH int,
                        idVatTu int,
                        soluongDat int,
                        foreign key (idDonDH) references DONDH(id),
                        foreign key (idVatTu) references VATTU(id)
);

create table PNHAP(
                      id int primary key ,
                      ngaynhap DATE,
                      idDonDH int,
                      foreign key (idDonDH) references DONDH(id)
);

create table CTPNHAP(
                        id int primary key ,
                        idPhieuNhap int,
                        idVatTu int,
                        soluongNhap int,
                        dongiaNhap double,
                        foreign key (idPhieuNhap) references PNHAP(id),
                        foreign key (idVatTu) references VATTU(id)
);

alter table VATTU
    modify column donvitinh varchar(255);

insert into VATTU(id, tenVatTu, donvitinh, giatien)
VALUES (2,'vt2',1,400),
       (3,'vt3',1,600),
       (4,'vt4',1,1000),
       (5,'vt5',1,1400);

insert into VATTU(id, tenVatTu, donvitinh, giatien)
value (1,'vt1',1,500);

insert into TONKHO(id, idVatTu, soluongDau, sumSoluongNhap, sumSoluongXuat)
VALUES (1,1,100,100,50),
       (2,2,100,400,20),
       (3,3,100,100,50),
       (4,4,100,100,20),
       (5,5,100,100,10);

insert into NHACC(id, tenNCC, diachi, dienthoai)
VALUES (1,'nhaCC 1','dc 1', '0348279764'),
       (2,'nhaCC 2','dc 2', '0567839487'),
       (3,'nhaCC 3','dc 3', '0234567892');

insert into DONDH(id, ngayDH, idNhaCC)
VALUES (1,'2020-04-01',2),
       (2,'2021-05-03',1),
       (3,'2020-06-02',3);

insert into PNHAP(id, ngaynhap, idDonDH)
VALUES (1,'2020-03-20',1),
       (2,'2021-04-20',2),
       (3,'2020-05-20',3);

insert into PXUAT(id, ngayxuat, tenKH)
VALUES (1,'2021-04-03','khach hang 1'),
       (2,'2021-05-03','khach hang 2'),
       (3,'2021-06-03','khach hang 3');

insert into CTDONDH(id, idDonDH, idVatTu, soluongDat)
VALUES (1,1,1,20),
       (2,2,4,20),
       (3,3,5,20),
       (4,1,2,20),
       (5,3,1,20),
       (6,3,5,20);

insert into CTPNHAP(id, idPhieuNhap, idVatTu, soluongNhap, dongiaNhap)
VALUES (1,1,1,60,600),
       (2,2,2,50,500),
       (3,3,3,90,200),
       (4,3,4,90,100),
       (5,1,5,10,400),
       (6,1,1,40,700);

insert into CTPXUAT(id, idPxuat, idVatTu, soluongXuat, dongiaXuat, description)
VALUES (1,1,1,20,900,'ac'),
       (2,2,2,60,1000,'ac'),
       (3,3,2,30,1800,'ac'),
       (4,1,4,40,1500,'ac'),
       (5,2,5,90,1900,'ac'),
       (6,2,3,80,2000,'ac');

create view vw_CTPNHAP as
select C.idPhieuNhap as 'số phiếu nhập hàng', C.idVatTu as 'mã vât tư', soluongNhap, dongiaNhap, dongiaNhap*soluongNhap as 'thành tiền nhập'
from CTPNHAP C;

create view vw_CTPNHAP_VT as
select idPhieuNhap as 'số phiếu nhập hàng',idVatTu, tenVatTu, soluongNhap,dongiaNhap,dongiaNhap*soluongNhap as 'thành tiền nhập'
from CTPNHAP C
         left join PNHAP P on C.idPhieuNhap = P.id
         left join VATTU V on C.idVatTu = V.id;

create view vw_CTPNHAP_VT_PN as
select idPhieuNhap as 'số phiếu nhập hàng', ngaynhap as 'ngày nhập hàng', idDonDH as 'số đơn ĐH', idVatTu, tenVatTu, soluongNhap, dongiaNhap, dongiaNhap*soluongNhap as 'thành tiền nhập'
from CTPNHAP C
         left join PNHAP P on C.idPhieuNhap = P.id
         left join DONDH D on P.idDonDH = D.id
         left join VATTU V on C.idVatTu = V.id;

create view vw_CTPNHAP_VT_PN_DH as
select idPhieuNhap as 'số phiếu nhập hàng', ngaynhap as 'ngày nhập hàng', idDonDH as 'số đơn ĐH', idNhaCC as 'id Nhà CC', idVatTu, tenVatTu, soluongNhap, dongiaNhap, dongiaNhap*soluongNhap as 'thành tiền nhập'
from CTPNHAP C
         left join PNHAP P on C.idPhieuNhap = P.id
         left join DONDH D on P.idDonDH = D.id
         left join VATTU V on C.idVatTu = V.id;

create view vw_CTPNHAP_loc as
select idPhieuNhap as 'số phiếu nhập hàng', idVatTu, soluongNhap,dongiaNhap,dongiaNhap*soluongNhap as 'thành tiền nhập'
from CTPNHAP C
         left join VATTU V on V.id = C.idVatTu
where soluongNhap>5;

create view vw_CTPNHAP_VT_loc as
select idPhieuNhap as 'số phiếu nhập hàng',idVatTu, tenVatTu, soluongNhap,dongiaNhap,dongiaNhap*soluongNhap as 'thành tiền nhập', donvitinh
from CTPNHAP C
         left join PNHAP P on C.idPhieuNhap = P.id
         left join VATTU V on C.idVatTu = V.id
where donvitinh = 'Bộ';

create view vw_CTPXUAT  as
select idPxuat as 'số phiếu xuất hàng', idVatTu,soluongXuat,dongiaXuat,dongiaXuat*soluongXuat as 'thành tiền xuất'
from CTPXUAT C
         left join PXUAT P on P.id = C.idPxuat
         left join VATTU V on V.id = C.idVatTu;

create view vw_CTPXUAT_VT as
select idPxuat as 'số phiếu xuất hàng', idVatTu,tenVatTu,soluongXuat,dongiaXuat
from CTPXUAT C
         left join PXUAT P on P.id = C.idPxuat
         left join VATTU V on V.id = C.idVatTu;

create view vw_CTPXUAT_VT_PX as
select idPxuat as 'số phiếu xuất hàng', tenKH, idVatTu,tenVatTu,soluongXuat,dongiaXuat
from CTPXUAT C
         left join PXUAT P on P.id = C.idPxuat
         left join VATTU V on V.id = C.idVatTu;

-- Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.

delimiter //
create procedure TongSoLuongCuoi(IN value_idVatTu int)
begin
    select soluongDau + sumSoluongNhap - sumSoluongXuat as totalSoluongCuoi
    from TONKHO
    WHERE idVatTu = value_idVatTu;
end //
delimiter ;

-- Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.

delimiter //
create procedure TongTienXuatCuaVatTu(IN value_idVatTu int)
begin
    SELECT sum(soluongXuat*dongiaXuat) as 'Tổng tiền xuất'
    from CTPXUAT
    where idVatTu = value_idVatTu;
end //
delimiter ;

-- Câu 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.

delimiter //
create procedure TongSoLuongDH(IN value_idDH int)
begin
    SELECT sum(soluongDat)
    from CTDONDH
    where idDonDH = value_idDH;
end //
delimiter ;

-- Câu 4. Tạo SP dùng để thêm một đơn đặt hàng.

delimiter //
CREATE PROCEDURE TaoDH()
BEGIN
    DECLARE new_id INT;

    SELECT MAX(id) + 1 into new_id
    FROM DONDH;

    INSERT INTO DONDH(id) VALUES (new_id);
END //
DELIMITER ;

-- Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng.

delimiter //
create procedure ThemChiTietDH(IN p_ngayDH DATE, IN p_idNhaCC int)
begin
    declare id_max int;
    select max(id) into id_max
    from DONDH;
    update DONDH
    set ngayDH = p_ngayDH, idNhaCC = p_idNhaCC
    where id = id_max;
end //
delimiter ;

delimiter //
create procedure XoaNhaCC(IN p_idNhaCC int)
begin
    delete from NHACC
    where id = p_idNhaCC;

    update DONDH
    set idNhaCC = null
    where idNhaCC = p_idNhaCC;
end //
delimiter ;












