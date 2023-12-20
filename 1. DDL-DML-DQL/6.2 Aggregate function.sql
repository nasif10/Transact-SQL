--Aggregate functions

SELECT COUNT(*) FROM Users
SELECT COUNT(Id) FROM Users
SELECT COUNT(City) as NoOfUsers FROM Users 
SELECT COUNT(DISTINCT City) FROM Users
SELECT COUNT(*) FROM Users WHERE FirstName LIKE 'Jo%'

SELECT AVG(Salary) FROM Users
SELECT MIN(Salary) FROM Users
SELECT MAX(Salary) FROM Users
SELECT SUM(TotalPrice) as TotalPrice FROM ORDERS

SELECT MAX(TotalPrice) as 'Max OrderAmount', 
	   MIN(TotalPrice) as 'Min OrderAmount', 
	   AVG(TotalPrice) as 'Average OrderAmount' 
FROM ORDERS

SELECT MIN(datediff(year, DOB, getdate())) FROM Users 
SELECT MAX(datediff(year, DOB, getdate()))-MIN(datediff(year, DOB, getdate())) FROM Users


SELECT YEAR(Created) as Year, SUM(TotalPrice) as SumTotalPrice FROM Orders 
GROUP BY YEAR(Created)

SELECT DATEPART(YEAR, Created) as Year, 
       DATEPART(MONTH, Created) as Month,  
	   COUNT(*) as NoOfOrders
FROM ORDERS
GROUP BY DATEPART(YEAR, Created), DATEPART(MONTH, Created)

SELECT CategoryId, MAX(Price) FROM Products 
GROUP BY CategoryId 
ORDER BY MAX(Price) DESC

SELECT City, Gender, MAX(Salary) FROM Users 
GROUP BY City, Gender 

--Having Clause 

SELECT City, COUNT (*) FROM Users 
GROUP BY City 
HAVING COUNT(*) > 2;