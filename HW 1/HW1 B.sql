CREATE TABLE Location (
latitude number,
longitude number,
name varchar(50),

PRIMARY KEY (latitude, longitude)
);

INSERT INTO Location
    VALUES (41.881932, -87.623177, 'Chicago');
    
INSERT INTO Location
    VALUES (42.881932, -87.623177, 'Chicago');
    
INSERT INTO Location
    VALUES (41.881932, -86.623177, 'Chicago');
    
    
SELECT * FROM Location;


/*No, these statements doesn't result in the violation because we insert rows with combination of latitude and longitude, which forms PRIMARY KEY/*