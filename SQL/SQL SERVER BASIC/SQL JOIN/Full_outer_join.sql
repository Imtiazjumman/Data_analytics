/*
Full Outer Join হলো এমন একটি জয়েন যা উভয় টেবিলের (বাম এবং ডান) সমস্ত রেকর্ডকে একত্রিত করে। সহজ কথায়, এটি Left Join এবং Right Join-এর একটি সংমিশ্রণ।

মূল বৈশিষ্ট্য
এটি উভয় টেবিল থেকে সব ডাটা নিয়ে আসে।

যদি উভয় টেবিলের মধ্যে মিল (Match) থাকে, তবে তথ্যগুলো পাশাপাশি বসে।

যদি কোনো টেবিলের ডাটার সাথে অন্য টেবিলের মিল না থাকে, তবে সেই টেবিলের কলামগুলোর জায়গায় NULL দেখাবে।
*/

Select * from Table1
select * from Table2

select * from table1 full outer join table2
on table1.c1 = table2.c1

select a.c1,a.c2,b.c3 from Table1 as a full outer join table2 as b
on a.c1 = b.c1