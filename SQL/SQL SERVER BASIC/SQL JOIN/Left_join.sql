--Left join example

select * from Table1
select * from Table2

select * from Table1 left join Table2 
on Table1.c1 =Table2.c1
--বাম দিকের টেবিলের সব ডাটা থাকবেই, আর ডান দিকের টেবিল থেকে শুধু ম্যাচিং ডাটাগুলো আসবে। মিল না থাকলে ডান দিকটা ফাঁকা (NULL) থাকবে।

select * from Table1 left outer join Table2 
on Table1.c1 =Table2.c1 
-- Give same output as left join

select a.c1,a.c2,b.c3 from table1 a left join table2 b 
on a.c1=b.c1