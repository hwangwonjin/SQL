#날짜 : 2022/08/22
#이름 : 황원진
#내용 : 제1장 SQL 기초

#실습 1-1
create database `userDB`;
drop database `userDB`;

#실습 1-2

create table `User1`(
`uid`  varchar(10),
`name` varchar(10),
`hp`   char(13),
`age`  int
);

drop table `User1`;

#실습 1-3
insert into `User1` values ('A101', '김유신', '010-1234-1111', 25);
insert into `User1` values('A102', '김춘추', '010-1234-2222', 23);
insert into `User1` values('A103', '장보고', '010-1234-3333', 32);
insert into `User1` (`uid`, `name`, `age` ) values('A104','강감찬', 45);
insert into `user1` set 
				`uid` = 'A105', 
                `name`= '이순신', 
                `hp` = '010-1234-5555';



#실습 1-4
select * from `User1`;
select * from `user1` where `uid` = 'A101';
select * from `user1` where `name` = '김유신';
select * from `user1` where `age` < 30;
select * from `user1` where `age` >= 30;


select `uid`, `name`, `age`from `User1`;



#실습 1-5
update `user1` set `hp`='010-1234-4444' where `uid`='A104';
update `user1` set `age`=51  where `uid` = 'A105';
update `user1` set 
					`hp` = '010-1234-1001', 
                    `age`=27  
				where 
					`uid`='A101';

#실습 1-6
delete from `user1` where `uid`='A101';
delete from `user1` where `uid`= 'A102' and `age`=25 ;
delete from `user1` where `age` >= 30;



#실습 1-7

create table `TblUser`(
	`userId`		varchar(10),
	`userName`		varchar(10),
    `userHp`		char(13),
    `userAge`		tinyint,
    `userAddr`		varchar(20)
);


create table `TblProduct`(
`prdCode` 		int,
`prdName`		varchar(10),
`prdprice`		int,
`prdAmount`		int,
`prdcompany`	varchar(10),
`prdmakedate` 	date
);

#실습 1-8

insert into `tbluser` values('p101','김유신','010-1234-1001',25,'서울시 중구');
insert into `tbluser` values('p102', '김춘추', '010-1234-1002', 23 ,'부산시 금정구');
insert into `tbluser` values('p103', '장보고', null, 31,'경기도 광주군');
insert into `tbluser` values('p104', '강감찬', null, null ,'경남 창원시');
insert into `tbluser` values('p105', '이순신', '010-1234-1005', 50 ,null);


insert into `tblproduct` values(1,'냉장고',800,10,'LG','2022-01-06');
insert into `tblproduct` values(2,'노트북',1200,20,'삼성','2022-01-06');
insert into `tblproduct` values(3,'TV',1400,6,'LG','2022-01-06');
insert into `tblproduct` values(4,'세탁기',1000,8,'LG','2022-01-06');
insert into `tblproduct` values(5,'컴퓨터',1100,0,null,null);
insert into `tblproduct` values(6,'휴대폰',900,102,'삼성','2022-01-06');


#실습 1-9
select * from `tbluser`;
select `userName` from `tbluser`;
select `userName`,`userHp` from `tbluser`;
select * from `tbluser` where `userId` = 'p102';
select * FROM `tbluser` where `useraddr`='신라';
select * from `tbluser` where `userAge` > 30;
select * from `tbluser` where `userHp` is null;
update `tbluser` set
				`userAge`=42 
                where `userId` = 'p104';
update `tbluser` set
				`useraddr` = '경남 김해시' 
                where `userid` = 'p105';
delete from `tbluser` where `userid` = 'p103';

select * from `tblproduct`;
select `prdName` from `tblproduct`;
select `prdName`, `prdprice` from `tblproduct`;
select * from `tblproduct` where `prdcompany` ='LG';
select * from `tvlproduct` where `prdcompany` = '삼성';
update `tblproduct` set
					`prdcompany`='삼성',
                    `prdMakeDate` = '2021-01-01'
                    where `prdcode`=5;