CREATE TABLE Employee (
empID number(7),
SSN number(10),
name varchar(100),
mgrID number(7),

PRIMARY KEY (empID),
UNIQUE (SSN),
FOREIGN KEY (mgrID) REFERENCES Employee(empID)
);
