create view vw_Employee
As
select * from T_Employee



Create clustered index ixProject 
ON employees (empid) 


create Proc spSomthing
As
Begin
		Begin try
		select * from T_Employee
		end try
		begin catch
		
		end catch
end


Create Function fnFindPayrate (@id int) 
Returns int 
AS 
Begin 
declare @id int
 select @id=max(empID) from T_Employee
 return @id
END 


Create Function fnFindTable ()
 Returns TABLE
  AS 
  RETURN 
  select* from  T_Employee
 


 Create Trigger trRestrict 
 ON Employees 
 After  insert  
 As 
 BEGIN 
 declare @id int
	Insert into T_Depertment values(@id,'IT')  
  END 