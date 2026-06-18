--ROW_NUMBER()  1, 2, 3, 4 (Strict sequential count; never repeats, no gaps).RANK()  1, 2, 2, 4 (Repeats on ties; skips numbers after a tie).DENSE_RANK() 1, 2, 2, 3 (Repeats on ties; never skips numbers).

Create table Students(
	student_name varchar(50),
	Subject varchar(50),
	marks int
);

Insert into students(student_name,Subject,marks) values
('John Doe','Math',85),
('Jane Smith','Math',92),
('Emily Davis','Math',78),
('Michael Brown','Math',88),
('Sarah Wilson','Math',95),
('David Lee','Math',80),
('Laura Johnson','Math',90),
('James Miller','Math',82),
('Olivia Garcia','Math',94),
('Daniel Martinez','Math',87),
('John Doe','Science',90),
('Jane Smith','Science',85),
('Emily Davis','Science',88),
('Michael Brown','Science',92),
('Sarah Wilson','Science',89),
('David Lee','Science',84),
('Laura Johnson','Science',91),
('James Miller','Science',86),
('Olivia Garcia','Science',93),
('Daniel Martinez','Science',87);
select * from Students;

--Rank the marks of students in descending order for each subject and assign a rank to each student based on their marks. If two students have the same marks, they should receive the same rank, and the next rank should be skipped. For example, if two students are tied for first place, they both receive a rank of 1, and the next student would receive a rank of 3.

select *, ROW_NUMBER() Over(Order by marks desc) as [Rank]
from Students

--Rank isf there is a tie in marks, use DENSE_RANK() instead of ROW_NUMBER() to assign the same rank to students with the same marks and skip the next rank accordingly.

select *, rank() Over(Order by marks desc) as [Rank]
from Students

select *, DENSE_RANK() Over(Order by marks desc) as [Rank]
from Students

--------AScending Order-----------

select *, ROW_NUMBER() Over(Order by marks) as [Rank]
from Students

--Rank isf there is a tie in marks, use DENSE_RANK() instead of ROW_NUMBER() to assign the same rank to students with the same marks and skip the next rank accordingly.

select *, rank() Over(Order by marks) as [Rank]
from Students

select *, DENSE_RANK() Over(Order by marks) as [Rank]
from Students