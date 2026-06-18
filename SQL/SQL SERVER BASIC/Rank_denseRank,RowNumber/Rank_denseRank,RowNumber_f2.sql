Select * from Students

--Rank the marks of students in descending order for each subject and assign a rank to each student based on their marks.
select *, ROW_NUMBER() Over(partition by Subject order by marks desc) as [Rank]
from Students

-- Ascending order 
select *, ROW_NUMBER() Over(partition by Subject order by marks) as [Rank]
from Students

-- If you want to rank the marks of students in descending order for each student_name instead of subject, you can use the following query:

select *, ROW_NUMBER() Over(partition by student_name order by marks desc) as [Rank]
from Students

-- Rank partioned by student_name in descending order
select *, RANK() Over(partition by student_name order by marks desc) as [Rank]
from Students

select *, RANK() Over(partition by Subject order by marks desc) as [Rank]
from Students

--Dense_ rank partioned by student_name in descending order
select *, Dense_Rank () Over(partition by Subject order by marks desc) as [Rank]
from Students