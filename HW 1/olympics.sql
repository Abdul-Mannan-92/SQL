-- Athletes Table
CREATE TABLE Athletes (
    AthleteID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Country VARCHAR2(50)
);

INSERT INTO Athletes (AthleteID, FirstName, LastName, Country)
VALUES (1, 'Usain', 'Bolt', 'Jamaica');

INSERT INTO Athletes (AthleteID, FirstName, LastName, Country)
VALUES (2, 'Simone', 'Biles', 'USA');

-- Sports Table
CREATE TABLE Sports (
    SportID NUMBER PRIMARY KEY,
    SportName VARCHAR2(50)
);

INSERT INTO Sports (SportID, SportName)
VALUES (101, 'Athletics');

INSERT INTO Sports (SportID, SportName)
VALUES (201, 'Gymnastics');

-- Events Table
CREATE TABLE Events (
    EventID NUMBER PRIMARY KEY,
    EventName VARCHAR2(50),
    SportID NUMBER,
    CONSTRAINT fk_sport FOREIGN KEY (SportID) REFERENCES Sports(SportID)
);

INSERT INTO Events (EventID, EventName, SportID)
VALUES (1, '100m Sprint', 101);

INSERT INTO Events (EventID, EventName, SportID)
VALUES (2, 'Vault', 201);

-- Medals Table
CREATE TABLE Medals (
    MedalID NUMBER PRIMARY KEY,
    AthleteID NUMBER,
    EventID NUMBER,
    MedalType VARCHAR2(10),
    CONSTRAINT fk_athlete FOREIGN KEY (AthleteID) REFERENCES Athletes(AthleteID),
    CONSTRAINT fk_event FOREIGN KEY (EventID) REFERENCES Events(EventID)
);

INSERT INTO Medals (MedalID, AthleteID, EventID, MedalType)
VALUES (1, 1, 1, 'Gold');

INSERT INTO Medals (MedalID, AthleteID, EventID, MedalType)
VALUES (2, 2, 2, 'Silver');

SELECT * FROM Athletes;


UPDATE Athletes
SET Country = 'Jamaica'
WHERE AthleteID = 1;

SELECT * FROM Athletes;

SELECT * FROM Events;


SELECT * FROM Medals;
UPDATE Medals
SET MedalType = 'Platinum'
WHERE MedalType = 'Gold';

DELETE FROM Events
WHERE EventID = 2;

CREATE TABLE TempTable (
    TempID NUMBER,
    TempName VARCHAR2(50)
);

INSERT INTO TempTable (TempID, TempName) VALUES (1, 'Temporary Data');

DROP TABLE TempTable;



