CREATE DATABASE db_pcspecs
GO

USE db_pcspecs
GO

CREATE SCHEMA komp
GO

DROP SCHEMA komp
GO

CREATE TABLE komp.kategoria
( id_kategoria          INT             IDENTITY(1,1)
, nazov                 VARCHAR(30)     NOT NULL
, CONSTRAINT kategoria_pk PRIMARY KEY (id_kategoria)
)
GO

CREATE TABLE komp.produkty
( id_produkt           INT              IDENTITY(1,1)
, id_kategoria         INT              NOT NULL
, znacka		    VARCHAR(30)         NOT NULL
, typ				VARCHAR(30)			NOT NULL
, rada				VARCHAR(30)			NOT NULL
, cena              MONEY               NOT NULL
, CONSTRAINT produkt_pk PRIMARY KEY(id_produkt)
, CONSTRAINT kategoria_f1 FOREIGN KEY(id_kategoria) REFERENCES komp.kategoria(id_kategoria)
)
GO

CREATE TABLE komp.zakaznik
( id_zakaznik		INT				   	IDENTITY(1,1)
, meno				VARCHAR(30)	   		NOT NULL
, priezvisko		VARCHAR(30)			NOT NULL
, tel_c				CHAR(12)			NOT NULL
, email				VARCHAR(40)			NOT NULL
, ulica				VARCHAR(20)			NOT NULL
, mesto				VARCHAR(20)			NOT NULL
, psc 				VARCHAR(20)			NOT NULL
, CONSTRAINT zakaznik_pk PRIMARY KEY(id_zakaznik)
)
GO

CREATE TABLE komp.kosik
( id_kosik         INT                IDENTITY(1,1)
, id_kategoria     INT                NOT NULL
, id_produkt       INT                NOT NULL
, id_zakaznik      INT                NOT NULL
, c_faktury        CHAR(8)            NOT NULL
, CONSTRAINT kosik_pk PRIMARY KEY(id_kosik)
, CONSTRAINT kategoria_f2 FOREIGN KEY(id_kategoria) REFERENCES komp.kategoria(id_kategoria)
, CONSTRAINT produkt_f1 FOREIGN KEY(id_produkt) REFERENCES komp.produkty(id_produkt)
, CONSTRAINT zakaznik_f1 FOREIGN KEY(id_zakaznik) REFERENCES komp.zakaznik(id_zakaznik)
, CONSTRAINT c_faktury_u UNIQUE(c_faktury)
)
GO

DROP TABLE komp.produkty
DROP TABLE komp.kategoria
DROP TABLE komp.zakaznik
DROP TABLE komp.kosik

INSERT INTO komp.kategoria (nazov) VALUES ('GPU')
INSERT INTO komp.kategoria (nazov) VALUES ('CPU')
INSERT INTO komp.kategoria (nazov) VALUES ('RAM')
INSERT INTO komp.kategoria (nazov) VALUES ('Disk')
INSERT INTO komp.kategoria (nazov) VALUES ('MB')
INSERT INTO komp.kategoria (nazov) VALUES ('Skrinka')
INSERT INTO komp.kategoria (nazov) VALUES ('Zdroj')
INSERT INTO komp.kategoria (nazov) VALUES ('Chladič')
INSERT INTO komp.kategoria (nazov) VALUES ('Audio karta')
INSERT INTO komp.kategoria (nazov) VALUES ('Sieťová karta')

INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce GTX', 'GF GTX 1050 Ti', 205) 
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce GTX', 'GF GTX 1630', 185) 
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce GTX', 'GF GTX 1650', 195) 
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce GTX', 'GF GTX 1660', 295) 
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce GTX', 'GF GTX 1660 Ti', 345) 
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 2060', 320)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 2070', 360)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 2080', 560)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 3050', 320)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 3050 Ti', 370)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 3060', 340)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 3060 Ti', 495)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 3070', 600)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 3070 Ti', 650)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 3080', 895)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 3080 Ti', 1050)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 3090', 1600)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 4070 Ti', 950)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 4080', 1500)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (1, 'NVIDIA', 'GeForce RTX', 'GF RTX 4090', 2100)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Comet Lake', 'i3 10100F', 70)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Comet Lake', 'i5 10400F', 105)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Comet Lake', 'i7 10700KF', 285)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Comet Lake', 'i9 10900KF', 350)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Rocket lake', 'i5-11500', 130)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Rocket lake', 'i7-11700F', 300)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Rocket lake', 'i9-11900F', 415)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Pentium', 'Gold G7400', 100)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Pentium', 'G3220', 60)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'Intel', 'Pentium', 'G3460', 100)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', '3 4300G', 95)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', '3 4100', 80)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', '5 5600X', 185)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', '5 7600', 190)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', '7 5700X', 215)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', '7 5800X3D', 350)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', '9 7950X', 670)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', '9 5900X', 375)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', 'Threadripper PRO 5965WX', 1400)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (2, 'AMD', 'Ryzen', 'Threadripper PRO 5975WX', 3600)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Kingston', 'DDR5', 'Fury', 45)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Kingston', 'DDR5', 'Fury', 80)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Corsair', 'DDR4', 'Vengeance', 160)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Corsair', 'DDR3', 'Vengeance', 45)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'G.SKILL', 'DDR4', 'Trident Z RGB', 360)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Crucial', 'DDR4', '', 40)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Apacer', 'DDR3L', '', 25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Corsair', 'DDR5', 'Vengeance', 135)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Kingston', 'DDR5', 'Fury Impact', 80)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'ADATA', 'SO-DIMM', 'XPG Hunter', 40)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Synology', 'DDR4', 'ECC', 80)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Kingston', 'DDR4', '', 55)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Kingston', 'DDR4', 'Server Premier', 120)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Kingston', 'DDR4', 'Server Premier', 50)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Kingston', 'DDR4', 'Server Premier', 40)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Corsair', 'DDR4', 'Mac Memory', 85)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Corsair', 'DDR4', 'Mac Memory', 25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Corsair', 'DDR4', 'Mac Memory', 180)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Corsair', 'DDR4', 'Mac Memory', 80)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (3, 'Corsair', 'DDR4', 'Mac Memory', 30)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'HDD', 'Seagate', 'Barracuda Laptop', 50)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'HDD', 'Seagate', 'Barracuda Laptop', 70)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'HDD', 'Seagate', 'IronWolf Pro', 125)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'Samsung', '970 EVO PLUS', 80)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'Samsung', '970 EVO PLUS', 160)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'Samsung', 'EVO PLUS', 80)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'Crucial', 'MX500', 140)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'Kingston', 'DC500M', 100)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'HDD', 'Seagate', 'Exos X18', 320)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'HDD', 'WD', 'Gold', 240)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'Samsung', 'Portable', 180)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'Samsung', 'Portable T7 Shield', 360)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'ADATA', 'SE800', 85)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'WD', 'Elements Portable', 60)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'WD', 'Elements Portable', 125)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'WD', 'Elements Desktop', 200)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'WD', 'Elements Desktop', 225)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'WD', 'Elements Desktop', 250)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'WD', 'Elements Desktop', 275)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (4, 'SSD', 'WD', 'Elements Desktop', 300)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'TUF GAMING Z490-PLUS WIFI', 150)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'ROG MAXIMUS XII APEX', 450)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'B760M GAMING DDR4', 250)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'ROG STRIX B550-F GAMING', 300)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'PRIME B550-PLUS', 400)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'GIGABYTE', 'ATX', 'B550 AORUS ELTE V2', 500)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'ROG CROSSHAIR VIII HERO (WiFi)', 550)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'TUF GAMING B550YM-E WIFI', 250)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'TUF GAMING B550M-PLUS', 355)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'TUF GAMING B550M-PLUS WIFI II', 255)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'MSI', 'ATX', 'MAG Z790 TOMAHAWK WIFI', 400)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'MSI', 'Micro ATX', 'PRO B660M- A DDR4', 250)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'GIGABYTE', 'Micro ATX', 'H510M H', 300)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'GIGABYTE', 'ATX', 'Z790 AORUS ELITE AX', 250)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'PRIME Z790-P WIFI', 300)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'ASUS', 'ATX', 'PRIME Z690-P D4', 200)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'MSI', 'ATX', 'PRO Z790-P WIFI DDR4', 250)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'MSI', 'ATX', 'MPG Z790 EDGE WIFI DDR4', 300)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (5, 'GIGABYTE', 'Micro ATX', 'B760M AORUS ELITE AX', 200)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX', 'Zalman', 'S4 Plus', 65)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX, eATX', 'GameMax', 'Abyss TR', 50)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX, eATX', 'DeepCool', 'CK560', '45')
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX, eATX', 'Fractal Design', 'Meshify 2 Black TG', 75)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX', 'GameMax', 'Revolt', 70)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX', 'SilentiumPC', 'Armis AR1', 65)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'mITX, mDTX', 'Cooler Master', 'MasterBox NR200P', 60)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'mATX', 'EVOLVEO', 'M1', 55)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX', 'Endorfy', 'Signum 300 ARGB', 70)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'mITX', 'NZXT', 'H1', 55)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX, eATX', 'Zalman', 'R2', 65)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX', 'Fractal Design', 'Pop Air RGB', 75)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'mATX, mITX', 'GameMax', 'Silent Hill/H606', 55)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'mATX, mITX', 'GameMax', 'Dark Ranger/H605-TR', 45)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX', 'GameMax', 'G563', 75)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'mATX, mITX', 'Evolveo', 'Shaw 2 ', 120)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX', 'Zalman', 'T6', 100)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX', 'Fractal Design', 'Define 7 Compact', 105)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'ATX, mATX, mITX', 'Zalman', 'S3 GT', '100')
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (6, 'mITX, mDTX', 'Cooler Master', 'MasterBox NR200P', 75)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Corsair', 'ATX', 'RM850e', 165)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Corsair', 'ATX', 'RM850x (2021)', 65)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Corsair', 'ATX', 'RM1000x (2021)', 220)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Seasonic', 'ATX', 'HX1200', 250)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Corsair', 'ATX', 'CV550', 150)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Corsair', 'ATX', '850GQ', 140)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Seasonic', 'ATX', 'SuperNOVA 650 GA', 165)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Seasonic', 'ATX', '700 BQ', 175)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'MSI', 'SFX + ATX', '550GM', 150)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'MSI', 'ATX', 'SuperNOVA 650 G6', 255)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Corsair', 'ATX', 'RM850e', 250)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Corsair', 'ATX', 'RM1000x (2021)', 270)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Corsair', 'ATX', 'HX1200', 280)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Seasonic', 'ATX', 'Prime 1300W', 300)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Seasonic', 'ATX', 'Focus 750', 170)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'Seasonic', 'ATX', 'Focus Plus 750 Platinum', 170)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'MSI', 'ATX', 'A1000G PCIE5', 265)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'GIGABYTE', 'ATX', 'UD750 GM', 220)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'EVGA', 'ATX', 'SuperNOVA 650 GA', 170)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (7, 'EVGA', 'ATX', 'SuperNOVA 650 G6', 175)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'be quiet!', 'vzdušný', 'Pure Wings 2', 15)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'be quiet!', 'vzdušný', 'Shadow Wings 2', 25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'be quiet!', 'vzdušný', 'Light Wings', 20)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'SilentiumPC', 'vzdušný', 'Zephyr 140', 25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'SilentiumPC', 'vzdušný', 'Zephyr 50', 15)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'SilentiumPC', 'vzdušný', 'Mistral 140', 25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'SilentiumPC', 'vzdušný', 'Msitral 92', 20)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'Fractal Design', 'vzdušný', 'Dynamic X2 GP-14', 15)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'Fractal Design', 'vzdušný', 'Prisma AL-18 ARGB', 25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'Fractal Design', 'vzdušný', 'Aspect 14 RGB', 15)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'Arctic', 'vodný', 'Liquid Freezer II 360', 25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'NZXT', 'vodný', 'Kraken X63', 120)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'NZXT', 'vodný', 'Kraken X73', 115)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'NZXT', 'vodný', 'Kraken X73 RGB', 120)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'Cooler Master', 'vodný', 'MASTERLIQUID ML120L RGB V2', 340)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'ASUS', 'vodný', 'TUF GAMING LC 240 ARGB', 250)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'Endorfy', 'vodný', 'Navis F280', 240)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'Corsair', 'vodný', 'iCUE H100i ELITE LCD Display', 70)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'MSI', 'vodný', 'MEG CORELIQUID S280', 200)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (8, 'DeepCool', 'vodný', 'LS320', 150)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Interná', 'Creative', 'SOUND BLASTER AUDIGY RX', 200)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Interná', 'Creative', 'Sound BlasterX AE-5 Plus', 15)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Interná', 'Creative', 'Sound Blaster AE-9', 115)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Interná', 'Creative', 'Sound Blaster AE-7', 20)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Interná', 'ESI', 'MAYA 44 eX', 110)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Interná', 'Creative', 'SOUND BLASTER AUDIGY RX', 200)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Herná Externá', 'Creative', 'Sound Blaster G3', 200)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Herná Externá', 'Creative', 'SOUND BLASTER Play! 3', 15)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Herná Externá', 'AXAGON', 'ADA-71 SoundBox', 110)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Herná Externá', 'C-TECH', 'SC-7Q', 20)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Herná Externá', 'Focusrite', ' Scarlett2i2 Studio 3rd Gen', 25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Herná Externá', 'Focusrite', 'Vocaster Two', 35)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Herná Externá', 'AUDIENT', 'iD44', 40)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Herná Externá', 'AUDIENT', 'iD4 MK II USB', 45)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Herná Externá', 'AUDIENT', 'EVO 4', 50)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Externá', 'Focusrite', 'Scarlett Solo 3rd Gen', 50)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Externá', 'Focusrite', 'Scarlett Solo 4i4 3rd Gen', 65)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Externá', 'Focusrite', 'Scarlett Solo 18i20 3rd Gen', 75)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Externá', 'Vention', 'USB External Sound Card', 80)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Externá', 'AXAGON', 'ADA-17 MINI HQ', 120)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (9, 'Externá', 'M-Audio', 'AIR Hub', 110)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'TP-Link', 'Archer T3U Plus',25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'TP-Link', 'Archer T4U AC1300 Dual Band',30)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'TP-Link', 'Archer T2U Plus',35)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'TP-Link', 'Archer T2U Nano',25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'TP-Link', 'Archer T9UH',20)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'AXAGON', 'ADE-XR',25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'ASUS', 'USB-N10 Nano',35)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'Comfast', 'UR20',45)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'CONNECT IT', 'CI-1139',50)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Externá', 'D-Link', 'DUB-E100',25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'ASUS', 'PCE-AC68',35)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'ASUS', 'PCE-AC88',25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'ASUS', 'PCE-AC51',45)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'ASUS', 'AX200',50)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'TP-Link', 'Acrher T5E',45)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'TP-Link', 'Archer T6E',45)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'TP-Link', 'Archer TX55E, AX3000',25)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'TP-Link', 'TL-WN781ND',35)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'TP-Link', 'TG-3468',45)
INSERT INTO komp.produkty (id_kategoria, znacka, typ, rada, cena) VALUES (10, 'Interná', 'GIGABYTE', 'WBAX200',55)

