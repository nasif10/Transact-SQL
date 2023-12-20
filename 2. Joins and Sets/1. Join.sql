SELECT * FROM Products, Categories
WHERE Products.CategoryId = Categories.Id

SELECT * FROM Products JOIN Categories
ON Products.CategoryId = Categories.Id

--INNER JOIN

SELECT * FROM Products INNER JOIN Categories
ON Products.CategoryId = Categories.Id

SELECT * FROM ORDERS INNER JOIN Users
ON ORDERS.UserId = Users.Id

SELECT o.Id, oi.Quantity, p.Name, c.Name
FROM Orders o
INNER JOIN OrderItems oi ON o.Id = oi.OrderId
INNER JOIN Products p ON oi.ProductId = p.Id
INNER JOIN Categories c ON p.CategoryId = c.Id;


--LEFT JOIN

SELECT * FROM Products LEFT JOIN Categories
ON Products.CategoryId = Categories.Id

SELECT * FROM ORDERS LEFT JOIN Users
ON ORDERS.UserId = Users.Id

--RIGHT JOIN

SELECT * FROM Products RIGHT JOIN Categories
ON Products.CategoryId = Categories.Id

SELECT * FROM ORDERS RIGHT JOIN Users
ON ORDERS.UserId = Users.Id

--FULL JOIN

SELECT * FROM Products FULL JOIN Categories
ON Products.CategoryId = Categories.Id

SELECT * FROM ORDERS FULL JOIN Users
ON ORDERS.UserId = Users.Id

-- -- --

CREATE TABLE #emp
(
Id int IDENTITY(1,1) PRIMARY KEY,
name varchar(50) NOT NULL,
salary int NOT NULL,
managerId int
)

INSERT INTO #emp (name, salary, managerId) VALUES 
('John', 20000, NULL),('Bob', 50000, NULL),('William',30000, 2),('Emily', 25000, 2),('David',  60000, 1)

--Self JOIN 

SELECT e1.name as 'Employee Name', e2.name as 'Manager Name'
FROM #emp e1 LEFT JOIN #emp e2
ON 	e1.managerId = e2.Id

--Replace NULL

SELECT e1.name as 'Employee Name', ISNULL(e2.name, 'No Manager')  as 'Manager Name'
FROM #emp e1 INNER JOIN #emp e2
ON 	e1.managerId = e2.Id


--JOIN Condition--
		
SELECT u.Id, u.FirstName, o.TotalPrice
FROM Users u INNER JOIN Orders o
ON u.Id = o.UserId
ORDER BY o.TotalPrice

--WHERE

SELECT u.FirstName, u.LastName, o.TotalPrice
FROM Users u
LEFT JOIN Orders o ON u.Id = o.UserId
WHERE o.TotalPrice > 1000;

SELECT u.FirstName, u.LastName, o.TotalPrice, o.Created FROM 
Users u INNER JOIN Orders o 
ON u.Id = o.UserId
WHERE u.Id = 1 AND o.Created BETWEEN '2023-01-01' AND '2023-12-31';


--AGGREGATE Function

SELECT u.Id, COUNT(o.Id) as OrderCount
FROM Users u
INNER JOIN Orders o ON u.Id = o.UserId
GROUP BY u.Id
ORDER BY OrderCount DESC;

SELECT u.Id, u.FirstName, u.LastName, YEAR(o.Created) as OrderYear, SUM(o.TotalPrice) as TotalSum
FROM Users u
INNER JOIN Orders o ON u.Id = o.UserId
WHERE u.Id = 1 AND YEAR(o.Created) = 2023
GROUP BY u.Id, u.FirstName, u.LastName, YEAR(o.Created);

SELECT u.Id, u.FirstName, u.LastName, YEAR(o.Created) as OrderYear, SUM(o.TotalPrice) as TotalSum
FROM Users u
INNER JOIN Orders o ON u.Id = o.UserId
GROUP BY u.Id, u.FirstName, u.LastName, YEAR(o.Created)
HAVING SUM(o.TotalPrice) > 1000;

