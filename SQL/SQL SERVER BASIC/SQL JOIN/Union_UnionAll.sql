-- টেবিল ১ তৈরি এবং ডাটা ইনসার্ট
CREATE TABLE append1 (C1 int, C2 nvarchar(255), C3 int);
INSERT INTO append1 VALUES (1, 'A', 7), (2, 'B', 8), (3, 'C', 9);

-- টেবিল ২ তৈরি এবং ডাটা ইনসার্ট (এখানে append2 হবে)
CREATE TABLE append2 (C1 int, C2 nvarchar(255), C3 int);
INSERT INTO append2 VALUES (11, 'AA', 17), (2, 'B', 8), (33, 'C1', 91);

-- উভয় টেবিলের ডাটা একসাথে দেখার জন্য
SELECT * FROM append1;
SELECT * FROM append2;

SELECT * FROM append1
UNION ALL
SELECT * FROM append2;

/*
যদি আপনি UNION ব্যবহার করেন, তবে ডাটাবেস অটোমেটিক ডুপ্লিকেট সারিটি (যেমন: 2, 'B', 8) খুঁজে বের করবে এবং সেটিকে শুধুমাত্র একবার দেখাবে।
*/
SELECT * FROM append1
UNION
SELECT * FROM append2;
