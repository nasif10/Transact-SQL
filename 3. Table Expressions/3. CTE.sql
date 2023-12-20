--Derived tables

SELECT City, Total FROM (
    SELECT City, COUNT(*) AS Total FROM Users WHERE City IS NOT NULL 
    GROUP BY City
) AS UserCountByCity


--Common Table Expressions

WITH UserCountByCityCTE
AS (
    SELECT City, COUNT(*) AS Total FROM Users WHERE City IS NOT NULL 
    GROUP BY City
)
SELECT City, Total FROM UserCountByCityCTE

--
SELECT City, Total FROM UserCountByCityCTE WHERE Total >= 2

--

WITH AvgSalaryPerCityCTE AS (
    SELECT City, AVG(Salary) AS AvgSalary
    FROM Users
    WHERE Salary IS NOT NULL
    GROUP BY City
)
SELECT City, AvgSalary
FROM AvgSalaryPerCityCTE
ORDER BY AvgSalary DESC;

--

WITH ProductSalesCTE AS (
    SELECT p.Id AS ProductId, p.Name AS ProductName, p.CategoryId, SUM(oi.Quantity) AS TotalQtySold
    FROM Products p
    LEFT JOIN OrderItems oi ON p.Id = oi.ProductId
    GROUP BY p.Id, p.Name, p.CategoryId
)
SELECT ps.ProductId, ps.ProductName, c.Name AS CategoryName, ps.TotalQtySold
FROM ProductSalesCTE ps
JOIN Categories c ON ps.CategoryId = c.Id;