SELECT * FROM komp.produkty WHERE znacka = 'AMD'
SELECT * FROM komp.produkty

UPDATE komp.produkty SET cena = 80 WHERE id_produkt = 177

SELECT k.znacka, k.typ, k.rada, k.cena, p.id_kategoria FROM komp.produkty as k 
INNER JOIN komp.kategoria as p 
ON p.id_kategoria = p.id_kategoria

DELETE FROM komp.produkty

INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Robert', 'Garcia', '555-555-5555', 'robert.garcia@email.com', '789 Maple Ave', 'Anystate', '12345');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Jennifer', 'Miller', '555-123-7890', 'jennifer.miller@email.com', '345 Pine St', 'Anytown', '67890');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('David', 'Martinez', '555-321-7654', 'david.martinez@email.com', '678 Oak St', 'Anycity', '12345');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Emily', 'Davis', '555-456-7890', 'emily.davis@email.com', '901 Elm St', 'Anystate', '67890');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('William', 'Brown', '555-555-1234', 'william.brown@email.com', '234 Oak St', 'Anytown', '12345');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Amanda', 'Rodriguez', '555-321-6543', 'amanda.rodriguez@email.com', '567 Maple Ave', 'Anycity', '67890');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Michael', 'Taylor', '555-123-4567', 'michael.taylor@email.com', '890 Pine St', 'Anystate', '12345');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Jessica', 'Hernandez', '555-789-6543', 'jessica.hernandez@email.com', '123 Elm St', 'Anytown', '67890');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Peter', 'Tumidalský', '0905 137 986', 'tumidalskyp@gmail.com', 'Košická 8', 'Prešov', '080 01');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Samuel', 'Verešpej', '0903 791 309', 'verespejs@gmail.com', 'Solivarská 9', 'Prešov', '080 01');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Radko', 'Vojček', '0914 357 168', 'vojcekr@gmail.com', 'Svidnícka 15', 'Stropkov', '091 01');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Marek', 'Wittner', '0917 437 941', 'wittnerm@gmail.com', 'Centrálna 18', 'Prešov/Šidlovec', '080 01');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Filip ', 'Pivovarník', '0903 783 943', 'pivovarnikf@gmail.com', 'Bratislavská 1', 'Prešov', '080 01');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Martin', 'Šalamon', '0907 468 321', 'salamonm@gmail.com', 'Letná 9', 'Záborské', '082 53');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Lucas', 'Tchir', '0903 654 387', 'tchirl@gmail.com', 'Exnárova 5', 'Prešov', '080 01');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Enzo', 'Štetina', '0905 673 983', 'stetinae@gmail.com', 'Hlavná 10', 'Prešov', '080 01');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Matej Tomáš Jozef', 'Ponik', '0907 387 143', 'ponikm@gmail.com', 'Gregorovská 1', 'Terňa', '082 67');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Tadeáš', 'Kazimír', '0904 731 216', 'kazimirt@gmail.com', 'Veľká 11', 'Terňa', '082 67');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Filip', 'Juraško', '0904 576 213', 'juraskof@gmail.com', 'Exnárova 11', 'Prešov', '080 01');
INSERT INTO komp.zakaznik (meno, priezvisko, tel_c, email, ulica, mesto, psc) VALUES ('Enzo', 'Štetina', '0905 673 983', 'stetinae@gmail.com', 'Hlavná 10', 'Prešov', '080 01');

