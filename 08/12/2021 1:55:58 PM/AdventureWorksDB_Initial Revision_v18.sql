-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

CREATE FILE FORMAT fileFormat_431
 TYPE = JSON;


-- ************************************** EDW.DimAccount
CREATE TABLE EDW.DimAccount
(
 AccountKey                    number(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 COMMENT 'Unique Identifier of the Account data',
 ParentAccountKey              number(38,0) COMMENT 'Identifier of parent Account',
 AccountCodeAlternateKey       number(38,0),
 ParentAccountCodeAlternateKey number(38,0) COMMENT 'Desc',
 AccountDescription            varchar(50) COMMENT 'Desc',
 AccountType                   varchar(50) COMMENT 'Desc',
 Operator                      varchar(50) COMMENT 'Desc',
 CustomMembers                 varchar(300),
 ValueType                     varchar(50),
 CustomMemberOptions           varchar(200),
 CONSTRAINT PK_DimAccount PRIMARY KEY ( AccountKey )
)
COMMENT = 'Holds all Account information';


-- ************************************** EDW.Country
CREATE TABLE EDW.Country
(
 countryId numeric NOT NULL,
 cityId    numeric NOT NULL,
 city      varchar(50) NOT NULL,
 CONSTRAINT PK_country PRIMARY KEY ( countryId )
);


-- ************************************** EDW.FactCurrencyRate
CREATE TABLE EDW.FactCurrencyRate
(
 CurrencyKey  number(38,0) NOT NULL,
 DateKey      number(38,0) NOT NULL,
 AverageRate  float NOT NULL,
 EndOfDayRate float NOT NULL,
 CONSTRAINT FK_FactCurrencyRate_413 FOREIGN KEY ( CurrencyKey ) REFERENCES EDW.DimCurrency ( CurrencyKey ),
 CONSTRAINT FK_FactCurrencyRate_415 FOREIGN KEY ( DateKey ) REFERENCES EDW.DimDate ( DateKey )
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

