-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 12, 2018 at 07:30 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.7

#1
select u_name, create_date
from user

#2
select e_name,cuser.e_id, cuser_id
from cuser,employee
where c_name="apple" and cuser.e_id=employee.e_id

#3
select distinct(train.train_id), d_id
from route , train 
where route.train_id=train.train_id and start="sadeghie" and 
end="emamreza" and 
exists(select route.station_id 
from route,station 
where route.station_id=station.station_id and s_name="neyshabour");

#4
select content
from complain_u
where user_id=342 and support_id=234

#5
select sum(price)
from book_c ,cuser
where book_c.cuser_id=cuser.cuser_id and c_name="apple"

#6
select driver.d_id
from driver
where modify_date BETWEEN '2018-07-00 00:00:00' AND '2018-07-30 23:59:59' and status="deleted"

#7
select p_id, train_id, date, price, ref_num
from book_u
where user_id=null

#8
select ref_num, book_u.train_id
from book_u, train, driver
where book_u.train_id=book_u.train_id and train.d_id=driver.d_id and d_name="hossein" and user_id="323"

union 

select ref_num, book_c.train_id
from book_c, train, driver
where book_c.train_id=book_c.train_id and train.d_id=driver.d_id and d_name="hossein" and cuser_id="323"

#9
select a_id, a_name
from agent
where DATE(ex_date) < '2018-08-00' and DATE(create_date) > '2018-07-00'

#10
select distinct(train.train_id), d_id
from route , train 
where WEEKDAY(arival_time)=0 and 
exists(select *
from book_u as a, book_u as b,
when a.train_id=route.train_id and b.train_id=route.train_id and a.user_id=4654 and b.user_id=7854)
and
exists(select route.station_id 
from route,station 
where route.station_id=station.station_id and s_name="siosepol");

#11
select income
from company
where modify_date BETWEEN '2018-07-00 00:00:00' AND '2018-07-30 23:59:59'

#12
select train.train_id,d_id
from train,route,station
where train.train_id=route.train_id and 
train.start=station.s_name and station.station_id=route.station_id and 
EXTRACT(MONTH FROM departure_time)=6

#13
select cc_id as complain_id,support_id,duration
from complain_c

union

select uc_id as complain_id,support_id,duration
from complain_u

#14
select d_name, driver.d_id, sum(amount)
from driver,transfer
where driver.d_id=transfer.d_id 
order by sum(amount)
limit 1,1

#15
create VIEW TripCnt as
select User_id, count(ref_num) as cnt
from book_u
where date BETWEEN '2018-04-00 00:00:00' AND '2018-06-30 23:59:59'

select u_name , TripCnt.user_id, cnt
from TripCnt, User
where TripCnt.user_id=user.user_id 
order by cnt
limit 1

#16
creat view p as
select count(*) as c1
from book_u
where user_id=null

creat view u as
select count(*) as c2
from book_u
where user_id=null

select c1-c2
from u,p

#17
select train.train_id,d_id
from train,route,station
where train.train_id=route.train_id and 
train.start=station.s_name and station.station_id=route.station_id and 
EXTRACT(MONTH FROM departure_time)=MONTH(CURRENT_TIMESTAMP)+1 
