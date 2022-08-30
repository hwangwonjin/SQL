#날짜 : 2022/08/29
#이름 : 황원진
# 내용 : SQL 연습문제
#실습1-1
create database `shop`;
create user 'admin1'@'%' identified by '1234';
grant all privileges on shop. * to 'admin1'@'%';
flush privileges;

#실습 1-2
create table `customer`(
	`custId` varchar(10) primary key,
    `name` 	varchar(10) not null,
	`hp`	char(13) default null,
    `addr`	varchar(100) default null,
	`rdate`	date not null
);

create table `product`(
`prodno`	int auto_increment primary key,
`prodname`	varchar(10) not null,
`stock`		int default 0,
`price`		int default null,
`company`	varchar(20) not null
);

create table `order`(
`orderno`		int auto_increment primary key,
`orderId`		varchar(10) not null,
`orderProduct`	int not null,
`orderCount`	int default 1,
`orderDate`		datetime not null
);

#실습1-3
insert into `customer` values('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
insert into `customer` values('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
insert into `customer` values('c103','장보고','010-1234-1003','완도군 정산면','2022-01-03');
insert into `customer` values('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
insert into `customer`(`custId`,`name`,`rdate`) values('c105','이성계','2022-01-05');
insert into `customer` values('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
insert into `customer`(`custId`,`name`,`rdate`) values('c107','허준','2022-01-07');
insert into `customer` values('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
insert into `customer` values('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
insert into `customer` values('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');


insert into `product`(`prodName`,`stock`,`price`,`company`) values('새우깡',5000,1500,'농심');
insert into `product`(`prodName`,`stock`,`price`,`company`) values('초코파이',2500,2500,'오리온');
insert into `product`(`prodName`,`stock`,`price`,`company`) values('포카칩',3600,1700,'오리온');
insert into `product`(`prodName`,`stock`,`price`,`company`) values('양파링',1250,1800,'농심');
insert into `product`(`prodName`,`stock`,`price`,`company`) values('죠리퐁',2200,null,'크라운');
insert into `product`(`prodName`,`stock`,`price`,`company`) values('마카렛트',3500,3500,'롯데');
insert into `product`(`prodName`,`stock`,`price`,`company`) values('뿌셔뿌셔',1650,1200,'오뚜기');

insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c102','3','2','2022-07-01 13:15:10');
insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c101','4','1','2022-07-01 14:16:11');
insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c108','1','1','2022-07-01 17:23:18');
insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c109','6','5','2022-07-02 10:46:36');
insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c102','2','1','2022-07-03 09:15:37');
insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c101','7','3','2022-07-03 12:35:12');
insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c110','1','2','2022-07-03 16:55:36');
insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c104','2','4','2022-07-04 14:23:23');
insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c102','1','3','2022-07-04 21:54:34');
insert into `order`(`orderId`,`orderproduct`,`ordercount`,`orderdate`) values('c107','6','1','2022-07-05 14:21:03');


#실습1-4
select*from `customer`;

#실습1-5
select`custId`,`name`,`hp`from `customer`;

#실습1-6
select *from `product`;

#실습1-7
select`company`from `product`;
#실습1-8
select  distinct `company` from `product`;
#실습1-9
select`prodName`, `price`from `product`;
#실습1-10
select`prodName`,`price`+500 as `조정단가`from `product`;
#실습1-11
select`prodName`, `stock`, `price` from `product` where `company`='오리온';
#실습1-12
select `orderProduct`, `orderCount`, `orderDate` from `order` where `orderId` = 'c102';
#실습1-13
select`orderProduct`, `orderCount`, `orderDate` from `order` where `orderId` = 'c102' and  `orderCount` >= 2; 
#실습1-14
select*from `product` where `price`>=1000 and `price`<=2000;
#실습1-15
select`custId`, `name`, `hp`, `addr` from `customer` where `name` like '김%';
#실습1-16
select `custId`,`name`, `hp`, `addr` from `customer` where `name` like '__';
#실습1-17
select * from `customer` where `hp` is null;
#실습1-18
select * from `customer` where `addr` is not null;
#실습1-19
select * from `customer` order by `rdate` desc;
#실습1-20
select * from `order` where `ordercount` >= 3 order by `ordercount` desc,  `orderproduct` asc; 
#실습1-21
select avg(`price`)  from `product`;
#실습1-22
select sum(`stock`) as `재고량 합계` from `product` where `company` = '농심';
#실습1-23
select count(`name`) as `고객수` from `Customer`;
#실습1-24
select count(distinct `company`) as `제조업체 수` from `Product`;
#실습1-25
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as ` 총 주문수량` 
from `order` group by `주문 상품번호` 
order by `주문 상품번호` asc  ;
#실습1-26
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가`
 from `product` group by `제조업체` order by `제조업체` asc;
#실습1-27
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` 
from `product` group by `company` having count(*) >= 2 ;
#실습1-28
select `orderProduct`, `orderId`, sum(`ordercount`) as `총 주문수량`
 from `order` 
 group by `orderProduct`, `orderId` order by `orderProduct`, `orderId` asc ; 
#실습1-29
select a.orderId, b.prodName from `order` as a
join `product` as b
on a.orderproduct = b.prodno
where `orderId` = 'c102';
#실습1-30
select `orderId`, `name`, `prodName`, `orderDate` from `order` as a
join `Customer` as b
on a.orderId = b.custId
join `product` as c 
on a.orderProduct = c.prodno
where date_format(`orderDate`,'%y-%m-%d') = date_format('2022-07-03','%y-%m-%d') ; 


