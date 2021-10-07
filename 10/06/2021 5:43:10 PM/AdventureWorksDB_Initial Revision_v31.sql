-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE FILE FORMAT fileFormat_431
 TYPE = JSON;


-- ************************************** EDW.Country
CREATE TABLE EDW.Country
(
 countryId numeric NOT NULL,
 cityId    numeric NOT NULL,
 city      varchar(50) NOT NULL,
 CONSTRAINT PK_country PRIMARY KEY ( countryId )
);


-- ************************************** EDW.City
CREATE TABLE EDW.City
(
 cityId    numeric NOT NULL COMMENT 'Unique identification',
 city      varchar NOT NULL COMMENT 'Name of the city',
 countryId numeric NOT NULL COMMENT 'id of the country where city belongs to',
 CONSTRAINT PK_city PRIMARY KEY ( cityId ),
 CONSTRAINT FK_452 FOREIGN KEY ( countryId ) REFERENCES EDW.Country ( countryId )
)
COMMENT = 'Capturing city information all over world';


-- ************************************** EDW.SampleView
Create View EDW.SampleView

  Comment = 'This is SampleView Comment'

AS
(
    -- Please type View Definition here
    SELECT 
           FinanceKey, 
           OrganizationKey,  
           AccountKey, 
           ScenarioKey
    FROM 
        EDW.FactFinance ff
         
);

