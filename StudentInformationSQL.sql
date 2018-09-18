Create database PersonalInformation
GO
Use PersonalInformation
GO
create table StudentDB
(
ID varchar (30) primary key not null,
Name varchar (50) not null,
PhoneNO varchar (30) not null unique,
BloodGroup varchar (20),
DOB Datetime 
)
GO

select * from StudentDB

create table T_BloodGroup
(
BGID int identity primary key not null,
BloodGroup varchar (10)
)
