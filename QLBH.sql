CREATE DATABASE QLBH
ON PRIMARY
(NAME= QLBH_data1, FILENAME = 'D:\CSDL\QLBH\QLBH_data1.mdf', 
	SIZE = 10, MAXSIZE = 50, FILEGROWTH= 15%),
(NAME= QLBH_data2, FILENAME = 'D:\CSDL\QLBH\QLBH_data2.ndf', 
	SIZE = 10, MAXSIZE = 50, FILEGROWTH= 15%),
FILEGROUP QLBHGroup1
( NAME = QLBH_data3, FILENAME= 'D:\CSDL\QLBH\QLBH_data3.ndf',
	SIZE = 10, MAXSIZE = 50, FILEGROWTH = 5),
( NAME = QLBH_data4, FILENAME = 'D:\CSDL\QLBH\QLBH_data4.ndf',
	SIZE = 10, MAXSIZE = 50, FILEGROWTH = 5 )
LOG ON
( NAME = 'QLBH_log', 
	FILENAME = 'D:\CSDL\QLBH\QLBH_log.ldf',
	SIZE = 10,
	MAXSIZE = 50, 
	FILEGROWTH = 5)
	GO

use QLBH

GO

sp_helpdb

GO

ALTER DATABASE QLBH ADD FILEGROUP QLBHGroup_demo20250119

GO
sp_helpdb QLBH

ALTER DATABASE QLBH
MODIFY FILE (NAME = 'QLBH_log', size =10MB)

GO

ALTER DATABASE QLBH
ADD File (Name =QLBH_data5,
Filename ='D:\CSDL\QLBH\QLBH_data5.mdf',
SIZE =10 MB,
Maxsize =20MB)


ALTER DATABASE QLBH
ADD FILE (QLBH_data5) TO FILEGROUP QLBHGroup_demo20250119;

GO

ALTER DATABASE QLBH REMOVE FILE QLBH_data2

GO 

ALTER DATABASE QLBH
SET READ_WRITE

sp_helpdb QLBH

GO

Sp_ReNamedb 'QLBH','Banhang'

GO
use master
Drop database Banhang

GO 
use QLBH
EXEC sp_addtype isbn, 'smallint', 'NOT NULL'
EXEC sp_addtype isbn10, 'smallint', 'NOT NULL'
EXEC sp_addtype phoneNumber, 'smallint', 'NOT NULL'

EXEC sp_addtype Mavung, 'char(10)'
EXEC sp_addtype isbn10, 'smallint', 'NOT NULL'
EXEC sp_addtype phoneNumber, 'smallint', 'NOT NULL'

SELECT domain_name, data_type, character_maximum_length
FROM information_schema.domains
ORDER BY domain_name
GO
create table book  (
    masach isbn10,
    phone phoneNumber)

Go

EXEC sp_droptype isbn


