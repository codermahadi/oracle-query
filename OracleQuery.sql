CREATE TABLE customers
(
  customer_id NUMBER(10) NOT NULL,
  customer_name VARCHAR2(25) NOT NULL ,
  city VARCHAR2(50),
  CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE newCustomers AS(SELECT * FROM customers WHERE customer_id <2);