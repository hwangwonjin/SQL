#날짜: 2022/09/01
#이름: 황원진
#내용 : SQL 연습문제 44


#실습 4-1
create database `java2_BookStore`;
create user 'java2_admin4'@'%' identified by '1234';
grant all privileges on `java2_BookStore`.* to 'java2_admin4'@'%';
flush privileges;

#실습 4-2
create table `Customer`(
`custId`		int auto_increment primary key,
`name`			char(10) not null,
`address`		varchar(20) default null,
`phone`			char(13) default null
);

create table `Book`(
`bookId`		int primary key,
`bookName`		varchar(20) not null,
`publisher`		varchar(20) not null,
`price`			int default null
);


create table `Order`(
`orderId`		int auto_increment primary key,
`custId`		int,
`bookId`		int,	
`salePrice`		int,
`orderDate`		date
);
#실습 4-3
insert into `Customer`(`name`,`address`,`phone`) values('박지성','영국 맨체스터','000-5000-0001');
insert into `Customer`(`name`,`address`,`phone`) values('김연아','대한민국 서울','000-6000-0001');
insert into `Customer`(`name`,`address`,`phone`) values('장미란','대한민국 강원도','000-7000-0001');
insert into `Customer`(`name`,`address`,`phone`) values('추신수','미국 클리블랜드','000-8000-0001');
insert into `Customer`(`name`,`address`) values('박세리','대한민국 대전');

insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(1,'축구의 역사','굿스포츠',7000);
insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(2,'축구아는 여자','나무수',13000);
insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(3,'축구의 이해','대한미디어',22000);
insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(4,'골프 바이블','대한미디어',35000);
insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(5,'피겨교본','굿스포츠',8000);
insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(6,'역도 단계별기술','굿스포츠',6000);
insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(7,'야구의 추억','이상미디어',20000);
insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(8,'야구를 부탁해','이상미디어',13000);
insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(9,'올림픽 이야기','삼성당',7500);
insert into `Book`(`bookId`,`bookname`,`publisher`,`price`) values(10,'olympic Champions','pearson',13000);


insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(1,1,6000,'2014-07-01');
insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(1,3,21000,'2014-07-03');
insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(2,5,8000,'2014-07-03');
insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(3,6,6000,'2014-07-04');
insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(4,7,20000,'2014-07-05');
insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(1,2,12000,'2014-07-07');
insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(4,8,13000,'2014-07-07');
insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(3,10,12000,'2014-07-08');
insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(2,10,7000,'2014-07-09');
insert into `Order`(`custId`,`bookId`,`saleprice`,`orderdate`) values(3,8,13000,'2014-07-10');



#실습 4-4
select `custId`,`name`,`address` from `customer`;

#실습 4-5
select `bookname`,`price` from `book`;

#실습 4-6
select `price`,`bookname` from `book`;

#실습 4-7
select * from `book`;

#실습 4-8
select `publisher` from `book`;

#실습 4-9
select distinct`publisher` from `book`; 

#실습 4-10
select * from `book` where `price` >=20000;

#실습 4-11
select * from `book` where`price`<20000;

#실습 4-12
select * from `book`
 where `price`>=10000 and `price`<=20000;

#실습 4-13
select`bookid`,`bookname`,`price` from `book` where `price`>=15000 and `price`<=30000;

#실습 4-14
select * from `book` 
where `bookid`in (2,3,5); 

#실습 4-15
select * from `book`
where mod(`bookId`,2)=0;

#실습 4-16
select* from `customer` where `name` like '박%';

#실습 4-17
select * from `customer` where `address` like '대한민국%';

#실습 4-18
select * from `customer` where `phone` is not null;

#실습 4-19
select* from `book` 
where `publisher` like '굿스포츠' or
 `publisher` like '대한미디어';

#실습 4-20
select `publisher` from `book` 
where `bookname` like '축구의 역사';

#실습 4-21
select `publisher` from `book` 
where `bookname` like '축구%';

#실습 4-22
select * from `book`
where `bookname` like '_구%';

#실습 4-23
select * from `book` 
where `bookname` like '축구%'
and `price` >= 20000;

#실습 4-24
select * from `book` order by `bookname` asc;

#실습 4-25
select * from `book`
 order by `price` asc, `bookname` asc;

#실습 4-26
select * from `book`
 order by `price` desc,`publisher`asc;

#실습 4-27
select * from `book`
order by `price` desc limit 3;

#실습 4-28
select * from `book`
order by `price` asc limit 3;

#실습 4-29
select sum(`saleprice`) as `총판매액` from `order`;

#실습 4-30
select sum(`saleprice`) as '총판매액',
avg(`saleprice`) as '평균값',
min(`saleprice`) as '최처가',
max(`saleprice`) as'최고가' 
 from `order`;

#실습 4-31
select count(`orderid`) as `판매건수` from `order`;

#실습 4-32
 select *, replace(`bookname`, '야구','농구') from `book`;
 

#실습 4-33
select `custId`, count(`custid`) as `수량`from `order`
where`saleprice`>=8000 
group by `custid`
having `수량`>=2;
 
#실습 4-34
select * from `customer` as a
join `order` as b
on a.custId = b.custId;


#실습 4-35
select * from `customer` as a
join `order` as b 
on a.custId = b.custId
order by a.custId asc;

#실습 4-36
select`name`,`salePrice` from `customer` as a
join `order` as b
on a.custId = b.custId;

#실습 4-37
select `name`,sum(`saleprice`) from `customer` as a
join `order` as b
on a.custId = b.custId
group by `name`
order by `name` asc;

#실습 4-38
select`name`,`bookname` from `order` as a 
join `customer` as b on a.custId = b.custId
join `book` as c on a.bookId = c.bookId;

#실습 4-39
select`name`,`bookname` from `order` as a 
join `customer` as b on a.custId = b.custId
join `book` as c on a.bookId = c.bookId
where `salePrice` =20000;

#실습 4-40
select * from `customer` as a
left join `order` as b 
on a.custId = b.custId;

#실습 4-41
select `bookname` from `book` where `price` = (select max(`price`)from `book`);
#실습 4-42
select * from `customer` where `name`not in(select `name` from `Customer` where `custid`in (select distinct `custId` from `order`));

#실습 4-43
select sum(`saleprice`) as `총판매액` from `order` where `custId`=(select`custId` from `customer` where `name` = '김연아');

#실습 4-44
insert into `book` values('11','스포츠의학','한솔의학서적',null);

#실습 4-45
update `customer`set `address`= '대한민국 부산' where `custid`=5;

#실습 4-46
delete from `customer` where `cuatId` = 5 ;

