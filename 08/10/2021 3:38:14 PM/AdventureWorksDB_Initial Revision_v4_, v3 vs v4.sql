-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE TABLE EDW.Product
(
 Product_Id  integer NOT NULL,
 ProductName varchar(50) NOT NULL,
 CONSTRAINT PK_testtable_copy_1 PRIMARY KEY ( Product_Id )
);