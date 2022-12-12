-- All the following statements follow step by step mechanisms in obtaining data.
-- It follows a sequential pattern from the user to -> intended relation destination.
-- This is based on user's request AND/OR test case scenario.

--1) Case: 1 (Owner accesses report)

-- Handles accessing all of the users data
SELECT *
FROM User;

-- Special case: Obtains JohnDoe details
SELECT *
FROM User
WHERE Email = "JohnDoe@yahoo.com";

-- Obtains report through author stats: all attributes
SELECT *
FROM AuthorReport;

-- Special case: Obtains Author (primary key) - JohnDoe
SELECT *
FROM AuthorReport
WHERE Author = "JohnDoe";

-- Obtains report through genre stats: all attributes
SELECT *
FROM GenreReport
WHERE Genre = "Romance";

-- Ensures obtaining data for condition such that reportID; contains report data
SELECT reportID
FROM GeneralReport
WHERE reportID IS NOT NULL AND SalesVsExpenditure IS NOT NULL;
--2) Case: 2 (Bookstore owner views added/removed books)

-- Handles accessing all of the users data
SELECT *
FROM User;

-- Retrieves data from the basket (in Quantity)
SELECT Quantity
FROM AddsToBasket
WHERE Quantity IS NOT NULL;

-- Retries data on books removed/added
SELECT *
FROM Book;

-- Or special case route
SELECT ISBN
FROM Book;

Select Stock, Threshold
FROM Warehouse
WHERE STOCK IS NOT NULL AND Threshold IS NOT NULL;

--3) Case: 3 (User checks shipping information via both Address/BillingInfo)

-- Handles accessing all of the users data
SELECT *
FROM User;

-- Access the Shipping info (ID)
SELECT ShippingID
FROM ShippingInfo
WHERE ShippingID IS NOT NULL;

-- Access the Billing info (ID)
SELECT BillingID
FROM BillingInfo
WHERE BillingID IS NOT NULL;

-- Access all address data
SELECT *
FROM Address;

--4) Case 4: Warehouse availability (to check whether request to publisher should take place or not)

-- Handles accessing all of the users data
SELECT *
FROM User;

-- Accesses the order ID; to obtain data information
SELECT OrderID
FROM Order
WHERE OrderID IS NOT NULL;

-- Accesses the warehouse information
SELECT StorageID, Stock, Threshold
FROM Warehouse
WHERE StorageID IS NOT NULL AND Stock IS NOT NULL And Threshold IS NOT NULL;
