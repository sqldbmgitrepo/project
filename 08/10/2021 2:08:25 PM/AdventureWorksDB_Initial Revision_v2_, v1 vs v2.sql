-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE TABLE EDW.Testtable
(
 EmpId   integer NOT NULL,
 EmpName varchar(50) NOT NULL,
 CONSTRAINT PK_testtable PRIMARY KEY ( EmpId )
);