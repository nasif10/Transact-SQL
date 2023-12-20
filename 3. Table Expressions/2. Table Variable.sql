DECLARE @varUsers TABLE (
    Id int,
    name VARCHAR(50),
    age int
);

INSERT INTO @varUsers (Id, name, age)
VALUES (1, 'A', 30), (2, 'B', 25);

SELECT * FROM @varUsers
SELECT Id, name FROM @varUsers

--  --  --

DECLARE @var_ProCountByCat TABLE (
    CatId int,
    Total int
);

INSERT @var_ProCountByCat
SELECT c.Id, COUNT(*)
FROM Categories c
LEFT JOIN Products p ON c.Id = p.CategoryId
GROUP BY c.Id;

SELECT CatId, Total FROM @var_ProCountByCat