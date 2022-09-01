#날짜 : 2022/08/31
#이름: 황원진
#내용: SQL 연습문제


#실습 3-1
create database `college`;
create user 'java2_admin3'@'%' identified by '1234';
grant all privileges on college.* to 'java2_admin3'@'%';
flush privileges;

#실습3-2
create table `Student`(
`stdNo`			char(8) primary key,
`stdName`		varchar(20) not null,
`stdhp`			char(13) not null,
`stdYear`		int not null,
`stdAddress` 	varchar(100) 
);

create table `Lecture`(
`lecNo`		int primary key not null,
`lecName`	varchar(20) not null,
`lecCredit`	int not null,
`lecTime`	int not null,
`lecClass`	varchar(10) default null
);

create table `Register`(
`regStdNo`		char(8) not null,
`regLecNo`		decimal(5),
`regMidScore`	int,
`regFinalScore`	int,
`regTotalScore`	int,
`regGrade`		char(1) 
);

#실습3-3
insert into `student`(`stdNo`,`stdName`,`stdHp`,`stdYear`) values('20201016','김유신','010-1234-1001',3);
insert into `student` values ('20201126','김춘추','010-1234-1002','3','경상남도 경주시');
insert into `student` values ('20210216','장보고','010-1234-1003','2','전라남도 완주시');
insert into `student` values ('20210326','강감찬','010-1234-1004','2','서울시 영등포구');
insert into `student` values ('20220416','이순신','010-1234-1005','1','부산시 부산진구');
insert into `student` values ('20220521','송상현','010-1234-1006',1,'부산시 동래구');

insert into `lecture` values(159,'인지행동심리학', 3, 40, '본304');
insert into `lecture` values(167,'운영체제론', 3, 25, '본805');
insert into `lecture` values(234,'중급 영문법', 3, 20, '본201');
insert into `lecture` values(239,'세법개론', 3, 40, '본204');
insert into `lecture` values(248,'빅데이터 개론', 3, 20, '본801');
insert into `lecture` values(253,'컴퓨터사고와 코딩', 2, 10, '본802');
insert into `lecture` values(349,'사회복지 마케팅', 2, 50, '본301');


insert into `register`(`regStdNO`,`regLecNo`) values('20201126',234);
insert into `register`(`regStdNO`,`regLecNo`) values('20201016',248);
insert into `register`(`regStdNO`,`regLecNo`) values('20201016',253);
insert into `register`(`regStdNO`,`regLecNo`) values('20201126',239);
insert into `register`(`regStdNO`,`regLecNo`) values('20210216',349);
insert into `register`(`regStdNO`,`regLecNo`) values('20210326',349);
insert into `register`(`regStdNO`,`regLecNo`) values('20201016',167);
insert into `register`(`regStdNO`,`regLecNo`) values('20220416',349);

#실습3-4
select * from `student`;

#실습3-5
select * from `lecture`;

#실습3-6
select * from `register`;

#실습3-7
select * from `student` where `stdYear`=3;

#실습3-8
select * from `lecture` where `lecCredit` = 2;

#실습3-9
update `register`set `regmidscore` = 36, `regfinalscore` = 42 where 
`regstdno` = '20201126' and `reglecno`= 234;
update `register`set `regmidscore` = 24, `regfinalscore` = 62 where 
`regstdno` = '20201016' and `reglecno`= 248;
update `register`set `regmidscore` = 28, `regfinalscore` = 40 where 
`regstdno` = '20201016' and `reglecno`= 253;	
update `register`set `regmidscore` = 37, `regfinalscore` = 57 where 
`regstdno` = '20201126' and `reglecno`= 239;
update `register`set `regmidscore` = 28, `regfinalscore` = 68 where 
`regstdno` = '20210216' and `reglecno`= 349;
update `register`set `regmidscore` = 16, `regfinalscore` = 65 where 
`regstdno` = '20210326' and `reglecno`= 349;
update `register`set `regmidscore` = 18, `regfinalscore` = 38 where 
`regstdno` = '20201016' and `reglecno`= 167;
update `register`set `regmidscore` = 25, `regfinalscore` = 58 where 
`regstdno` = '20220416' and `reglecno`= 349;


