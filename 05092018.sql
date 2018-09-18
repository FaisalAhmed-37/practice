Create proc spDeleteItem @Itemid Int 
AS 
begin
	begin try
	Delete  item Where Itemid = @Itemid
	end try
	begin catch
		print 'Error here'
	end catch
end
Go 



 
CREATE FUNCTION fnGetNetPrice (@id INT) 
RETURNS MONEY 
AS 
BEGIN 
	DECLARE @netPrice MONEY 
	SELECT @netPrice = price * (1+vat) FROM item  WHERE itemid = @id 
	RETURN @netPrice 
 END 
 GO 

 Create Function fnProductDetails (@itemname varchar(30)) 
 Returns Table 
 AS 
	Return Select * FROM item where itemName=@itemname
 GO


 Create Clustered Index Ix_Item_Name 
 ON T_Item (Itemname)


 Create View vItemDetails 
 AS 
 select i.Name,i.Price from T_Item as i
 GO

 Create trigger trInsertItemRstriction 
 ON T_Item after Insert 
 AS 
 Begin
	

	insert into T_ProductsDetails values('01','Pen','Dhaka')
	
 END 
 GO 
 
 Create proc spTransaction
AS 
begin
	begin try
	begin transaction
	
	commit transaction
	end try
	begin catch
		Rollback 
	end catch
end
Go 


