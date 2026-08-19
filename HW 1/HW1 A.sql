CREATE TABLE customer (
customerNO number,
name varchar(25),
address varchar(50),

PRIMARY KEY(customerNO)
);

CREATE TABLE order# (
orderNo number,
orderDate date,
cNO number,

PRIMARY KEY (orderNo),
FOREIGN KEY (cNO) REFERENCES customer(customerNO)
);

CREATE TABLE product (
productID number(2),
description varchar(30),
finish varchar(10),
price number(5,2) CHECK (price >= 0 AND price <= 899.99),

PRIMARY KEY (productID)
);

CREATE TABLE request (
orderNO number(5),
productID number(2),
quantity number(*,0) CHECK (quantity >= 1 AND quantity <=5),

PRIMARY KEY (orderNO, productID),
FOREIGN KEY (orderNO) REFERENCES order# (orderNO),
FOREIGN KEY (productID) REFERENCES product (productID)
);

INSERT INTO customer
    VALUES (3, 'Casual furniture', 'Pllano, TX');
    
INSERT INTO customer
    VALUES (8, 'Mountain Gallery', 'Boulder, CO');
    
INSERT INTO product
    VALUES (10, 'Writing desk', 'Oak', NULL);
    
INSERT INTO product
    VALUES (30, 'Dining Table', 'Ash', 425.00);
    
INSERT INTO product
    VALUES (40, 'Entertainment center', 'Maple', 650.00);
    
INSERT INTO product
    VALUES (70, 'Childrens dresser', 'Pine', 300.00);
    
INSERT INTO order#
    VALUES (1006, '24-Mar-10', 3);
    
INSERT INTO order#
    VALUES (1007, '25-Mar-10', 8);
    
INSERT INTO order#
    VALUES (1008, '25-Mar-10', 8);
    
INSERT INTO order#
    VALUES (1009, '26-Mar-10', 3);
    
INSERT INTO request
    VALUES (1006, 10, 4);
    
INSERT INTO request
    VALUES (1006, 30, 2);
    
INSERT INTO request
    VALUES (1006, 40, 1);

INSERT INTO request
    VALUES (1007, 40, 3);

INSERT INTO request
    VALUES (1007, 70, 2);
    
INSERT INTO request
    VALUES (1008, 70, 1);
    
INSERT INTO request
    VALUES (1009, 10, 2);
    
INSERT INTO request
    VALUES (1009, 40, 1);
    

SELECT * FROM customer;

SELECT * FROM order#;

SELECT * FROM product;

SELECT * FROM request;


DROP TABLE request;

DROP TABLE order#;

DROP TABLE product;

DROP TABLE customer;