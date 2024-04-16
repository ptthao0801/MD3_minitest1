create database TourManagement4;
use TourManagement4;

create table CategoryTour(
                             id int primary key,
                             categoryCode varchar(255),
                             categoryName varchar(255)
);

create table City(
                     id int primary key,
                     cityName varchar(255)
);

create table Destination(
                            id int primary key,
                            destinationName varchar(255),
                            describes varchar(255),
                            cost int,
                            city_id int,
                            FOREIGN KEY (city_id) references City(id)
);

create table Tour(
                     id int primary key,
                     tourCode varchar(255),
                     category_id int,
                     destination_id int,
                     dateStart DATE,
                     dateEnd DATE,
                     FOREIGN KEY (category_id) references CategoryTour(id),
                     FOREIGN KEY (destination_id) references Destination(id)
);

create table Clients(
                        id int primary key,
                        nameClient varchar(255),
                        idNumber int,
                        dateBirth Date,
                        city_id int,
                        FOREIGN KEY (city_id) references City(id)
);

create table OrderTour(
                          id int primary key,
                          tour_id int,
                          clients_id int,
                          status varchar(255),
                          FOREIGN KEY (tour_id) references Tour(id),
                          FOREIGN KEY (clients_id) references Clients(id)
);

insert into City(id, cityName)
VALUES (1,'Ha Noi'),
       (2,'Bangkok'),
       (3,'Ho Nam'),
       (4,'Paris'),
       (5,'London');

insert into Destination(id, destinationName, describes, cost, city_id)
VALUES (1,'lang Bac Ho','abc',100,1),
       (2, 'Siam', 'xv',500,2),
       (3, 'Phuong Hoang co tran','gh',1000,3),
       (4, 'Thap Eiffel','dvf',1200,4),
       (5, 'Big Ben','abc',200,5);

insert into Clients(id, nameClient, idNumber, dateBirth, city_id)
VALUES (1,'khach 1',12,'1999-04-05',1),
       (2,'khach 2',11,'2000-06-01',2),
       (3,'khach 3',55,'1978-03-02',3),
       (4,'khach 4',43,'2003-03-02',4),
       (5,'khach 5',67,'1897-08-17',1),
       (6,'khach 6',29,'2005-11-20',5),
       (7,'khach 7',78,'1998-12-19',4),
       (8,'khach 8',39,'1996-08-29',2),
       (9,'khach 9',86,'1997-09-28',3),
       (10,'khach 10',94,'1995-09-11',5);

insert into CategoryTour(id, categoryCode, categoryName)
VALUES (1,'DNA','Dong Nam A'),
       (2,'CA','Chau Au');

insert into Tour(id, tourCode, category_id, destination_id, dateStart, dateEnd)
VALUES (1,'DNA1',1,1,'2024-04-04','2024-04-20'),
       (2,'DNA2',1,3,'2024-06-04','2024-06-20'),
       (3,'DNA3',1,3,'2024-07-04','2024-07-20'),
       (4,'DNA4',1,4,'2024-04-04','2024-04-20'),
       (5,'DNA5',1,1,'2024-07-04','2024-07-20'),
       (6,'DNA1',1,3,'2024-11-04','2024-11-20'),
       (7,'DNA2',1,4,'2024-12-04','2024-12-20'),
       (8,'DNA3',1,4,'2024-02-04','2024-02-20'),
       (9,'DNA4',1,1,'2024-05-04','2024-05-20'),
       (10,'CA1',2,5,'2024-08-04','2024-08-20'),
       (11,'CA2',2,2,'2024-07-04','2024-07-20'),
       (12,'CA3',2,5,'2024-03-04','2024-03-20'),
       (13,'CA4',2,2,'2024-03-04','2024-03-20'),
       (14,'CA5',2,2,'2024-09-04','2024-09-20'),
       (15,'CA6',2,5,'2024-10-04','2024-10-20');

insert into OrderTour(id, tour_id, clients_id, status)
VALUES (1,1,1,'paid'),
       (2,2,2,'unpaid'),
       (3,1,2,'paid'),
       (4,10,10,'unpaid'),
       (5,6,3,'paid'),
       (6,10,4,'unpaid'),
       (7,13,5,'paid'),
       (8,4,5,'unpaid'),
       (9,2,5,'paid'),
       (10,11,9,'unpaid');

update Tour set destination_id = 2 where id = 2 or id = 3;
update Tour set dateStart = '2020-03-05' where id = 2 or id = 3 or id = 8;
update Tour set dateEnd = '2020-04-05' where id =  4 or id = 5 or id = 7;


select count(Tour.id) AS 'So luong Tour', cityName, city_id from Tour
LEFT JOIN Destination D on Tour.destination_id = D.id
LEFT JOIN City C on D.city_id = C.id
GROUP BY city_id;

select count(Tour.id) AS 'So luong Tour' from Tour
where dateStart between '2020-03-01' and '2020-03-31';

select count(Tour.id) AS 'So luong Tour' from Tour
where dateEnd between '2020-04-01' and '2020-04-30';


