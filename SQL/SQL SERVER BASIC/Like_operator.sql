/*
SQL-এ **LIKE** অপারেটর মূলত আংশিক টেক্সট বা **Pattern Matching**-এর জন্য ব্যবহৃত হয়। এর মূল পয়েন্টগুলো নিচে সংক্ষেপে দেওয়া হলো:

* **কাজ:** কোনো নির্দিষ্ট শব্দ বা অক্ষরের বিন্যাস (Pattern) খুঁজে বের করা।
* **প্রধান চিহ্ন:**
    1.  **`%` (Percent):** এটি শূন্য বা তার বেশি যেকোনো সংখ্যক অক্ষর বোঝায়। (যেমন: `'A%'` মানে A দিয়ে শুরু হওয়া সব)।
    2.  **`_` (Underscore):** এটি ঠিক একটি নির্দিষ্ট অক্ষর বোঝায়। (যেমন: `'H_t'` মানে Hat বা Hot)।
* **ব্যবহার:** সাধারণত `SELECT`, `UPDATE` বা `DELETE` স্টেটমেন্টের `WHERE` ক্লজ-এ এটি ব্যবহার করা হয়।
* **উদাহরণ:** `WHERE Name LIKE 'K%'` লিখলে 'Karim', 'Kamal' ইত্যাদি নামগুলো পাওয়া যাবে।

সহজ কথায়, সঠিক বানান জানা না থাকলে বা আংশিক মিল খুঁজতে এটি সেরা টুল।
*/

-- Create Employees_us table
CREATE TABLE Employees_US (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert sample data into Employees table
INSERT INTO Employees_us (EmployeeID, FirstName, LastName, Department) VALUES
(1, 'Alice', 'Smith', 'Finance'),
(2, 'Bob', 'Johnson', 'Engineering'),
(3, 'Charlie', 'Williams', 'Marketing'),
(4, 'Diana', 'Brown', 'Finance'),
(5, 'Edward', 'Jones', 'Engineering'),
(6, 'Fiona', 'Garcia', 'Marketing'),
(7, 'George', 'Miller', 'Finance'),
(8, 'Hannah', 'Wilson', 'Engineering');

select * from Employees_US

-- Find employess whose last name start with 'S'
select * from Employees_US where lastname like 'S%'

-- Find Employees whose first name ends with 'A'
select * from Employees_US where firstname like '%a'

-- Find Emplyees whose department contains 'Eng'
select * from Employees_US where Department like '%eng%'

--Find employees whose lastname is exactly 5 characters long.
select * from Employees_US where LastName like '_____'

-- Find employees whose first name start with 'C' or 'D'
select * from Employees_US where firstname like '[CD]%'

-- Find employees whose last name contains 'son'
select * from Employees_US where lastname like '%son%'

-- Find employees whose firstname contains the letter 'i' as the second character
select * from Employees_US where firstname like '_i%'

--Find employees whose last name start with any letter between 'A' and 'L'.
select * from Employees_US where lastname like '[a-l]%'

-- Find Employees whose First Name does not contain 'o'.
select * from employees_us where firstname not like '%o%'

--Find Employees whose Last Name ends with 'n' and is exactly 5 characters long.
select * from Employees_US where lastname like '____n'

--Find Employees whose Department starts with 'Mar' and ends with 'ing'.
Select * from Employees_US where Department like '[Mar-ing]%'

--Find Employees whose First Name has an 'a' in the third position.
select * from employees_us where firstname like '__a%'

--Find Employees whose Last Name starts with 'Br' or 'Bl'.
select * from employees_us where lastname like 'br%' or lastname like 'bl%'

--Find Employees whose First Name starts with a vowel.
select * from employees_us where firstname like '[aeiou]%'

--Find Employees whose First Name does not start with a consonant.
select * from employees_us where firstname not like '[^aeiou]%'

--16) Find Employees whose First Name starts with a consonant.
select * from employees_us where firstname like '[^aeiou]%'