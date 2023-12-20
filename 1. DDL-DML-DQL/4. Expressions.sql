--CASE Statement

SELECT FirstName,
CASE
	WHEN Salary < 50000 THEN 'Grade 2'
	WHEN Salary >= 50000 THEN 'Grade 1'
END
FROM Users



SELECT FirstName, LastName, DOB,
CASE
	WHEN DATEDIFF(YEAR, DOB, GETDATE()) < 18 THEN 'Minor'
    WHEN DATEDIFF(YEAR, DOB, GETDATE()) BETWEEN 18 AND 50 THEN 'Adult'
    ELSE 'Senior'
END AS AgeGroup
FROM Users;

--

UPDATE Products
SET Price = CASE
	WHEN CategoryId = 1 THEN Price * 1.1
    WHEN CategoryId = 2 THEN Price * 0.9
    ELSE Price
END;


--NULLIF

SELECT NULLIF(Phone, 'N/A') AS UpdatedPhone FROM Users;

SELECT NULLIF(Salary, 0.00) AS UpdatedSalary FROM Users;

--COALESCE 

SELECT FirstName, LastName, COALESCE(Phone, 'N/A') AS Phone FROM Users;

SELECT FirstName, LastName, COALESCE(Salary, 0.00) AS Salary FROM Users;

