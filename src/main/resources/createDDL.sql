CREATE TABLE ESPM_CUSTOMER (CUSTOMER_ID VARCHAR(10) NOT NULL, CITY VARCHAR(40), COUNTRY VARCHAR(3), DATE_OF_BIRTH DATE NOT NULL, EMAIL_ADDRESS VARCHAR(255), FIRST_NAME VARCHAR(40), HOUSE_NUMBER VARCHAR(10), LAST_NAME VARCHAR(40), PHONE_NUMBER VARCHAR(30), POSTAL_CODE VARCHAR(10), STREET VARCHAR(60), UPDATEDTIMESTAMP TIMESTAMP, PRIMARY KEY (CUSTOMER_ID))
CREATE TABLE ESPM_PRODUCT (PRODUCT_ID VARCHAR(10) NOT NULL, CATEGORY VARCHAR(40), CATEGORY_NAME VARCHAR(40), CURRENCY_CODE VARCHAR(5), DIMENSION_DEPTH NUMERIC(13,4), DIMENSION_HEIGHT NUMERIC(13,4), DIMENSION_UNIT VARCHAR(3), DIMENSION_WIDTH NUMERIC(13,4), LONG_DESCRIPTION VARCHAR(255), NAME VARCHAR(255), PICTURE_URL VARCHAR(255), PRICE NUMERIC(23,3), QUANTITY_UNIT VARCHAR(3), SHORT_DESCRIPTION VARCHAR(255), SUPPLIER_ID VARCHAR(10), WEIGHT NUMERIC(13,3), WEIGHT_UNIT VARCHAR(3), SUPPLIER_SUPPLIER_ID VARCHAR(10), UPDATEDTIMESTAMP TIMESTAMP, PRIMARY KEY (PRODUCT_ID))
CREATE TABLE ESPM_PRODUCT_CATEGORY (CATEGORY VARCHAR(40) NOT NULL, CATEGORY_NAME VARCHAR(40), MAIN_CATEGORY VARCHAR(40), MAIN_CATEGORY_NAME VARCHAR(40), NUMBER_OF_PRODUCTS BIGINT, UPDATEDTIMESTAMP TIMESTAMP, PRIMARY KEY (CATEGORY))
CREATE TABLE ESPM_PRODUCT_TEXT (ID BIGINT NOT NULL, LANGUAGE VARCHAR(2), LONG_DESCRIPTION VARCHAR(255), NAME VARCHAR(255), PRODUCT_ID VARCHAR(10), SHORT_DESCRIPTION VARCHAR(255), PRIMARY KEY (ID))
CREATE TABLE ESPM_PURCHASE_ORDER_HEADER (PURCHASE_ORDER_ID VARCHAR(10) NOT NULL, CURRENCY_CODE VARCHAR(5), GROSS_AMOUNT NUMERIC(15,3), NET_AMOUNT NUMERIC(15,3), SUPPLIER_ID VARCHAR(10), TAX_AMOUNT NUMERIC(15,3), PRIMARY KEY (PURCHASE_ORDER_ID))
CREATE TABLE ESPM_PURCHASE_ORDER_ITEM (CURRENCY_CODE VARCHAR(5), GROSS_AMOUNT NUMERIC(15,3), NET_AMOUNT NUMERIC(15,3), PRODUCT_ID VARCHAR(10), QUANTITY NUMERIC(13,3), QUANTITY_UNIT VARCHAR(3), TAX_AMOUNT NUMERIC(15,3), PURCHASE_ORDER_ITEM_ID VARCHAR(10) NOT NULL, ITEM_NUMBER INTEGER NOT NULL, PRODUCT_PRODUCT_ID VARCHAR(10), PRIMARY KEY (PURCHASE_ORDER_ITEM_ID, ITEM_NUMBER))
CREATE TABLE ESPM_SALES_ORDER_HEADER (SALES_ORDER_ID VARCHAR(10) NOT NULL, CREATED_AT DATE, CURRENCY_CODE VARCHAR(5), CUSTOMER_ID VARCHAR(10), GROSS_AMOUNT NUMERIC(15,3), LIFE_CYCLE_STATUS VARCHAR(1) NOT NULL, LIFE_CYCLE_STATUS_NAME VARCHAR(255) NOT NULL, NET_AMOUNT NUMERIC(15,3), TAX_AMOUNT NUMERIC(15,3), CUSTOMER_CUSTOMER_ID VARCHAR(10), PRIMARY KEY (SALES_ORDER_ID))
CREATE TABLE ESPM_SALES_ORDER_ITEM (CURRENCY_CODE VARCHAR(5), DELIVERY_DATE DATE, GROSS_AMOUNT NUMERIC(15,3), NET_AMOUNT NUMERIC(15,3), PRODUCT_ID VARCHAR(10), QUANTITY NUMERIC(13,3), QUANTITY_UNIT VARCHAR(3), TAX_AMOUNT NUMERIC(15,3), SALES_ORDER_ITEM_ID VARCHAR(10) NOT NULL, ITEM_NUMBER INTEGER NOT NULL, PRODUCT_PRODUCT_ID VARCHAR(10), PRIMARY KEY (SALES_ORDER_ITEM_ID, ITEM_NUMBER))
CREATE TABLE ESPM_STOCK (PRODUCT_ID VARCHAR(255) NOT NULL, LOT_SIZE NUMERIC(13,3), MIN_STOCK NUMERIC(13,3), QUANTITY NUMERIC(13,3), QUANTITY_LESS_MIN BOOLEAN, PRODUCT_PRODUCT_ID VARCHAR(10), UPDATEDTIMESTAMP TIMESTAMP, PRIMARY KEY (PRODUCT_ID))
CREATE TABLE ESPM_SUPPLIER (SUPPLIER_ID VARCHAR(10) NOT NULL, CITY VARCHAR(40), COUNTRY VARCHAR(3), EMAIL_ADDRESS VARCHAR(255), HOUSE_NUMBER VARCHAR(10), PHONE_NUMBER VARCHAR(30), POSTAL_CODE VARCHAR(10), STREET VARCHAR(60), SUPPLIER_NAME VARCHAR(80), UPDATEDTIMESTAMP TIMESTAMP, PRIMARY KEY (SUPPLIER_ID))
CREATE TABLE Users (USERID INTEGER NOT NULL, COUNTRY VARCHAR(255), DEPARTMENT VARCHAR(255), DISPLAYNAME VARCHAR(255), DISPLAYTITLE VARCHAR(255), EMAILADDRESS VARCHAR(255), INUMBER VARCHAR(255), LASTUPDATE TIMESTAMP, LOCATION VARCHAR(255), PHONENUMBER VARCHAR(255), PHOTOURL VARCHAR(255), REPORTINGCID VARCHAR(255), PRIMARY KEY (USERID))
ALTER TABLE ESPM_CUSTOMER ADD CONSTRAINT UNQ_ESPM_CUSTOMER_4 UNIQUE (EMAIL_ADDRESS)
ALTER TABLE ESPM_SUPPLIER ADD CONSTRAINT UNQ_ESPM_SUPPLIER_3 UNIQUE (EMAIL_ADDRESS)
ALTER TABLE ESPM_PRODUCT ADD CONSTRAINT FK_ESPM_PRODUCT_SUPPLIER_SUPPLIER_ID FOREIGN KEY (SUPPLIER_SUPPLIER_ID) REFERENCES ESPM_SUPPLIER (SUPPLIER_ID)
ALTER TABLE ESPM_PURCHASE_ORDER_ITEM ADD CONSTRAINT FK_ESPM_PURCHASE_ORDER_ITEM_PRODUCT_PRODUCT_ID FOREIGN KEY (PRODUCT_PRODUCT_ID) REFERENCES ESPM_PRODUCT (PRODUCT_ID)
ALTER TABLE ESPM_PURCHASE_ORDER_ITEM ADD CONSTRAINT FK_ESPM_PURCHASE_ORDER_ITEM_PURCHASE_ORDER_ITEM_ID FOREIGN KEY (PURCHASE_ORDER_ITEM_ID) REFERENCES ESPM_PURCHASE_ORDER_HEADER (PURCHASE_ORDER_ID)
ALTER TABLE ESPM_SALES_ORDER_HEADER ADD CONSTRAINT FK_ESPM_SALES_ORDER_HEADER_CUSTOMER_CUSTOMER_ID FOREIGN KEY (CUSTOMER_CUSTOMER_ID) REFERENCES ESPM_CUSTOMER (CUSTOMER_ID)
ALTER TABLE ESPM_SALES_ORDER_ITEM ADD CONSTRAINT FK_ESPM_SALES_ORDER_ITEM_PRODUCT_PRODUCT_ID FOREIGN KEY (PRODUCT_PRODUCT_ID) REFERENCES ESPM_PRODUCT (PRODUCT_ID)
ALTER TABLE ESPM_SALES_ORDER_ITEM ADD CONSTRAINT FK_ESPM_SALES_ORDER_ITEM_SALES_ORDER_ITEM_ID FOREIGN KEY (SALES_ORDER_ITEM_ID) REFERENCES ESPM_SALES_ORDER_HEADER (SALES_ORDER_ID)
ALTER TABLE ESPM_STOCK ADD CONSTRAINT FK_ESPM_STOCK_PRODUCT_PRODUCT_ID FOREIGN KEY (PRODUCT_PRODUCT_ID) REFERENCES ESPM_PRODUCT (PRODUCT_ID)
CREATE TABLE ESPM_ID_GENERATOR (GENERATOR_NAME VARCHAR(50) NOT NULL, GENERATOR_VALUE NUMERIC(38), PRIMARY KEY (GENERATOR_NAME))
INSERT INTO ESPM_ID_GENERATOR(GENERATOR_NAME, GENERATOR_VALUE) values ('SalesOrder', 499999999)
INSERT INTO ESPM_ID_GENERATOR(GENERATOR_NAME, GENERATOR_VALUE) values ('PurchaseOrder', 299999999)
INSERT INTO ESPM_ID_GENERATOR(GENERATOR_NAME, GENERATOR_VALUE) values ('Customer', 99999999)
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT NUMERIC(38), PRIMARY KEY (SEQ_NAME))
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN', 0)