SELECT * FROM komp.zakaznik WHERE mesto = 'Prešov'
SELECT * FROM komp.zakaznik

DELETE FROM komp.kosik

UPDATE komp.zakaznik SET meno = 'Samuel', priezvisko = 'Anderko', tel_c = '0905 731 023', email = 'anderkos@gmail.com', ulica = 'Kokošovská 9', mesto = 'Abramovce', psc = '012 34' WHERE id_zakaznik = 8

DELETE FROM komp.zakaznik

SELECT * FROM komp.kategoria as k 
INNER JOIN komp.produkty as p ON p.id_kategoria=k.id_kategoria
INNER JOIN komp.kosik as kos ON kos.id_produkt=p.id_produkt

--vytváranie procedúry

CREATE PROCEDURE komp.vyuctovanie
                 (@produkt  VARCHAR(30)
                , @kategoria VARCHAR(30)
                , @faktura   VARCHAR(30)
                , @zakaznik VARCHAR(30)
                 )   
AS
BEGIN 
    INSERT INTO komp.kosik(id_produkt, id_kategoria, c_faktury, id_zakaznik) VALUES (@produkt, @kategoria, @faktura, @zakaznik)
END
GO

DROP PROCEDURE komp.vyuctovanie

EXECUTE komp.vyuctovanie 1, 1, 20230408, 3
EXECUTE komp.vyuctovanie 2, 2, 20230409, 1

