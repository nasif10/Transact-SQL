--Scalar subquery
	 
SELECT * FROM Products 
WHERE Price = (SELECT MAX(Price) FROM Products)

SELECT * FROM Products 
WHERE Price < (SELECT AVG(Price) FROM Products)

SELECT * FROM Products 
WHERE Price > (SELECT AVG(Price) + 10 FROM Products)

SELECT * FROM Products 
WHERE CategoryId = (SELECT Id FROM Categories WHERE Name ='Category 1')

UPDATE Products SET Price = Price * 1.25
WHERE Id IN (SELECT DISTINCT ProductId FROM OrderItems )


--Multi valued Subquery

SELECT * FROM Products 
WHERE Id IN (SELECT Id FROM PRODUCTS WHERE Price <= 20)

SELECT * FROM Products
WHERE Id NOT IN (SELECT DISTINCT ProductId FROM OrderItems)

SELECT * FROM Users 
WHERE Id IN (SELECT Id FROM Users WHERE City ='Los Angeles')	  

--Correlated Subquery

SELECT * FROM Products WHERE Price >
(SELECT AVG(Price) FROM Products WHERE CategoryId = Products.CategoryId )

SELECT c.Name, 
(SELECT COUNT(*) FROM Products p WHERE p.CategoryId = c.Id) AS TotalProducts
FROM Categories c


--ANY operator

SELECT * FROM Products WHERE Price < 
ANY (SELECT Price FROM Products WHERE Name ='Product 1' OR Name ='Product 2')

SELECT * FROM Products
WHERE Price > ANY (SELECT Price FROM Products WHERE CategoryId = 1)


--ALL operator

SELECT * FROM Products WHERE Price < 
ALL (SELECT Price FROM Products WHERE Name ='Product 1' OR Name ='Product 2')

SELECT * FROM Products
WHERE Price > ALL (SELECT Price FROM Products WHERE CategoryId = 1)

--EXISTS operator

SELECT * FROM Users WHERE EXISTS
(SELECT UserId FROM Orders WHERE Orders.UserId = Users.Id)
