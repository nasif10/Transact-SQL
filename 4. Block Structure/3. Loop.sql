BEGIN
    DECLARE @num int = 1,
    @firstName VARCHAR(20);

    WHILE @num <= 5 
    BEGIN
        SELECT @firstName = FirstName FROM Users 
        WHERE Id =  @num;

        PRINT @firstName;
        SET @num += 1;
    END
END

--

DECLARE 
    @i int = 1;
BEGIN   
    WHILE (@i <= 10)
    BEGIN
        IF (@i = 6)
        BEGIN
            BREAK;
        END
        
        PRINT 'The value of i is: ' + CAST(@i AS varchar);
        SET @i = @i + 1;
    END
END

--

DECLARE @i INT = 1;
DECLARE @numUsers INT;

SELECT @numUsers = COUNT(*) FROM Users;

WHILE @i <= @numUsers
BEGIN
    DECLARE @currentCity VARCHAR(50);

    SELECT @currentCity = City FROM Users WHERE Id = @i;

    IF @currentCity = 'Los Angeles'
    BEGIN
        UPDATE Users
        SET Salary = Salary + Salary * 0.002
        WHERE Id = @i;
    END

    SET @i += 1;
END
