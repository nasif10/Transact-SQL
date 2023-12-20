--String Functions

SELECT LEN(FirstName) FROM Users

SELECT LOWER(FirstName) FROM Users
SELECT UPPER(FirstName) FROM Users

SELECT LEFT(FirstName, 3) FROM Users
SELECT RIGHT(FirstName, 3) FROM Users

SELECT SUBSTRING(FirstName, 1, 3) FROM Users
SELECT CONCAT(FirstName, LastName) AS FullName FROM Users

SELECT ASCII('a')
SELECT CHAR(65)
SELECT CHARINDEX('m', 'Name')

SELECT LTRIM('     Hello')
SELECT REPLICATE('Hello', 5)

SELECT FirstName, LastName, 
       SUBSTRING(Email, 1, 1) + REPLICATE('*', CHARINDEX('@', Email)-1) + 
       SUBSTRING(Email, CHARINDEX('@', Email), len(Email)-CHARINDEX('@', Email)+1)
FROM Users 

--Replace NULL

SELECT FirstName, ISNULL(Salary, -1) FROM Users
SELECT FirstName, ISNULL(Phone, 'No Phone') FROM Users

--Math Functions

SELECT Abs(Price) FROM Products
SELECT CEILING(Price) FROM Products
SELECT FLOOR(Price) FROM Products
SELECT ROUND(Price, 2) FROM Products

SELECT SQUARE(Price) FROM Products
SELECT SQRT(Price) FROM Products
SELECT POWER(Price, 2) FROM Products

SELECT RAND()

--Date Functions

SELECT GETDATE()
SELECT CURRENT_TIMESTAMP
SELECT SYSDATETIME() 

SELECT ISDATE('2023-01-01')
SELECT ISDATE('2023')

SELECT DAY(GETDATE())
SELECT DOB, YEAR(DOB) FROM Users
SELECT DOB, MONTH(DOB) FROM Users
SELECT DOB, DAY(DOB) FROM Users
SELECT DOB, MONTH(DOB) FROM Users

SELECT DOB, DATENAME(year, DOB) FROM Users
SELECT DOB, DATENAME(month, DOB) FROM Users
SELECT DOB, DATENAME(week, DOB) FROM Users
SELECT DOB, DATENAME(day, DOB) FROM Users
SELECT DOB, DATENAME(weekday, DOB) FROM Users

SELECT DOB, DATEPART(year, DOB) FROM Users
SELECT DOB, DATEPART(month, DOB) FROM Users

SELECT DOB, DATEADD(year, 1, DOB) FROM Users
SELECT DOB, DATEADD(month, 2, DOB) FROM Users

SELECT DOB, DATEDIFF(year, DOB, GETDATE()) FROM Users
SELECT DOB, DATEDIFF(month, DOB, GETDATE()) FROM Users

--Advanced Functions

SELECT CAST(25.65 AS int)
SELECT CAST(25.65 AS varchar)
SELECT CAST(DOB AS datetime) FROM Users

SELECT CONVERT(int, 25.65)

SELECT CONVERT(varchar, DOB, 5) from Users
SELECT CONVERT(varchar, DOB, 101) from Users
SELECT CONVERT(varchar, DOB, 103) from Users
SELECT CONVERT(varchar, DOB, 106) from Users

SELECT FORMAT (DOB, 'yyy-MM-dd') as date from Users
SELECT FORMAT (DOB, 'dd/MM/yyyy ') as date from Users
SELECT FORMAT (DOB, 'yyy-MMM-dd') as date from Users
SELECT FORMAT (DOB, 'dd-MMM-yyyy ') as date from Users

--Logical Functions

SELECT FirstName, IIF(Salary > 50000, 'High', 'Low') FROM Users
SELECT FirstName, IIF(Salary > 50000, 'High', 'Low') FROM Users

--STUFF() Function

SELECT STUFF(DOB, 1, 4, 'XXXX') from Users