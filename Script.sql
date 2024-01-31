create database test;

create table sample2(
test_id char(4) not null
,test_name varchar(20) default 'test'
,test_price INTEGER default 100
,primary key (test_id)
);


insert into sample values('0000','sample',500);
insert into sample values('0001','sample1',330);
insert into sample values('0002','sample2',530);
insert into sample values('0003','sample3',230);

insert into sample2 values
((select test_id from sample where test_id = '0000'),'sample',200);

insert into sample2 values
((select test_id from sample where test_id = '0001'),(select test_name from sample where test_name = 'sample2'),(select test_price from sample where test_price = 330));



























