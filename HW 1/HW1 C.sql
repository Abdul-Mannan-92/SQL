CREATE TABLE model (
modelID number(5),
modelBrand varchar(15),
modelName varchar(15),

PRIMARY KEY (modelID)
);

CREATE TABLE cars (
carID number(5),
VIN number(10),
color char(15),
yearOfMake number(4),
model_ID number(4),

PRIMARY KEY (carID),
UNIQUE (VIN),
FOREIGN KEY (model_ID) REFERENCES model(modelID)
);


INSERT INTO model
    VALUES (1, 'Toyota', 'Camry');
    
INSERT INTO model
    VALUES (2, 'Toyota', 'Corolla');
    
INSERT INTO cars
    VALUES (123, 3456783412, 'Red', 2010, 1);
    
INSERT INTO cars
    VALUES (234, 2876309034, 'Blue', 2003, 1);
    
    
    
       
INSERT INTO cars
    VALUES (235, 3456783412, 'Silver', 2010, 1);
    
/*Error starting at line : 35 in command -
INSERT INTO cars
    VALUES (235, 3456783412, 'Silver', 2010, 1)
Error report -
ORA-00001: unique constraint (AMOHA158.SYS_C00509022) violated*/


ALTER TABLE cars DROP CONSTRAINT SYS_C00509022

DELETE FROM model;

/*Error starting at line : 47 in command -
DELETE FROM model
Error report -
ORA-02292: integrity constraint (AMOHA158.SYS_C00509023) violated - child record found*/
    
ALTER TABLE cars DROP CONSTRAINT SYS_C00509023

drop table cars;
drop table model;