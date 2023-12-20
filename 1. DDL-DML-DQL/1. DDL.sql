CREATE DATABASE ComDb
USE ComDb

ALTER database ComDb modify Name = EComDb

Use EComDb
GO

--Drop Database
DROP DATABASE EComDb

--Create a new table
CREATE TABLE Users
(
  Id int PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  Phone varchar(11) NULL,
  City varchar(50) NULL,
  AreaCode int NULL
)


INSERT INTO Users (Id, FirstName, LastName, Email, Phone, City, AreaCode) VALUES 
(1, 'John', 'Doe', 'johndoe@example.com', '555-555-1234', 'New York', 212);

SELECT * FROM Users

--Drop Table
DROP TABLE Users


--Rename table
sp_rename 'Users', 'Users1';

--Add Column
ALTER TABLE Users 
ADD UserSince date

--Modify Column
ALTER TABLE Users
ALTER COLUMN UserSince datetime

--DROP Column
ALTER TABLE Users
DROP COLUMN UserSince

--TRUNCATE Table 
TRUNCATE TABLE Users


--Temporary tables

CREATE TABLE #Person (
  Id int,
  name VARCHAR(MAX),
  age int
);

INSERT INTO #Person VALUES 
(1, 'John', 'johndoe@example.com'), 
(2, 'Alice', 'alicejohnson@example.com');

SELECT * FROM #Person
