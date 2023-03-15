--Câu1
	-- Tạo user cho nv1
	CREATE LOGIN nv1 WITH PASSWORD = '80109';
	GO
	-- Tạo user cho nv1
	USE AdventureWorks2008R2;
	CREATE USER nv1 FOR LOGIN admin;
	GO
	-- Tạo user cho nv2
	CREATE LOGIN nv2 WITH PASSWORD = '80109';
	GO
	-- Tạo user cho nv2
	USE AdventureWorks2008R2;
	CREATE USER nv2 FOR LOGIN admin;
	GO
	-- Tạo user cho QL
	CREATE LOGIN QL WITH PASSWORD = '80109';
	GO
	-- Tạo user cho QL
	USE AdventureWorks2008R2;
	CREATE USER QL FOR LOGIN admin;
	GO
--b. Tạo role, phân quyền	
	--Tạo role NHANVIEN
	CREATE ROLE NHANVIEN;
	Role CREATED.

	--Tạo role db_datareader
	CREATE ROLE db_datareader;
	role db_datareader

	---Phân quyền cho role NHANVIEN
	USE AdventureWorks2008R2;
	GRANT SELECT,UPDATE, DELETE ON PersonPhone TO NHANVIEN;
	GO
	-- Phân quyền cho nhân viên QL
	USE AdventureWorks2008R2;
	GRANT SELECT ON PersonPhone  TO db_datareader;
	GRANT SELECT ON Person  TO db_datareader;
	GO
	--Gán role NHANVIEN cho NV1 và NV2
	GRANT NHANVIEN TO NV1, NV2;
	Grant succeeded.
	--Gán role db_datareader cho QL
	GRANT db_datareader TO QL;
	Grant succeeded.
	-- Admin phải có quyền CONTROL trên tất cả các đối tượng trong cơ sở dữ liệu
	USE AdventureWorks2008R2;
	GRANT CONTROL TO [Admin];
	GO

--Câu2 
--a
	alter database AdventureWorks2008R2
	set recovery full

	backup database AdventureWorks2008R2
	to disk = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\adventure-works-2008r2-oltp.bak'

--b
	delete Purchasing.PurchaseOrderDetail
	backup database AdventureWorks2008R2
	to disk = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\adventure-works-2008r2-oltp.bak'
	with differential 

--c
	select*from Person.PersonPhone where BusinessEntityID = 0119
	insert into Person.PersonPhone values(0119, '161102' , 2 ,getdate())

	backup log AdventureWorks2008R2
	to disk = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\adventure-works-2008r2-oltp.bak'

--d
	use master
	drop database AdventureWorks2008R2

	restore database AdventureWorks2008R2
	from disk = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\Backup\adventure-works-2008r2-oltp.bak'
	with file = 1, replace , norecovery