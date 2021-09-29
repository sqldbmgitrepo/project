-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE FILE FORMAT fileFormat_431
 TYPE = JSON;


-- ************************************** EDW."Test Table"
CREATE TABLE EDW."Test Table"
(
 name number(38,0) NOT NULL,
 CONSTRAINT PK_496 PRIMARY KEY ( name )
);


