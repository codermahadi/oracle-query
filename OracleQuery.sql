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