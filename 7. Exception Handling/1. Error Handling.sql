--Raise Error

UPDATE Users set City = 'Houston' where Id = 0
IF @@ROWCOUNT<1
    RAISERROR ('User not found', 16, 0)

UPDATE Users set City = 'Houston' where Id = 0
IF @@ROWCOUNT<1
    THROW 50001, 'User not found', 1  


--TRY CATCH Block

BEGIN TRY    
    SELECT 1/0;  
END TRY  

BEGIN CATCH   
    SELECT ERROR_MESSAGE();
END CATCH;  

--

BEGIN TRY    
    UPDATE Users set DOB = '2008-01-32' where Id = 1; 
END TRY  

BEGIN CATCH   
    SELECT ERROR_MESSAGE(), 
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine;
END CATCH;  