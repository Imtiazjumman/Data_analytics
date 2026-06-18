

/*
1. Primary Key (The Unique ID)
A Primary Key is a column (or a set of columns) that uniquely identifies every row in a table.

Rule 1: It must be unique (no two rows can have the same PK).

Rule 2: It cannot be NULL (every row must have one).

Rule 3: A table can have only one Primary Key.

Analogy: Your National ID number or Social Security Number. It’s the one thing that distinguishes you from everyone else, even if they have the same name.

2. Foreign Key (The Link)
A Foreign Key is a column in one table that points to the Primary Key in another table. It acts as a cross-reference.

Purpose: It enforces "Referential Integrity," meaning you can't add a record to the child table if the link doesn't exist in the parent table.

Rule: It can contain duplicate values (e.g., one customer can have many orders).

Analogy: A "Customer ID" listed on an invoice. The invoice uses that ID to look up who the customer is in a separate "Customers" table.
*/

-- Parent Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Child Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    -- This creates the link:
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    Total decimal(3,2)
);

INSERT INTO Customers (CustomerID, Name)
VALUES 
    (101, 'Sarah Jenkins'),
    (102, 'Mike Ross'),
    (103, 'Harvey Specter');


INSERT INTO Orders (OrderID, OrderDate, CustomerID)
VALUES 
    (5001, '2026-04-20', 101), -- Sarah's first order
    (5002, '2026-04-21', 101), -- Sarah's second order
    (5003, '2026-04-22', 102), -- Mike's order
    (5004, '2026-04-25', 103); -- Harvey's order


select * from Customers
select * from Orders