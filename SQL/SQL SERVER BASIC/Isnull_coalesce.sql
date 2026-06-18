
--Isnull function is used to replace NULL values with a specified replacement value. In the Customers table, we have some NULL values in the Email, PhoneNumber, and Address columns. We can use the ISNULL function to replace these NULL values with a default value when querying the data.
--coalesce function is similar to ISNULL but can take multiple arguments and returns the first non-NULL value among them. This can be useful when we want to check multiple columns for NULL values and return a default value if all of them are NULL.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '123 Elm St'),
(2, 'Bob', 'Smith', NULL, '555-5678', NULL),
(3, 'Charlie', 'Williams', 'charlie.williams@example.com', NULL, '456 Oak St'),
(4, 'Diana', 'Brown', NULL, NULL, '789 Pine St'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '555-8765', NULL);


select * from Customers

select customerid,email,phonenumber from Customers

select customerid, ISNULL(email, 'No Email Provided') as Email, ISNULL(phonenumber, 'No Phone Number Provided') as PhoneNumber from Customers

select customerid, COALESCE(email, 'No Email Provided') as Email, COALESCE(phonenumber, 'No Phone Number Provided') as PhoneNumber from Customers