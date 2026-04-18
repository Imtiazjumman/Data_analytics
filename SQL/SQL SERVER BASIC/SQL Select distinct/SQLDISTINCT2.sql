--SQL-এ DISTINCT কীওয়ার্ডটি মূলত একটি কলাম বা একাধিক কলাম থেকে ডুপ্লিকেট (একই রকম) ভ্যালু সরিয়ে শুধুমাত্র ইউনিক (অনন্য) ভ্যালুগুলো দেখানোর জন্য ব্যবহার করা হয়।
SELECT * from EmployeeRecords

SELECT DISTINCT FirstName, LastName, Department, Salary from EmployeeRecords

