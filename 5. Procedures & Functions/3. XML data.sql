CREATE PROCEDURE InsertProductXML
@xmlData XML
AS
BEGIN
    INSERT INTO Products (CategoryId, Name, Description, Price)
    SELECT
        Product.value('(CategoryId)[1]', 'INT') AS CategoryId,
        Product.value('(Name)[1]', 'NVARCHAR(50)') AS Name,
        Product.value('(Description)[1]', 'NVARCHAR(50)') AS Description,
        Product.value('(Price)[1]', 'DECIMAL(8,2)') AS Price
    FROM @xmlData.nodes('/Products/Product') AS Products(Product)
END;

--

DECLARE @xmlData Xml 
SET @xmlData =
'
<Products>
  <Product>
    <Name>Product 4</Name>
	<CategoryId>1</CategoryId>
    <Description>Description for Product 4</Description>
    <Price>40.00</Price>
  </Product>
  <Product>
    <Name>Product 5</Name>
	<CategoryId>1</CategoryId>
    <Description>Description for Product 5</Description>
    <Price>50.00</Price>
  </Product>
</Products>
'
--

EXEC InsertProductXML @xmlData

