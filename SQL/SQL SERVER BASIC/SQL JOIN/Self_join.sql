-- Self join

/*
Self Join হলো এমন একটি জয়েন যেখানে একটি টেবিলকে নিজের সাথেই জয়েন করা হয়। এটি কোনো আলাদা জয়েন টাইপ নয়, বরং একটি সাধারণ জয়েন (যেমন Inner বা Left Join) যা একই টেবিলের ওপর প্রয়োগ করা হয়।

সহজ কথায়, যখন একটি টেবিলের একটি কলামের সাথে ওই একই টেবিলের অন্য একটি কলামের সম্পর্ক থাকে, তখন Self Join ব্যবহার করা হয়।

এটি কেন ব্যবহার করা হয়?
১. হায়ারার্কি (Hierarchy) প্রকাশ করতে: যেমন- একই টেবিলে কর্মচারী এবং তাদের ম্যানেজারদের তালিকা থাকলে।
২. একই কলামের মানের তুলনা করতে: একটি সারির ডাটার সাথে ওই টেবিলেরই অন্য সারির ডাটা তুলনা করতে।
*/

select * from table1 as a inner join table1 as b
on a.c1 = b.c1

select * from table2 as a inner join table2 as b
on a.c1 =b.c1

select * from table2 as a inner join table2 as b
on a.c3 =b.c3

select a.c1,b.c2 from table1 as a inner join table1 as b
on a.c1 = b.c1