-- zmena ceny pre konkrétny produkt pri akomkoľvek insertovaní/updatovaní
CREATE OR ALTER TRIGGER komp.cena ON komp.produkty
    AFTER INSERT, UPDATE AS
BEGIN 
    UPDATE komp.produkty
        SET cena = 210
        FROM komp.produkty AS r
            INNER JOIN inserted AS i ON i.id_produkt = r.id_produkt

    SELECT * FROM inserted
    SELECT * FROM deleted
END

SELECT * FROM komp.produkty

-- skúška triggera
UPDATE komp.produkty
    SET cena = 10
    WHERE id_produkt = 1


-- zmena mesta pri zákazníkovi pri akomkoľvek insertovaní/updatovaní
CREATE OR ALTER TRIGGER komp.mesto ON komp.zakaznik
    AFTER INSERT, UPDATE AS
BEGIN 
    UPDATE komp.zakaznik
        SET mesto = 'Boston'
        FROM komp.zakaznik AS r
            INNER JOIN inserted AS i ON i.id_zakaznik = r.id_zakaznik

    SELECT * FROM inserted
    SELECT * FROM deleted
END

SELECT * FROM komp.zakaznik

-- skúška triggera
UPDATE komp.zakaznik
    SET mesto = 'New York'
    WHERE id_zakaznik = 1

-- vytvorenie pohľadu pre zásoby v sklade
CREATE VIEW komp.zasoby AS
SELECT znacka, typ, rada, cena
FROM komp.produkty

DROP VIEW komp.zasoby


-- vytvorenie pohľadu ako prehlad kosika
CREATE VIEW komp.prehlad_kosika AS
SELECT *
FROM komp.kosik

DROP VIEW komp.prehlad_kosika

SELECT * FROM komp.prehlad_kosika

-- využitie agr. funkcie na spočítanie priemernej ceny tovaru so značkou AMD
SELECT AVG(cena)
FROM komp.produkty
WHERE znacka = 'AMD'


-- využitie agr. funkcie pre spočítanie zákazníkov mesta Prešov
SELECT COUNT(meno)
FROM komp.zakaznici
WHERE mesto = 'Prešov'