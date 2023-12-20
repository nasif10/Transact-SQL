--UNION 

(SELECT FirstName, City FROM Users WHERE City = 'Los Angeles')
UNION
(SELECT FirstName, City FROM Users WHERE City = 'Chicago')

(SELECT FirstName, City FROM Users WHERE City = 'Los Angeles')
UNION
(SELECT FirstName, City FROM Users WHERE City = 'Los Angeles')

--UNION ALL 

(SELECT FirstName, City FROM Users WHERE City = 'Los Angeles')
UNION ALL
(SELECT FirstName, City FROM Users WHERE City = 'Los Angeles')


--INTERSECT

(SELECT FirstName, City FROM Users WHERE City != 'Los Angeles')       
INTERSECT
(SELECT FirstName, City FROM Users  WHERE City != 'Miami')     


--EXCEPT  

(SELECT FirstName, City FROM Users )
EXCEPT
(SELECT FirstName, City FROM Users WHERE City = 'Los Angeles')