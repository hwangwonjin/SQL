#날짜 : 2022/08/23
#이름 : 황원진
#내용 : 테이블 제약조건과 수정

#실습 2-1
create table `user2`(
`uid`	varchar(20) primary key,
`name`	varchar(10),
`hp`	char(13),
`age`	tinyint
);

#실습 2-2
insert into `user2` values('a103','김유신','010-1234-1001',25);
insert into `user2` values('a102','김춘추','010-1234-1002',23);

#실습 2-3
create table `user3`(
`uid`		varchar(20) primary key,
`name`		varchar(10),
`hp`		char(13) unique,
`age`		tinyint
);


#실습 2-4
insert into `user3` values ('a103','김유신','010-1234-1003',25);
insert into `user3` values ('a102','김춘추','010-1234-1002',23);

#실습 2-5
create table `parent`(
`pid`		varchar(10) primary key,
`name`		varchar(10),
`hp`		char(13) unique
);

create table `child`(
`cid`		varchar(10) primary key,
`name`		varchar(10),
`hp`		char(13) unique,
`pid`		varchar(10),
foreign key(`pid`) references `parent`(`pid`)
);

#실습 2-6
insert into `parent` values('p101','이성계','010-1234-1111');
insert into `child`  values('c101','이방원','010-1234-1001','p101');

#실습 2-7
create table `user4`(
`seq`		int primary key auto_increment,
`name`		varchar(10),
`gender`	tinyint,
`age`		tinyint,
`addr`		varchar(255)
);

#실습 2-8
insert into `user4`(`name`,`gender`,`age`,`addr`) values('김유신',1,25,'김해시');
insert into `user4`(`name`,`gender`,`age`,`addr`) values('김춘추',1,23,'경주시');
insert into `user4`(`name`,`gender`,`age`,`addr`) values('신사임당',2,27,'강릉시');

delete from `user4` where `name` = '신사임당';

#실습 2-9
create table `user5`(
`name`		varchar(10) not null,
`gender`	tinyint,
`addr`		varchar(255)
);

#실습 2-10
insert into `user5` set
				`name` = '김유신';
insert into `user5` set
				`name` = '김춘추',`addr`= '부산시';

#실습 2-11
alter table `user5` add `hp` varchar(20);
alter table `user5` add `age` char(10) default'0000-00-00' after `name`;
alter table `user5` add `uid` varchar(10);

#실습 2-12
alter table `user5` modify `hp` char(13);
alter table `user5` modify `age` tinyint;

#실습 2-13
alter table `user5` change column `addr` `address` varchar(100);

#실습 2-14
alter table `user5` drop `gender`;

#실습 2-15
create table `user6` like `user5`;

#실습 2-16
insert into `user6` select*from`user5`;
