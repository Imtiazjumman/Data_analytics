Create database Student

Create table Student_details(
Student_name nvarchar (256),
Gender Char(1),
Age tinyint,
Event_date date,
Distance decimal (5,2)
);

Select * from Student_details;

insert into Student_details(Student_name,Gender,Age,Event_date,Distance)
values
('John','M',25,'2017-11-08',115.3),
('Cena','M',30,'2019-11-08',100.3),
('Lisa','F',28,'2022-03-04',108.00)

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like 'Student_details'

insert into Student_details(Student_name,Gender,Age)
values
('Lime','F',33),
('Rahman','M',30),
('Roksana','F',28)

Select * from Student_details;