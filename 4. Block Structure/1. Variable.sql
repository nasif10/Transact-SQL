BEGIN
	PRINT 'Hello TSQL!';
END

--Declare variables

DECLARE @name VARCHAR(10);
SET @name = 'ABC'
print @name

--
DECLARE @name VARCHAR(10) = 'Alex'
SELECT * FROM Users WHERE FirstName = @name

--

BEGIN
	DECLARE @name VARCHAR(20) = 'John';
    DECLARE @age int = 30;
    print @name + ' ' +CAST(@age AS VARCHAR)
END

BEGIN
	DECLARE @name VARCHAR(20);
    DECLARE @age int;

    SELECT @name = FirstName, @age = DATEDIFF(YEAR, DOB, GETDATE()) FROM Users WHERE Id = 1;
    print @name + ' ' +CAST(@age AS VARCHAR)
END

