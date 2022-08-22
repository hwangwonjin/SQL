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

create table ``(
	``       varchar(10),




);


#실습 1-8
#실습 1-9
