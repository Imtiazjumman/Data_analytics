
use [Sales Database]
create table Table1
(c1 int, c2 nvarchar(max)) -- Create a table named Table1 with two columns: c1 (integer) and c2 (nvarchar(max)) means it can store variable-length Unicode string data.

insert into Table1 
values
(1,'A'),
(1,'B'),
(2,'c'),
(null,'D'),
(3,'E'),
(7,'DA') 

--Creating Table2 and inserting data into it

create table Table2
(c1 int, c3 nvarchar(max)) -- Create a table named Table1 with two columns: c1 (integer) and c2 (nvarchar(max)) means it can store variable-length Unicode string data.

insert into Table2
values
(1,'XA'),
(2,'MB'),
(2,'NX'),
(Null,'MO'),
(4,'XY'),
(5,'TF')

Select * from Table1 
Select * from Table2 

Select * from Table1 inner join Table2 
on table1.c1 = table2.c1 

-- we dont want all columns just keep only common and unique column

select table1.c1 ,table1.c2,table2.c3 from table1 inner join table2 on table1.c1 = table2.c1
