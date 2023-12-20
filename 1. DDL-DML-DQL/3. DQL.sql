--SELECT

SELECT * FROM Users

SELECT FirstName, City FROM Users

--WHERE

SELECT * FROM Users WHERE Id = 2

SELECT * FROM Users WHERE City != 'Los Angeles'

SELECT * FROM Users WHERE Id % 2 <> 0

--ORDER BY

SELECT * FROM Users ORDER BY FirstName

SELECT * FROM Users ORDER BY FirstName DESC

SELECT * FROM Users ORDER BY City, FirstName

SELECT * FROM Users ORDER BY FirstName ASC , LastName DESC


--DISTINCT

SELECT DISTINCT City FROM Users

--TOP Clause

SELECT TOP 3 * FROM Users

SELECT TOP 50 PERCENT * FROM Users

--OFFSET FETCH

SELECT * FROM Users ORDER BY Salary OFFSET 3 ROWS

SELECT * FROM Users ORDER BY Salary 
OFFSET 3 ROWS  
FETCH NEXT 2 ROWS ONLY

--NULL Values

SELECT * FROM Users WHERE Phone IS NULL

SELECT * FROM Users WHERE Phone IS NOT NULL

--Operators

SELECT * FROM Users WHERE City = 'Chicago'
SELECT * FROM Users WHERE City <> 'Chicago'

SELECT * FROM Users WHERE DOB > '1990-04-01'
SELECT * FROM Users WHERE DOB <= '1990-04-01'

--Alias

SELECT FirstName AS 'First Name' FROM Users

SELECT FirstName + ' ' + LastName AS 'Name' FROM Users

SELECT FirstName + FORMAT(DOB, 'yyMMdd') AS 'UserCode' FROM Users

--AND, OR and NOT Operators

SELECT * FROM Users WHERE City = 'New York' AND DOB >= '1990-01-01'
SELECT * FROM Users WHERE City = 'New York' OR City = 'Chicago'
SELECT * FROM Users WHERE DOB >= '1990-01-01' OR City = 'New York'

SELECT * FROM Users WHERE NOT City = 'Chicago'
SELECT * FROM Users WHERE NOT Address='Chicago' AND NOT Address='New York'

--IN Operator

SELECT * FROM Users WHERE AGE IN (25, 30)
SELECT * FROM Users WHERE City IN ('New York', 'Houston', 'Chicago')
SELECT * FROM Users WHERE City NOT IN ('New York', 'Houston', 'Chicago')

--BETWEEN Operator

SELECT * FROM Users WHERE DOB BETWEEN '1990-01-01' AND '2000-01-01'
SELECT * FROM Users WHERE DATEDIFF(year, DOB, GETDATE()) BETWEEN 25 AND 30

SELECT * FROM Users WHERE Salary NOT BETWEEN 25000 AND 30000
SELECT * FROM Users WHERE DOB BETWEEN '1990-01-01' AND '2000-01-01' AND Id NOT IN (1,2,3)

--LIKE Operator

SELECT * FROM Users WHERE LastName LIKE 'Jo%'
SELECT * FROM Users WHERE LastName LIKE '%a%'
SELECT * FROM Users WHERE LastName LIKE '_o%'
SELECT * FROM Users WHERE Phone LIKE '555%'
SELECT * FROM Users WHERE FirstName LIKE '[a-e]%'
SELECT * FROM Users WHERE LastName LIKE 'Jo%' AND DOB >= '1985-01-01'

--GROUP BY

SELECT City, COUNT(*) FROM Users GROUP BY City

SELECT Gender, COUNT(*) FROM Users GROUP BY Gender ORDER BY COUNT(Id) DESC

SELECT Gender, MAX(Salary) FROM Users 
GROUP BY Gender 
ORDER BY MAX(Salary) DESC

SELECT City, Gender, MAX(Salary) FROM Users 
GROUP BY City, Gender 

--SELECT INTO Statement

SELECT * INTO UsersBackup FROM Users

SELECT * INTO UsersHouston FROM Users where City = 'Houston'