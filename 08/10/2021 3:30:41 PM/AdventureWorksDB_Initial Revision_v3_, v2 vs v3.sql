-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE TABLE EDW.NewEmpTable
(
 EmpId   integer NOT NULL,
 EmpName varchar(50) NOT NULL,
 CONSTRAINT PK_testtable_copy PRIMARY KEY ( EmpId )
);