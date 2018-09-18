USE AdventureWorks2012
GO

----Question 1. : Use AdventureWorks2012 And Create a stored procedure
-- to insert data into EmployeePayHistory. Use Try…Catch construct-----
---ANSWER::----

CREATE PROC spInsertDataOnEmployeePayHistory
@bId int,
@rcd datetime,
@r money,
@pf tinyint,
@md datetime
AS

BEGIN TRY
INSERT INTO HumanResources.EmployeePayHistory
 VALUES
 (@bId,@rcd,@r,@pf,@md)
END TRY

BEGIN CATCH
RAISERROR('ERROR ON %SD',16,1)
END CATCH 
GO


--TESTING PROCDURES--
EXEC spInsertDataOnEmployeePayHistory 5,'6-6-2017',123.50,2,'8-5-2018'
GO

----Question 2. : Use AdventureWorks2012 And Create a SCALAR FUNCTION 
--to get login ID from National ID.-----
---ANSWER::----


CREATE FUNCTION fnGetLogInID(@nid NVARCHAR(15))
RETURNS NVARCHAR(256)
AS

BEGIN
DECLARE @lid NVARCHAR(256)
SELECT @lid = loginid 
FROM HumanResources.Employee
WHERE NationalIDNumber = @nid 
RETURN @lid
END
GO

--TESTING SCALAR FUNCTION--
SELECT dbo.fnGetLogInID ('879342154') 
AS 'LOG IN ID'
GO

----Question 3. : Use AdventureWorks2012 And Create a TABLE-VALUED function
-- to find information of last and first name person from -----
---ANSWER::----

CREATE FUNCTION fnFindPersonInfo(@bid INT)
RETURNS TABLE
AS

RETURN
(
SELECT FirstName, LastName
 FROM Person.Person
WHERE BusinessEntityID = @bid
)
GO

--TESTING TABLE-VALUED FUNCTION--

SELECT * FROM dbo.fnFindPersonInfo(56)
GO

----Question 4. : Use AdventureWorks2012 And Create a Trigger on ProductInventory 
--to protect reducing stock 50% or more at once. -----
---ANSWER::----

CREATE TRIGGER trUpdateProductInventory
ON Production.ProductInventory
AFTER UPDATE
AS

DECLARE @oq INT, @nq INT
SELECT @oq = Quantity 
FROM deleted
SELECT @nq = Quantity 
FROM inserted
IF @nq <=@oq/2

BEGIN
RAISERROR('Can not reduce stock fifty persent or more',16,1)
ROLLBACK
END
GO

--TESTING Trigger--

UPDATE Production.ProductInventory
SET Quantity = 100
WHERE ProductID IN(1,2,3)
GO

--DROP Trigger dbo.trUpdateProductInventory

--SELECT * FROM Production.ProductInventory