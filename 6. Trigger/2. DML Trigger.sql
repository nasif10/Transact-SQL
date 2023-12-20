-- AFTER triggers

--Insert
DROP TRIGGER tr_order_insert;

CREATE TRIGGER tr_Category_insert
ON Categories
AFTER INSERT
as
begin
	select * from inserted
end


CREATE TRIGGER tr_product_insert
ON Products
AFTER INSERT
as
begin
	DECLARE @pid INT
    SELECT @pid = inserted.Id FROM inserted

    PRINT 'New product has been inserted. Order ID: ' + CAST(@pid AS VARCHAR(10))
end


--Update

CREATE TRIGGER tr_product_update
ON Products
after update
as
begin
	select * from deleted
	select * from inserted
end

--
UPDATE Products set Price = 30.50 where Id = 3

--Delete

CREATE TRIGGER tr_product_delete
ON Products
after delete
as
begin
	select * from deleted
end

--Rollback

CREATE TRIGGER tr_user_delete_rollback
ON Users
for delete
as
begin
	Rollback
	print 'You can not delete record';
end

--
CREATE TRIGGER tr_prevent_category_delete
ON Categories
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM Products WHERE CategoryId IN (SELECT Id FROM deleted)) > 0
		RAISERROR('Cannot delete category with associated products.', 16, 1);
    ELSE
		DELETE FROM Categories WHERE Id IN (SELECT Id FROM deleted);
END;


-- Copy table

CREATE TABLE OrderLog
(
 Id int IDENTITY(1,1),
 LogMsg varchar(max),
 LogDate DATETIME
)

--For insert

CREATE TRIGGER tr_order_insert_log
ON Orders
after insert
as
begin
	Declare @oid int
	SELECT @oid = id from inserted
	
	INSERT INTO OrderLog(LogMsg, LogDate) VALUES 
	('Order Id '+ Cast(@oid as varchar(10)) + ' is added', GETDATE())
end


INSERT INTO ORDERS VALUES ('Arif', 'Male',10, 3000)
SELECT * FROM OrderLog


--For update

CREATE TRIGGER tr_order_update_log
ON Orders
after update
as
begin
	Declare @id int
	Declare @old_uid int, @new_uid int
	Declare @old_tp decimal (8, 2), @new_tp decimal (8, 2)
	Declare @old_created datetime, @new_created datetime

	Declare @log varchar(100)
	set @log = ''

	select @id = Id,
	       @new_uid = UserId,
		   @new_tp = TotalPrice,
		   @new_created = Created
		   
	from inserted

	select @old_uid = UserId,
		   @old_tp = TotalPrice,
		   @old_created = Created
	from deleted
	
	if @old_uid != @new_uid
		set @log = @log + 'User ID changed from ' + 
		convert(varchar, @old_uid) + ' to ' + convert(varchar, @new_uid) + '; '

    if @old_tp != @new_tp
		set @log = @log + 'Order amount changed from ' + 
		convert(varchar, @old_tp, 1) + ' to ' + convert(varchar, @new_tp, 1) + '; '

	if @old_created != @new_created
		set @log = @log + 'Order date changed from ' + 
		convert(varchar, @old_created, 101) + ' to ' + convert(varchar, @new_created, 101) + '; '

	if len(@log) > 0
		insert into OrderLog values('Order ' + convert(varchar, @id) + ' : ' + @log, GETDATE())

end


--For delete

CREATE TRIGGER tr_order_delete_log
ON Orders
after delete
as
begin
	Declare @id int
	SELECT @id = id from deleted
	
	INSERT INTO OrderLog VALUES ('Order Id '+ Cast(@id as varchar(50)) + ' is deleted' , GETDATE())
end