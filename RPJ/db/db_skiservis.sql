DROP DATABASE db_skiservis

CREATE DATABASE db_skiservis
GO

USE db_skiservis
GO

CREATE SCHEMA ski 
GO

CREATE TABLE ski.customer
( id_customer		INT				IDENTITY(1,1)
, mail       		VARCHAR(40)     NOT NULL
, [password]		VARCHAR(30)     NOT NULL
, first_name        VARCHAR(255)    NOT NULL
, last_name         VARCHAR(255)    NOT NULL
, phone_number      CHAR(12)        NOT NULL
, CONSTRAINT customer_pk PRIMARY KEY(id_customer)
)
GO

CREATE TABLE ski.services
( id_service	    INT             IDENTITY(1,1)
, services_name     VARCHAR(30)     NOT NULL
, price             MONEY           NOT NULL
, CONSTRAINT services_pk PRIMARY KEY(id_service)
)
GO

CREATE TABLE ski.rentals
( id_rental         INT             IDENTITY(1,1)
, product           VARCHAR(30)     NOT NULL
, price             MONEY           NOT NULL
, content           VARCHAR(30)     NOT NULL
, CONSTRAINT rentals_pk PRIMARY KEY(id_rental)
)
GO

CREATE TABLE ski.categories
( id_category       INT         IDENTITY(1,1)
, category_name     VARCHAR(30) NOT NULL
, CONSTRAINT categories_pk PRIMARY KEY(id_category)
)
GO

CREATE TABLE ski.buy
( id_buy            INT         IDENTITY(1,1)
, id_category       INT         NOT NULL
, product_name      VARCHAR(30) NOT NULL
, price             MONEY       NOT NULL
, CONSTRAINT buy_pk PRIMARY KEY(id_buy)
, CONSTRAINT category_f1 FOREIGN KEY(id_category) REFERENCES ski.categories(id_category)
)
GO

CREATE TABLE ski.reservations
( id_reservation     INT            IDENTITY(1,1)
, id_customer        INT            NOT NULL
, id_service         INT            NOT NULL
, CONSTRAINT reservation_pk PRIMARY KEY(id_reservation)
, CONSTRAINT customer_f1 FOREIGN KEY(id_customer) REFERENCES ski.customer(id_customer)
, CONSTRAINT service_f1 FOREIGN KEY(id_service) REFERENCES ski.services(id_service)
)
GO

DROP TABLE ski.reservations
DROP TABLE ski.customer
DROP TABLE ski.services
DROP TABLE ski.rentals
DROP TABLE ski.buy
DROP TABLE ski.categories

DROP SCHEMA ski