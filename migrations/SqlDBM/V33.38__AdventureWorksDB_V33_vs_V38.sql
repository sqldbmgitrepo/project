-- *********************** SqlDBM: Snowflake ************************
-- ******************************************************************

ALTER TABLE EDW.FactInternetSales
    DROP CONSTRAINT fkIdx_469;

ALTER TABLE EDW.FactInternetSales
    DROP CONSTRAINT fkIdx_473;

ALTER TABLE EDW.DimPromotion
    DROP CONSTRAINT PK_DimPromotion;

ALTER TABLE EDW.DimDate
    DROP CONSTRAINT PK_DimDate;

ALTER TABLE EDW.DimPromotion
    DROP CONSTRAINT PK_DimPromotion_copy;

ALTER TABLE EDW.DimDate
    DROP CONSTRAINT PK_DimDate_copy;

ALTER TABLE EDW.FactInternetSales
    DROP CONSTRAINT PK_factinternetsales_copy;

ALTER TABLE EDW.DimDate
    ADD COLUMN EnglishDayNameOfWeek varchar(10) NOT NULL;

ALTER TABLE EDW.FactInternetSales
    ADD COLUMN DateKey number(38,0) NOT NULL;

ALTER TABLE EDW.DimDate
    DROP COLUMN EnglishDayNameOfWeek;

ALTER TABLE EDW."Test Table"
    DROP COLUMN name;

ALTER TABLE EDW."Test Table"
    ADD COLUMN name1 number(38,0) NOT NULL;

ALTER TABLE EDW.FactInternetSales
    DROP COLUMN DateKey;

ALTER TABLE EDW.DimPromotion
    ADD CONSTRAINT PK_DimPromotion_copy PRIMARY KEY (cityId);

ALTER TABLE EDW.DimDate
    ADD CONSTRAINT PK_DimDate_copy PRIMARY KEY (MinQty);

ALTER TABLE EDW.FactInternetSales
    ADD CONSTRAINT PK_factinternetsales_copy PRIMARY KEY (ProductKey);

ALTER TABLE EDW.DimPromotion
    ADD CONSTRAINT PK_DimPromotion PRIMARY KEY (PromotionKey);

ALTER TABLE EDW.DimDate
    ADD CONSTRAINT PK_DimDate PRIMARY KEY (DateKey);

ALTER TABLE EDW.FactInternetSales
    ADD CONSTRAINT fkIdx_469 FOREIGN KEY (FrenchPromotionCategory) REFERENCES EDW.DimPromotion (cityId);

ALTER TABLE EDW.FactInternetSales
    ADD CONSTRAINT fkIdx_473 FOREIGN KEY (DateKey) REFERENCES EDW.DimDate (MinQty);