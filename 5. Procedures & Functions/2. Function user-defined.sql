--Function without parameters

CREATE FUNCTION GetUserCount()
RETURNS int
AS
BEGIN
    DECLARE @usrCount int;
    SELECT @usrCount = COUNT(*) FROM Users;
    RETURN @usrCount;
END

--
SELECT dbo.GetUserCount()

--
BEGIN
    DECLARE @count int
    SET @totaCount = dbo.GetEmployeeCount()
    PRINT @count
END

--Scalar Function with parameters

CREATE FUNCTION GetUserFullName (@UserId INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @FullName NVARCHAR(100)
    
    SELECT @FullName = FirstName + ' ' + LastName
    FROM Users
    WHERE Id = @UserId

    RETURN @FullName
END;

SELECT dbo.GetUserFullName(2)

--

CREATE FUNCTION GetProductCountByCategory (@catId int)
RETURNS int
BEGIN
    DECLARE @totalCount int
    SET @totalCount = (SELECT Count(*) FROM Products WHERE CategoryId = @catId)
    RETURN @totalCount
END

SELECT dbo.GetProductCountByCategory(1)


--Inline table valued functions

CREATE FUNCTION GetProductsByCategory (@catId int)
RETURNS TABLE
AS
RETURN (SELECT * FROM Products WHERE CategoryId = @catId)


SELECT * FROM dbo.GetProductsByCategory(2)
SELECT * FROM dbo.GetProductsByCategory(2) ORDER BY Price


--Multi statement table valued functions

CREATE FUNCTION mstvGetUsrByCity (@c varchar(50))
RETURNS @usrTable TABLE (id int, name varchar(50), email varchar(50))
BEGIN
    INSERT INTO @usrTable
    SELECT Id, FirstName, Email FROM Users WHERE City = @c
    RETURN
END

SELECT * FROM dbo.mstvGetUsrByCity('Los Angeles')