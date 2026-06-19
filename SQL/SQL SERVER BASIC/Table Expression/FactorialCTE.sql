
--Recursive CTE
/*
Recursive Common Table Expression (রিকার্সিভ CTE) হলো SQL-এর একটি বিশেষ এবং অত্যন্ত শক্তিশালী ফিচার, যা নিজের ভেতরে নিজেকে বারবার কল (Call) করতে পারে। এটি মূলত একটি লুপ (Loop) বা চেইনের মতো কাজ করে, যা ডাটা শেষ না হওয়া পর্যন্ত চলতেই থাকে।বাস্তব জীবনে যখন ডাটার মধ্যে কোনো প্যারেন্ট-চাইল্ড রিলেশন (Parent-Child Relationship) থাকে, তখন এটি ব্যবহার করা ছাড়া উপায় থাকে না। যেমন:অর্গানাইজেশন চার্ট: কে কার আন্ডারে কাজ করে (CEO $\rightarrow$ Manager $\rightarrow$ Team Lead $\rightarrow$ Developer)।ক্যাটাগরি এবং সাব-ক্যাটাগরি: Electronics $\rightarrow$ Mobile $\rightarrow$ Smart Phone $\rightarrow$ Android।এটি কীভাবে কাজ করে? (গঠন)একটি রিকার্সিভ CTE-র প্রধানত ৩টি অংশ থাকে:Anchor Member (শুরু বিন্দু): এটি হলো লুপের শুরুর লাইন। এটি টেবিল থেকে বেস বা প্রথম ডাটাটি তুলে আনে (যেমন: কোম্পানির CEO)।UNION ALL: এটি শুরুর ডাটার সাথে পরের লুপের ডাটাগুলোকে জোড়া লাগায়।Recursive Member (লুপ অংশ): এটি মূল CTE-র সাথে আসল টেবিলটিকে জয়েন করে বারবার নিচের লেভেলের ডাটা খুঁজতে থাকে, যতক্ষণ না ডাটা শেষ হচ্ছে।
*/

--factorial of a number using recursive CTE
with FactorialCTE AS
(
	-- Anchor Member: Start with the base case for factorial (0! = 1)
	SELECT 0 AS Number, 1 AS FactorialValue
	UNION ALL
	-- Recursive Member: Calculate factorial for the next number
	SELECT Number + 1, (Number + 1) * FactorialValue
	FROM FactorialCTE
	WHERE Number < 5 -- Change this value to calculate factorial for a different number
)
select * from FactorialCTE