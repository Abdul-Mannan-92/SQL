
CREATE TABLE shippers (
  shipper_id integer NOT NULL,
  name varchar(50) NOT NULL,
  
  PRIMARY KEY (shipper_id)
);

INSERT INTO shippers VALUES (1,'Hettinger LLC');
INSERT INTO shippers VALUES (2,'Schinner-Predovic');
INSERT INTO shippers VALUES (3,'Satterfield LLC');
INSERT INTO shippers VALUES (4,'Mraz, Renner and Nolan');
INSERT INTO shippers VALUES (5,'Waters, Mayert and Prohaska');


CREATE TABLE customers (
  customer_id integer NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  birth_date date DEFAULT NULL,
  phone varchar(50) DEFAULT NULL,
  address varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  state char(2) NOT NULL,
  points integer NOT NULL,
  
  PRIMARY KEY (customer_id)
);

INSERT INTO customers 
    VALUES (1,'Babara','MacCaffrey',TO_DATE('1986/03/28', 'yyyy-mm-dd'),'781-932-9754','0 Sage Terrace','Waltham','MA',2273);
    
INSERT INTO customers 
    VALUES (2,'Ines','Brushfield',TO_DATE('1986-04-13', 'yyyy-mm-dd'),'804-427-9456','14187 Commercial Trail','Hampton','VA',947);
    
INSERT INTO customers 
    VALUES (3,'Freddi','Boagey',TO_DATE('1985-02-07', 'yyyy-mm-dd'),'719-724-7869','251 Springs Junction','Colorado Springs','CO',2967);
    
INSERT INTO customers 
    VALUES (4,'Ambur','Roseburgh',TO_DATE('1974-04-14', 'yyyy-mm-dd'),'407-231-8017','30 Arapahoe Terrace','Orlando','FL',457);
    
INSERT INTO customers 
    VALUES (5,'Clemmie','Betchley',TO_DATE('1973-11-07', 'yyyy-mm-dd'),NULL,'5 Spohn Circle','Arlington','TX',3675);
    
INSERT INTO customers 
    VALUES (6,'Elka','Twiddell',TO_DATE('1991-09-04', 'yyyy-mm-dd'),'312-480-8498','7 Manley Drive','Chicago','IL',3073);
    
INSERT INTO customers 
    VALUES (7,'Ilene','Dowson',TO_DATE('1964-08-30', 'yyyy-mm-dd'),'615-641-4759','50 Lillian Crossing','Nashville','TN',1672);
    
INSERT INTO customers 
    VALUES (8,'Thacher','Naseby',TO_DATE('1993-07-17', 'yyyy-mm-dd'),'941-527-3977','538 Mosinee Center','Sarasota','FL',205);
    
INSERT INTO customers 
    VALUES (9,'Romola','Rumgay',TO_DATE('1992-05-23', 'yyyy-mm-dd'),'559-181-3744','3520 Ohio Trail','Visalia','CA',1486);
    
INSERT INTO customers 
    VALUES (10,'Levy','Mynett',TO_DATE('1969-10-13', 'yyyy-mm-dd'),'404-246-3370','68 Lawn Avenue','Atlanta','GA',796);



CREATE TABLE orders (
  order_id integer NOT NULL,
  customer_id integer NOT NULL,
  order_date date NOT NULL,
  comments varchar(2000),
  shipped_date date,
  shipper_id integer,
  
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE,
  FOREIGN KEY (shipper_id) REFERENCES shippers (shipper_id) ON DELETE CASCADE
);


INSERT INTO orders 
    VALUES (1,6,TO_DATE('2019-01-30', 'yyyy-mm-dd'),NULL,NULL,NULL);
    
INSERT INTO orders 
    VALUES (2,7,TO_DATE('2018-08-02', 'yyyy-mm-dd'),NULL,TO_DATE('2018-08-03', 'yyyy-mm-dd'),4);
    
INSERT INTO orders 
    VALUES (3,8,TO_DATE('2017-12-01', 'yyyy-mm-dd'),NULL,NULL,NULL);
    
INSERT INTO orders 
    VALUES (4,2,TO_DATE('2017-01-22', 'yyyy-mm-dd'),NULL,NULL,NULL);
    
INSERT INTO orders 
    VALUES (5,5,TO_DATE('2017-08-25', 'yyyy-mm-dd'),'',TO_DATE('2017-08-26', 'yyyy-mm-dd'),3);
    
INSERT INTO orders 
    VALUES (6,10,TO_DATE('2018-11-18', 'yyyy-mm-dd'),'Aliquam erat volutpat. In congue.',NULL,NULL);
    
INSERT INTO orders 
    VALUES (7,2,TO_DATE('2018-09-22', 'yyyy-mm-dd'),NULL,TO_DATE('2018-09-23', 'yyyy-mm-dd'),4);
    
INSERT INTO orders 
    VALUES (8,5,TO_DATE('2018-06-08', 'yyyy-mm-dd'),'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',NULL,NULL);
    
INSERT INTO orders 
    VALUES (9,10,TO_DATE('2017-07-05', 'yyyy-mm-dd'),'Nulla mollis molestie lorem. Quisque ut erat.',TO_DATE('2017-07-06', 'yyyy-mm-dd'),1);
    
INSERT INTO orders 
    VALUES (10,6,TO_DATE('2018-04-22', 'yyyy-mm-dd'),NULL,TO_DATE('2018-04-23', 'yyyy-mm-dd'),2);



SELECT first_name,last_name
FROM customers 
WHERE STATE = 'IL';



SELECT * FROM customers 
WHERE last_name LIKE 'B%';



SELECT c.first_name, c.last_name FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id 
WHERE EXTRACT (year from o.order_date) = 2018  
ORDER BY order_date;



SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;



SELECT c.first_name, c.last_name 
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.shipped_date IS NULL;




SELECT c.first_name, c.last_name , c.customer_id,count(*) 
FROM customers c 
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name, c.customer_id 
HAVING COUNT(o.customer_id) > 1
ORDER BY COUNT (*);


DROP TABLE orders;
DROP TABLE customers;
DROP TABLE shippers;