create database minitest2;
use minitest2;

create table Address(
                        id int primary key ,
                        address varchar(255)
);

create table Classes(
                        id int primary key ,
                        name varchar(255),
                        language varchar(255),
                        description varchar(255)
);

create table Students(
                         id int primary key ,
                         fullname varchar(255),
                         address_id int,
                         age int,
                         phone varchar(255) unique ,
                         classes_id int,
                         FOREIGN KEY (address_id) references Address(id),
                         FOREIGN KEY (classes_id) references Classes(id)
);

create table Course (
                        id int primary key ,
                        name varchar(255),
                        description varchar(255)
);

create table Point(
                      id int primary key ,
                      course_id int,
                      student_id int,
                      point double,
                      FOREIGN KEY (course_id) references Course(id),
                      FOREIGN KEY (student_id) references Students(id)
);

insert into Address(id, address)
VALUES (1,'5 Pham Ngoc Thach'),
       (2,'106 Nguyen Van Troi'),
       (3,'102 Duong Buoi'),
       (4,'203 Van Phuc'),
       (5,'106 Pham Hung');

insert into Classes(id, name, language, description)
VALUES (1,'A','Eng','abc'),
       (2,'B','Eng','sdec'),
       (3,'C','Viet','sdec'),
       (4,'A','Viet','sdec'),
       (5,'D','Span','sdec');

insert into Students(id, fullname, address_id, age, phone, classes_id)
VALUES (1,'Nguyen Nhu Anh',2,17,'0334567892',1),
       (2,'Nguyen Minh Anh',1,12,'0758984787',3),
       (3,'Phan Minh Anh',1,13,'04567298476',2),
       (4,'Hoang Minh Thu',3,18,'04879837568',3),
       (5,'Nguyen Minh Lan',3,20,'04452983718',4),
       (6,'Dang Minh Thu',5,15,'02237846898',5),
       (7,'Dang Thu Anh',4,20,'0337268536',1),
       (8,'Nguyen Minh Khoi',4,16,'0728765438',3),
       (9,'Phan Tuan Tu',1,17,'0289845678',5),
       (10,'Nguyen Ha Trang',1,13,'0125627873',4);

insert into Students(id, fullname, address_id, age, phone, classes_id)
VALUES (12,'Dang Thuyanh',2,17,'07837698746',1),
       (13,'Pham Minh Minh',5,25,'0357689876',3);

insert into Course(id, name, description)
VALUES (1,'Tieng Viet 1','sv'),
       (2,'Tieng Viet 2','sd');

insert into Course(id, name, description)
VALUES (3,'Tieng Viet 3','sv'),
       (4,'Tieng Viet 4','sd'),
       (5,'Tieng Viet 5','sd'),
       (6,'Tieng Viet 6','sd'),
       (7,'Tieng Viet 7','sd'),
       (8,'Tieng Viet 8','sd'),
       (9,'Tieng Viet 9','sd'),
       (10,'Tieng Viet 10','sd'),
       (11,'Tieng Viet 11','sd'),
       (12,'Tieng Viet 12','sd'),
       (13,'Tieng Viet 13','sd'),
       (14,'Tieng Viet 14','sd'),
       (15,'Tieng Viet 15','sd'),
       (16,'Tieng Viet 16','sd'),
       (17,'Tieng Viet 17','sd'),
       (18,'Tieng Viet 18','sd'),
       (19,'Tieng Viet 19','sd'),
       (20,'Tieng Viet 20','sd');

insert into Point(id, course_id, student_id, point)
VALUES (1,1,1,8),
       (2,1,2,9),
       (3,1,3,5),
       (4,1,4,6.5),
       (5,1,5,3.7),
       (6,1,6,6.8),
       (7,1,7,9.4),
       (8,1,8,5.9),
       (9,1,9,10),
       (10,1,10,7),
       (11,2,1,6),
       (12,2,2,8.8),
       (13,2,3,9),
       (14,2,4,4.6),
       (15,2,5,6),
       (16,2,6,7),
       (17,2,7,8),
       (18,2,8,9),
       (19,2,9,8),
       (20,2,10,6);

insert into Point(id, course_id, student_id, point)
VALUES (21,3,1,8),
       (22,4,2,9),
       (23,5,1,4),
       (24,6,1,7),
       (25,7,4,8.7),
       (26,8,5,3.9),
       (27,9,6,1),
       (28,10,7,0),
       (29,11,8,6.7),
       (31,12,9,5.6),
       (32,13,10,4),
       (33,14,9,3.8),
       (34,15,6,8.8),
       (35,16,12,8),
       (36,17,12,8),
       (37,18,3,6.7),
       (38,19,7,7),
       (39,20,13,9);

insert into Point(id, course_id, student_id, point)
VALUES (40,3,2,7),
       (41,4,6,2),
       (42,5,7,10),
       (43,6,5,10),
       (44,7,9,8),
       (45,8,10,10),
       (46,9,7,8),
       (47,10,8,8),
       (48,11,10,8),
       (49,12,12,9.8),
       (50,13,13,5.7),
       (51,14,7,4.2),
       (52,15,2,9),
       (53,16,10,10),
       (54,17,13,9.5),
       (55,18,7,8.9),
       (56,19,9,8),
       (57,20,10,7.8);

-- Tim kiem HV co ho Nguyen
select * from Students
where fullname like 'Nguyen %';

-- Tim kiem HV co ten Anh
select * from Students
where fullname like '% Anh';

-- Tim kiem HV do tuoi 15 - 18
select * from Students
where age between 15 and 18;

-- Tim kiem HV co id = 12 hoac 13
select * from Students
where id = 12 or id = 13;

-- Thong ke so luong hoc vien cac lop COUNT
select C.name as 'Ten lop', count(*) as 'So luong HV' from Students
left join Classes C on Students.classes_id = C.id
group by classes_id;

-- Thong ke so luong hoc vien tai cac tinh (address)
select A.address as 'Dia chi', count(*) as 'So luong HV' from Students
left join Address A on Students.address_id = A.id
group by address_id;

-- Tinh diem trung binh cua cac khoa hoc AVG
select C.name as 'Ten khoa hoc', AVG(P.point) as 'Diem TB' from Course C
LEFT JOIN Point P on C.id = P.course_id
GROUP BY C.id;

-- Lay ra diem cao nhat, thap nhat
select C.name as 'Ten khoa hoc', MAX(P.point) as 'Diem cao nhat', MIN(P.point) as 'Diem thap nhat' from Course C
left join Point P on C.id = P.course_id
group by C.id;

-- Lay list HS, chuyen doi thanh uppcase
select UCASE(S.fullname) as 'Ten HS' from Students S;