#실습3-10
update `register` set 
`regtotalscore` = `regmidscore` + `regfinalscore`,
`regGrade` = if(`regtotalscore` >= 90,'A',
			if(`regtotalscore` >= 80, 'B',
            if(`regtotalscore` >= 70, 'C',
            if(`regtotalscore` >= 60, 'D', 'F'))));
#실습3-11
select * from `register` order by `regtotalscore` desc;

#실습3-12
select * from `register` where `reglecno` = 349
 order by `regtotalscore` desc;

#실습3-13
select * from `lecture` where `lecTime` >= 30;

#실습3-14
select `lecName`, `lecclass`from `lecture`;

#실습3-15
select`stdNo`, `stdName` from `student`;

#실습3-16
select * from `student` where `stdAddress` is null;

#실습3-17
select * from `student` where `stdAddress` like '부산시%';

#실습3-18
select * from `student` as a
join `register` as b
on a.stdno = b.regStdNo;

#실습3-19
select 
	`stdno`, 
	`stdname`,
	`regLecNo`,
	`regMidScore`,	
	`regFinalScore`,
	`regTotalScore`,
	`regGrade` 
from `student` as a, `register` as b 
where a.stdno = b.regStdNo;

#실습3-20
select `stdname`, `stdno`, `reglecno` 
from `student` as a
join `register` as b
on a.stdno = b.regStdNo
where `reglecno` = 349
group by `stdno`;

#실습3-21
select `stdno`,`stdname`,
	count(`stdno`) as `수강신청 건수`,
    sum(`regtotalscore`) as `종합점수`,
    sum(`regtotalscore`) /count(`stdno`) as `평균`
 from `student` as a
join `register` as b
on a.stdno = b.regstdno
group by `stdno` order by `수강신청 건수`desc;

#실습3-22
select *
 from `register` as a
 join `lecture` as b 
 on a.reglecno = b.lecno;


#실습3-23
select`regstdno`,
		`reglecno`,
		`lecname`,
		`regmidscore`,
		`regFinalScore`,
		`regTotalScore`,
		`regGrade` 
        from `register` as a
join `lecture` as b on a.regLecNo = b.lecno
join `student` as c on a.regStdNo = c.stdno;

#실습3-24
select count(*) as `사회복지 마케팅 수강 신청 건수`,
avg(`regtotalscore`) as `사회복지 마케팅 평균`
 from `register`as a 
join `lecture` as b on a.regLecNo = b.lecno
where `regLecNo` = 349;

#실습3-25
select `regStdNo`,`lecname` from `register` as a
join `lecture` as b
on a.regLecNo = b.lecno
where `regGrade` = 'A';

#실습3-26
select * from `student` as a
join `register` as b on a.stdno = b.regStdNo
join `lecture` as c on b.reglecno = c.lecNo;

#실습3-27
select 
	`stdno`,
    `stdname`,
    `lecno`,
    `lecname`,
    `regmidscore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade` from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
order by `reggrade` asc;

#실습3-28
select `stdno`,`stdname`,`lecname`,`regtotalscore`,`regGrade` from `student`as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.regLecNo = c.lecno
order by `reggrade` desc
limit 1;

#실습3-29
select `stdno`,`stdname`,sum(`lecCredit`) from `student` as a 
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
where `regTotalScore` >= 60
group by `stdno`
order by `stdno` asc;

#실습3-30
select`stdno`,`stdname`,
group_concat(`lecname`) as `신청과목`,
group_concat(if(`regTotalScore` >= 60,`lecname`, null)) as `이수과목`
 from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
group by `stdno`;