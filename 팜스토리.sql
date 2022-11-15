#날짜 : 2022/11/15
#이름 : 황원진
#내용 : 팜스토리 실습

#데이터베이스 생성
CREATE DATABASE `java2_farmstory`;
CREATE USER 'java2_farmstory'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `java2_farmstory`.* TO 'java2_farmstory'@'%';
FLUSH PRIVILEGES;

#회원 테이블 생성
CREATE TABLE `farmstory_user`(
	`uid`		VARCHAR(20) PRIMARY KEY,
	`pw`		VARCHAR(255) NOT NULL,
	`name`	VARCHAR(20) NOT NULL,
	`nick`	VARCHAR(20) UNIQUE NOT NULL,
	`email`	VARCHAR(20) UNIQUE NOT NULL,
	`hp`		CHAR(13) UNIQUE NOT NULL,
	`grade`	TINYINT DEFAULT 2,
	`zip`		CHAR(5),
	`addr1`	VARCHAR(255),
	`addr2`	VARCHAR(255),
	`regip`	VARCHAR(100) NOT NULL,
	`rdate`	DATETIME NOT NULL

);

#약관 테이블 생성
CREATE TABLE `farmstory_terms`(
	`terms`		TEXT,
	`privacy`	TEXT
);

#게시물 데이터 생성 
CREATE TABLE `farmstory_article` (
	`no`			INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT DEFAULT 0,
	`comment`	INT DEFAULT 0,
	`cate`		VARCHAR(20) DEFAULT 'free',
	`title`		VARCHAR(255),
	`content`	TEXT NOT NULL,
	`file`		TINYINT DEFAULT 0,
	`hit`			INT DEFAULT 0,
	`uid`			VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(100) NOT NULL,
	`rdate`		DATETIME NOT NULL 
);

#파일 테이블 생성
CREATE TABLE `farmstory_file` (
	`fno`			INT AUTO_INCREMENT PRIMARY KEY,
	`parent`		INT NOT NULL,
	`newName`	VARCHAR(255) NOT NULL,
	`oriName`	VARCHAR(255) NOT NULL,
	`download`	INT DEFAULT 0
);

