JSP 카페 프로젝트

환경
windows10
jdk1.8
tomcat9.0
sts tool
mysql8.0
postman
lombok
gson (json파싱)
인코딩 utf-8
git

MySQL 데이터베이스 생성 및 사용자 생성

create user 'cafeuser'@'%' identified by 'eoghks5953';
GRANT ALL PRIVILEGES ON *.* TO 'cafeuser'@'%';
create database cafe;

MySQL 테이블 생성
cafeuser 사용자로 접속
use cafe; 데이터 베이스 선택

CREATE TABLE user(
    id int primary key auto_increment,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    address varchar(100),
    userRole varchar(20),
    createDate timestamp
) engine=InnoDB default charset=utf8;

CREATE TABLE orders(
    id int primary key auto_increment,
    userId int,
    productName varchar(30) not null,
    prdocutCount int not null,
    productPrice int not null,
    totalPrice int not null,
    orderDate timestamp,
    foreign key (userId) references user (id)
) engine=InnoDB default charset=utf8;