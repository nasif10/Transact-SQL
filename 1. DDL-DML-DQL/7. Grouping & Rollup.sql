-- Rollup --

SELECT City, SUM(Salary) FROM Users 
GROUP BY ROLLUP(City) 

SELECT City, Gender, SUM(Salary) FROM Users 
GROUP BY ROLLUP(City, Gender) 

SELECT City, Gender, SUM(Salary) FROM Users 
GROUP BY City, Gender WITH ROLLUP

--

SELECT City, Gender, SUM(Salary), 
       Grouping(City) AS Gr_City,
	   Grouping(Gender) AS Gr_Gender
FROM Users 
GROUP BY City, Gender WITH ROLLUP

--

SELECT 
	CASE WHEN GROUPING(City) = 1 THEN 'All' ELSE City END AS City,
	CASE WHEN GROUPING(Gender) = 1 THEN 'All' ELSE Gender END AS Gender,
    AVG(Salary) 
FROM Users 
GROUP BY ROLLUP(City, Gender) 

-- Cube --

SELECT City, Gender, MAX(Salary) FROM Users 
GROUP BY CUBE(City, Gender) 

-- GROUPING SETS --

SELECT City, Gender, SUM(Salary) AS TotalSalary
FROM Users 
GROUP BY 
GROUPING SETS(
	(City, Gender),
	(City),
	()	
)

-- 

SELECT City, Gender, SUM(Salary) FROM Users 
GROUP BY 
GROUPING SETS(
	(City, Gender),
	(City),
	(Gender),
	()	
)
ORDER BY GROUPING(City), GROUPING(Gender)