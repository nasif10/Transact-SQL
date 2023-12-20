CREATE PROCEDURE GetProducts
AS
SELECT * FROM Products;

--Execute Procedure

EXEC GetProducts

GetProducts


-- Procedure with input parameters

CREATE PROCEDURE GetProductsByCategoty
@cid int 
AS
SELECT * FROM Products WHERE CategoryId = @cid;

EXEC GetProductsByCategoty 2


CREATE PROCEDURE GetUsersByCityAndGender
@city varchar(20),
@gender varchar(1)
AS
SELECT * FROM Users WHERE City = @city AND Gender = @gender;

EXEC GetUsersByCityAndGender 'Miami', 'M'
EXEC GetUsersByCityAndGender @city='Miami', @gender='F'


-- ALTER Procedure

ALTER PROCEDURE GetProductsByCategoty
@cid int = NULL
AS
IF @cid IS NULL
    SELECT * FROM Products
ELSE    
    SELECT * FROM Products WHERE CategoryId = @cid

EXEC GetProductsByCategoty 1


-- Procedure with output parameters

CREATE PROCEDURE UserCountByCity
@city varchar(20),
@cCount int OUTPUT
AS
SELECT @cCount = Count(*) FROM Users WHERE City = @city;

DECLARE @count int
EXEC UserCountByCity 'New York', @count OUTPUT
PRINT @count


-- Procedure with return values

CREATE PROCEDURE ReturnUserCountByCity
@city varchar(20)
AS
Return (SELECT Count(*) FROM Users WHERE City = @city)

DECLARE @count int
EXEC @count = ReturnUserCountByCity 'Miami'
PRINT @count