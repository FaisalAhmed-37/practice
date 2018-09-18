Create Database StudentInformation
go
use StudentInformation
go

create table StudentDB
(
id int identity (1,1) primary key not null,
Name varchar (50) not null,
[Address] varchar (100) not null,
PhoneNo varchar (20) not null unique
)




--------Data Source=DESKTOP-SLFRI6N;Initial Catalog=StudentInformation;User ID=sa;Password=cogent





