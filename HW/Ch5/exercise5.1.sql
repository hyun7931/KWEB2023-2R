/*codeA.4 import : mysql -uroot -p -Dkwebhw1107 <C:\23SS\codeA.4.sql*/

select 'id','c3','c5' from 'crud' where 'c1'=11 and 'c2'=2; /*1번*/
select * from crud where c1>18 or c2<2; /*2번*/
insert into crud (c1,c2,c3,c4,c5) values (7,4,"col101",default,0);/*3번*/
insert into crud (id, c1,c2,c3,c4,c5) values (103,3,3,"col103",default,1);/*4번*/
select * from crud where id>100;/*5번*/
update crud set c3="col0", c5=0 where c1>4 and c1<9 and c2=1;/*6번*/
select * from crud where c1>4 and c1<9 and c2=1;/*7번*/
delete from crud where c5=0;/*8번*/
select * from crud where c5=0;/*9번*/