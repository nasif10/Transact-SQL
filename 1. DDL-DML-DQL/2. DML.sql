--INSERT

INSERT INTO Users (FirstName, LastName, Email, Phone, DOB, Gender, City, Salary) VALUES 
('John', 'Doe', 'john.doe@email.com', '123-456-7890', '1990-01-15', 'M', 'New York', 50000.00),
('Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '1985-03-22', 'F', 'Los Angeles', 25000.50),
('Mike', 'Johnson', 'mike.johnson@email.com', '555-123-7890', '1995-07-10', 'M', 'Chicago', 55000.75),
('Emily', 'Davis', 'emily.davis@email.com', NULL, '1988-12-05', 'F', 'Los Angeles', 80000.00),
('Amanda', 'Roberts', 'amanda.roberts@email.com', '111-222-3333', '1998-11-27', 'F', 'Miami', 62000.75);
('Alex', 'Miller', 'alex.miller@email.com', '777-888-9999', '1992-04-30', 'M', 'Miami', 70000.00);


--UPDATE

UPDATE Users set City = 'Miami' where Id = 2

UPDATE Users SET City = 'Houston', Phone = '555-2234' WHERE Id = 1;

UPDATE Users set City = 'Houston' where Id = 1 or Id = 3

UPDATE Users set Phone = '555-1111'    


--DELETE

DELETE FROM Users where Id = 2

DELETE FROM Users WHERE FirstName = 'Jane'

DELETE FROM Users