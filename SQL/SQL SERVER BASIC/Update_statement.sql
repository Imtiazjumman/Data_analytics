
select * from dbo.Employee_Record

select * into #1 from dbo.Employee_Record

select * from #1
update #1 
set LastName = 'Jon'
where LastName  is null

select * from #1
update #1
set salary = 50000
where salary = 0

select * from #1
update #1
set Department = 'Marketing'
where department = ''