CREATE VIEW UserDetailsView AS
SELECT Id, FirstName + ' ' +LastName AS FullName, Email, Phone, DOB, Gender, City
FROM Users;

SELECT * FROM UserDetailsView

DROP VIEW UserDetailsView

--

CREATE VIEW UserCitySummaryView AS
SELECT City, COUNT(Id) AS UserCount, AVG(Salary) AS AvgSalary
FROM Users
GROUP BY City;

--

CREATE VIEW CategoryWiseProductCountView AS
SELECT c.Id, c.Name, COUNT(p.Id) AS ProductCount
FROM Categories c
LEFT JOIN Products p ON c.Id = p.CategoryId
GROUP BY c.Id, c.Name;

--

CREATE VIEW RecentOrdersView AS
SELECT Id, UserId, TotalPrice, Created
FROM Orders
WHERE DATEDIFF(DAY, Created, GETDATE()) <= 7;


SELECT * FROM RecentOrdersView
