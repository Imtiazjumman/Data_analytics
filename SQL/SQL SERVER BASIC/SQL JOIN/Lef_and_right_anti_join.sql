--Left anti join

--১. Left Anti Join
--এটি বাম দিকের টেবিল (Table A) থেকে শুধুমাত্র সেই রেকর্ডগুলো রিটার্ন করে যেগুলোর জন্য ডান দিকের টেবিলে (Table B) কোনো ম্যাচিং মান পাওয়া যায় না।

--মূল কথা: "A-তে আছে কিন্তু B-তে নেই।"

--ব্যবহার: যারা এখনো কোনো অর্ডার করেনি এমন কাস্টমারদের তালিকা বের করতে।

select * from Table1
select * from Table2

select * from Table1 left join table2
on Table1.c1 = Table2.c1
where table2.c1 is null

select * from Table1 left join table2
on Table1.c1 = Table2.c1
where table2.c3 is null

--Right Anti Join
--এটি ঠিক তার উল্টো। এটি ডান দিকের টেবিল (Table B) থেকে শুধুমাত্র সেই রেকর্ডগুলো রিটার্ন করে যেগুলোর জন্য বাম দিকের টেবিলে (Table A) কোনো ম্যাচিং মান নেই।

-- মূল কথা: "B-তে আছে কিন্তু A-তে নেই।"

-- ব্যবহার: এমন প্রোডাক্টগুলো খুঁজে বের করতে যেগুলোর কোনো ক্যাটাগরি বা সোর্স টেবিলের সাথে লিঙ্ক নেই।

select * from table1 right join table2
on table1.c1 = table2.c1 
where table1.c2 is null