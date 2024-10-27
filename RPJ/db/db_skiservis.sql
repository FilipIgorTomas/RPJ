CREATE DATABASE db_skiservis
GO

USE db_skiservis
GO

CREATE SCHEMA ski 
GO

DROP SCHEMA ski

CREATE TABLE komp.customer_login
( id_customer		INT				   	IDENTITY(1,1)
, [mail]     		VARCHAR(40)	   		NOT NULL
, [password]		CHAR(12)			NOT NULL
, CONSTRAINT customer_login_pk PRIMARY KEY(id_customer)
)
GO