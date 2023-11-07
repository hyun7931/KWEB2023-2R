/*codeA.5 import : mysql -uroot -p -Dkwebhw1107 <C:\23SS\codeA.5.sql*/
/*codeA.6 impott : mysql -uroot -p -Dkwebhw1107 <C:\23SS\codeA.6.sql*/

/*1번*/
select users.id, users.name, tickets.seat_number from tickets 
inner join users on users.id = tickets.user and tickets.train=11 
order by tickets.seat_number;

/*2번*/
select users.id, users.name, Count(*) AS trains_count, Sum(trains.distance)/10 AS total_distance 
from tickets 
inner join trains on trains.id=tickets.train 
inner join users on users.id=tickets.user 
group by users.id 
order by total_distance DESC 
limit 6;

/*3번*/
select trains.id, types.name AS type , src.name AS src_stn, dst.name AS dst_stn, Timediff(`arrival`, `departure`) AS travel_time 
From trains 
inner join stations src on trains.source=src.id 
inner join stations dst on trains.destination=dst.id 
inner join types on trains.type=types.id 
order by travel_time 
DESC limit 6;

/*4번*/
select types.name AS type, src.name AS src_stn, dst.name AS dst_stn, trains.departure AS departure, trains.arrival AS arrival,  Round(types.fare_rate * trains.distance / 1000, -2) AS fare
from trains
inner join stations src on trains.source=src.id 
inner join stations dst on trains.destination=dst.id
inner join types on types.id=trains.type
order by departure; 

/*5번*/
select trains.id, types.name AS type , src.name AS src_stn, dst.name AS dst_stn, Count(*) AS occupied, types.max_seats AS maximum
from tickets
inner join trains on trains.id=tickets.train
inner join stations src on trains.source=src.id 
inner join stations dst on trains.destination=dst.id 
inner join types on trains.type=types.id
group by tickets.train
order by trains.id;

/*6번*/
select trains.id AS id, types.name AS type , src.name AS src_stn, dst.name AS dst_stn, Count(tickets.id) AS occupied, types.max_seats AS maximum
from tickets
right join trains on trains.id=tickets.train
inner join stations src on trains.source=src.id 
inner join stations dst on trains.destination=dst.id 
inner join types on types.id=trains.type
group by tickets.train
order by trains.id;