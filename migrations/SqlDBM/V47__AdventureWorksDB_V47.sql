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


-- ************************************** EDW.Address
CREATE TABLE EDW.Address
(
 AddressID    numeric NOT NULL,
 AddressLine1 varchar NOT NULL,
 AddressLine2 varchar NOT NULL,
 state        varchar(50) NOT NULL,
 postalcode   numeric NOT NULL,
 cityId       numeric NOT NULL,
 CONSTRAINT PK_address PRIMARY KEY ( AddressID ),
 CONSTRAINT FK_457 FOREIGN KEY ( cityId ) REFERENCES EDW.City ( cityId )
);


-- ************************************** EDW.FactResellerSales
CREATE TABLE EDW.FactResellerSales
(
 ResellerKey           number(38,0) NOT NULL,
 OrderDateKey          number(38,0) NOT NULL,
 ProductKey            number(38,0) NOT NULL,
 DueDateKey            number(38,0) NOT NULL,
 ShipDateKey           number(38,0) NOT NULL,
 EmployeeKey           number(38,0) NOT NULL,
 PromotionKey          number(38,0) NOT NULL,
 CurrencyKey           number(38,0) NOT NULL,
 EnglishDayNameOfWeek  varchar(10) NOT NULL,
 SalesTerritoryKey     number(38,0) NOT NULL,
 SpanishDayNameOfWeek  varchar(10) NOT NULL,
 FrenchDayNameOfWeek   varchar(10) NOT NULL,
 SalesOrderNumber      varchar(20) NOT NULL,
 SalesOrderLineNumber  number(38,0) NOT NULL,
 RevisionNumber        number(38,0),
 OrderQuantity         number(38,0),
 UnitPrice             number(38,0),
 ExtendedAmount        number(38,0),
 UnitPriceDiscountPct  float,
 DiscountAmount        float,
 ProductStandardCost   number(38,0),
 TotalProductCost      number(38,0),
 SalesAmount           number(38,0),
 TaxAmt                number(38,0),
 Freight               number(38,0),
 CarrierTrackingNumber varchar(25),
 CustomerPONumber      varchar(25),
 CONSTRAINT PK_508 PRIMARY KEY ( ResellerKey, OrderDateKey ),
 CONSTRAINT FK_FactResellerSales_445 FOREIGN KEY ( ProductKey ) REFERENCES EDW.DimProduct ( ProductKey ),
 CONSTRAINT FK_FactResellerSales_447 FOREIGN KEY ( ResellerKey ) REFERENCES EDW.DimReseller ( ResellerKey ),
 CONSTRAINT FK_FactResellerSales_449 FOREIGN KEY ( EmployeeKey ) REFERENCES EDW.DimEmployee ( EmployeeKey ),
 CONSTRAINT FK_FactResellerSales_451 FOREIGN KEY ( PromotionKey ) REFERENCES EDW.DimPromotion ( PromotionKey ),
 CONSTRAINT FK_FactResellerSales_453 FOREIGN KEY ( CurrencyKey ) REFERENCES EDW.DimCurrency ( CurrencyKey ),
 CONSTRAINT FK_FactResellerSales_455 FOREIGN KEY ( SalesTerritoryKey ) REFERENCES EDW.DimSalesTerritory ( SalesTerritoryKey ),
 CONSTRAINT FK_FactResellerSales_457 FOREIGN KEY ( OrderDateKey ) REFERENCES EDW.DimDate ( DateKey ),
 CONSTRAINT FK_FactResellerSales_459 FOREIGN KEY ( DueDateKey ) REFERENCES EDW.DimDate ( DateKey ),
 CONSTRAINT FK_FactResellerSales_461 FOREIGN KEY ( ShipDateKey ) REFERENCES EDW.DimDate ( DateKey )
)
COMMENT = 'Fact data of Reseller Sales';


