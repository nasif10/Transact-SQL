--PRIMARY KEY

CREATE TABLE Users
(
  Id int  IDENTITY(1,1) PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName  varchar(50) NOT NULL,
  Email     varchar(50) NOT NULL,
  Phone     varchar(12) NULL,
  DOB       date        NOT NULL,
  Gender    varchar(1)  NULL,
  City      varchar(50) NULL,
  Salary    decimal (8, 2),
)

--PRIMARY KEY

ALTER TABLE Users
ADD PRIMARY KEY (Id);

ALTER TABLE ORDERS
ADD PRIMARY KEY (OrderId);

--PRIMARY KEY On Multiple columns

ALTER TABLE Users
ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (Id, Email)

--DROP PRIMARY KEY Constraint

ALTER TABLE Persons
DROP CONSTRAINT PK_CustomerId;

--FOREIGN KEY

ALTER TABLE ORDERS
ADD FOREIGN KEY (Id) REFERENCES Users(Id);

--UNIQUE 

ALTER TABLE Users
ADD CONSTRAINT UQ_email UNIQUE(Email)

--DROP UNIQUE Constraint

ALTER TABLE Users
DROP CONSTRAINT UQ_Email

--CHECK Constraint

ALTER TABLE Users
ADD CONSTRAINT CK_CustomerNumber CHECK(CustomerNumber>1000)

--DEFAULT Constraint

ALTER TABLE Users
ADD CONSTRAINT df_City
DEFAULT 'New York' FOR City;

--DROP DEFAULT Constraint

ALTER TABLE Users
ALTER COLUMN City DROP DEFAULT;

--Cascading Referential Integrity Constraint

ALTER TABLE ORDERS
ADD FOREIGN KEY (Id) REFERENCES Users (Id);
ON DELETE CASCADE 
ON UPDATE CASCADE

ALTER TABLE ORDERS
ADD FOREIGN KEY (Id) REFERENCES Users (Id);
ON DELETE SET NULL
ON UPDATE SET NULL

--

CREATE TABLE Users
(
  Id        int IDENTITY(1,1) PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName  varchar(50) NOT NULL,
  Email     varchar(50) NOT NULL UNIQUE,
  Phone     varchar(12) NULL,
  DOB       datetime    NOT NULL CHECK (YEAR(DOB) > 1990),
  Gender    varchar(1)  NULL,
  City      varchar(50) DEFAULT 'New York',
  Created   DATETIME    DEFAULT GETDATE()
)