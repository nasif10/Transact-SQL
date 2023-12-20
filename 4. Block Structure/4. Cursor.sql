DECLARE @uid int
DECLARE @uname varchar(50)

DECLARE c_usr CURSOR FOR 
  SELECT id, FirstName FROM Users;

OPEN c_usr

FETCH NEXT FROM c_usr INTO @uid, @uname
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'ID : ' + CAST(@uid as varchar) + ' Name : ' + @uname
    FETCH NEXT FROM c_usr INTO @uid, @uname
END

CLOSE c_usr;
DEALLOCATE c_usr;


--  --  --


DECLARE @uid int
DECLARE @usalary varchar(30)

DECLARE c_usrSalIncrease CURSOR FOR 
    SELECT id, Salary FROM Users;

OPEN c_usrSalIncrease

FETCH NEXT FROM c_usrSalIncrease INTO @uid, @usalary
WHILE @@FETCH_STATUS = 0
BEGIN
    if(@usalary < CAST(50000 as decimal(10,2)))
    UPDATE Users set Salary = Salary * 1.1 WHERE Id = @uid

    FETCH NEXT FROM c_usrSalIncrease INTO @uid, @usalary
END

CLOSE c_usrSalIncrease
DEALLOCATE c_usrSalIncrease