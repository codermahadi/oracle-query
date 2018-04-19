CREATE TABLE customers
(
  customer_id NUMBER(10) NOT NULL,
  customer_name VARCHAR2(25) NOT NULL ,
  city VARCHAR2(50),
  CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE newCustomers AS(SELECT * FROM customers WHERE customer_id <2);

CREATE TABLE regularcustomers
(
  IRCUSTOMER_ID NUMBER(10,0) NOT NULL ENABLE ,
  IRCUSTOMER_NAME VARCHAR2(25) NOT NULL ENABLE ,
  IRC_CITY VARCHAR2(50)
);

CREATE TABLE irregularcustomers
(
  RCUSTOMER_ID NUMBER(10,0) NOT NULL ENABLE ,
  RCUSTOMER_NAME VARCHAR2(50) NOT NULL ENABLE ,
  RC_CITY VARCHAR2(50)
);

CREATE TABLE customers3 AS(
    SELECT regularcustomers.IRCUSTOMER_ID, regularcustomers.IRC_CITY,irregularcustomers.RCUSTOMER_NAME
      FROM irregularcustomers,regularcustomers
  WHERE regularcustomers.IRCUSTOMER_ID = irregularcustomers.RCUSTOMER_ID
);

ALTER TABLE customers ADD customer_age VARCHAR2(50);

ALTER TABLE customers
ADD (
  customer_type varchar2(50),
  customer_address varchar2(50)
);

DROP TABLE irregularcustomers;
DROP TABLE NEWCUSTOMERS;
DROP TABLE IRCUSTOMERS PURGE;


ALTER TABLE customers
  MODIFY (
  customer_name VARCHAR2(100),
  customer_type VARCHAR2(250)
  );

ALTER TABLE customers
  DROP COLUMN customer_type;

ALTER TABLE customers RENAME COLUMN customer_name To cname;

ALTER TABLE irregularcustomers RENAME TO ircustomers;


CREATE TABLE SUPPLIERS
(
  supplir_id NUMBER(1,10),
  supplir_name VARCHAR2(100),
  supplir_add VARCHAR2(150)
);

CREATE TABLE ORDERS
(
  order_no NUMBER,
  order_price NUMBER,
  order_qty NUMBER
);

CREATE VIEW sup_order AS
  SELECT SUPPLIERS.supplir_id,ORDERS.order_qty,ORDERS.order_price
    FROM SUPPLIERS
    INNER JOIN ORDERS
      ON SUPPLIERS.supplir_id = supplir_id
  WHERE supplir_name = 'mahadi';

SELECT * FROM sup_order;

SELECT TELECATEGORY.TELE_ID, DIGITAL_TELEFILM.CID, TELECATEGORY.TELE_NAME, DIGITAL_TELEFILM.CATEGORY
  FROM TELECATEGORY
INNER JOIN DIGITAL_TELEFILM
    ON TELECATEGORY.TELE_ID = DIGITAL_TELEFILM.TELE_MAIN_ID;


INSERT INTO SUPPLIERS (supplir_id,supplir_name)
    SELECT TELE_ID, TELE_NAME FROM TELECATEGORY WHERE TELE_ID < 10;

INSERT ALL
INTO SUPPLIERS (supplir_id,supplir_name)VALUES (454,'emon')
INTO ORDERS (order_no,order_price)VALUES (4578,48752)
SELECT * FROM ORDERS;

TRUNCATE TABLE ORDERS;