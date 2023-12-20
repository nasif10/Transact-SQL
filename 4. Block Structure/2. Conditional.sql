DECLARE 
    @num int = 10;
BEGIN
    if @num > 5
        PRINT 'Greater Than 5';
END

--

DECLARE 
    @num int = 10;
BEGIN
    if (@num % 2) = 0
        print 'Even';
    else
        print 'Odd';
END

--

BEGIN
    SELECT Id, FirstName, Salary,
        CASE 
            WHEN Salary > 50000 THEN 'High'
            WHEN Salary > 30000 THEN 'Medium'
            ELSE 'Low'
        END AS SalaryRange
    FROM Users
END

--

-- Variables
DECLARE @UserId INT = 1;
DECLARE @NewSalary DECIMAL(8, 2) = 50000.00;

BEGIN
IF EXISTS (SELECT 1 FROM Users WHERE Id = @UserId)
	BEGIN
		UPDATE Users
		SET Salary = @NewSalary
		WHERE Id = @UserId;

		PRINT 'User salary updated successfully.';
	END
ELSE
	BEGIN
		PRINT 'User not found. Salary update failed.';
	END;
END;