USE [customerdb]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 12/1/2022 1:12:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[UserId] [varchar](20) NOT NULL,
	[EmployeeRole] [varchar](10) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

insert into Employee (FirstName,LastName,UserId,EmployeeRole,DepartmentId,Salary) values('John','Green','John.G@abc.com','Manager',1,1000)

CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsSelected] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

Insert into Department values('IT',0)
Insert into Department values('HR',0)
Insert into Department values('Marketing',0)

CREATE TABLE [dbo].[Customer](
	[Id] [int] NOT NULL,
	[FirstName] [nchar](10) NOT NULL,
	[LastName] [nchar](10) NOT NULL,
	[Age] [int] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

insert into Customer values(1,'James', 'Halpert',35)

create or alter view viewEmployeeDepartment as 
 select Employee.EmployeeId, Employee.FirstName,Employee.LastName,Employee.EmployeeRole,Department.Name as Department from Department
 join Employee on Employee.DepartmentId=Department.Id

create or alter procedure [dbo].[spGroupCustomerByAge]
as
select count(*) as 'Number of Customer', Age from Customer
group by Age

create table Expenditure
(
 Id int identity not null,
 CountryName varchar(10),
 OrderYear int,
 Amount int
 )

 insert into Expenditure values('India', 2011, 2000)
 insert into Expenditure values('India', 2012, 5500)
 insert into Expenditure values('India', 2013, 5600)
 insert into Expenditure values('UK', 2011, 8000)
 insert into Expenditure values('UK', 2012, 5600)
 insert into Expenditure values('UK', 2013, 4100)
 insert into Expenditure values('China', 2011, 5000)
 insert into Expenditure values('China', 2012, 5100)
 insert into Expenditure values('China', 2013, 2000)

