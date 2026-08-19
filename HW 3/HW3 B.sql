/* Create the schema for our tables */
CREATE TABLE Restaurant(rID int, name varchar2(100), address varchar2(100), cuisine varchar2(100));
CREATE TABLE Reviewer(vID int, name varchar2(100));
CREATE TABLE Rating(rID int, vID int, stars int, ratingDate date);

/* Populate the tables with our data */
INSERT INTO Restaurant VALUES(101, 'India House Restaurant', '59 W Grand Ave Chicago, IL 60654', 'Indian');
INSERT INTO Restaurant VALUES(102, 'Bombay Wraps', '122 N Wells St Chicago, IL 60606', 'Indian');
INSERT INTO Restaurant VALUES(103, 'Rangoli', '2421 W North Ave Chicago, IL 60647', 'Indian');
INSERT INTO Restaurant VALUES(104, 'Cumin', '1414 N Milwaukee Ave Chicago, IL 60622', 'Indian');
INSERT INTO Restaurant VALUES(105, 'Shanghai Inn', '4723 N Damen Ave Chicago, IL 60625', 'Chinese');
INSERT INTO Restaurant VALUES(106, 'MingHin Cuisine', '333 E Benton Pl Chicago, IL 60601', 'Chinese');
INSERT INTO Restaurant VALUES(107, 'Shanghai Terrace', '108 E Superior St Chicago, IL 60611', 'Chinese');
INSERT INTO Restaurant VALUES(108, 'Jade Court', '626 S Racine Ave Chicago, IL 60607', 'Chinese');

INSERT INTO Reviewer VALUES(2001, 'Sarah M.');
INSERT INTO Reviewer VALUES(2002, 'Daniel L.');
INSERT INTO Reviewer VALUES(2003, 'B. Harris');
INSERT INTO Reviewer VALUES(2004, 'P. Suman');
INSERT INTO Reviewer VALUES(2005, 'Suikey S.');
INSERT INTO Reviewer VALUES(2006, 'Elizabeth T.');
INSERT INTO Reviewer VALUES(2007, 'Cameron J.');
INSERT INTO Reviewer VALUES(2008, 'Vivek T.');

INSERT INTO Rating VALUES( 101, 2001,2, DATE '2011-01-22');
INSERT INTO Rating VALUES( 101, 2001,4, DATE '2011-01-27');
INSERT INTO Rating VALUES( 106, 2002,4, null);
INSERT INTO Rating VALUES( 103, 2003,2, DATE '2011-01-20');
INSERT INTO Rating VALUES( 108, 2003,4, DATE '2011-01-12');
INSERT INTO Rating VALUES( 108, 2003,2, DATE '2011-01-30');
INSERT INTO Rating VALUES( 101, 2004,3, DATE '2011-01-09');
INSERT INTO Rating VALUES( 103, 2005,3, DATE '2011-01-27');
INSERT INTO Rating VALUES( 104, 2005,2, DATE '2011-01-22');
INSERT INTO Rating VALUES( 108, 2005,4, null);
INSERT INTO Rating VALUES( 107, 2006,3, DATE '2011-01-15');
INSERT INTO Rating VALUES( 106, 2006,5, DATE '2011-01-19');
INSERT INTO Rating VALUES( 107, 2007,5, DATE '2011-01-20');


--(1)
SELECT restaurant.NAME, rating.stars FROM restaurant
JOIN rating ON restaurant.rID = rating.rID
WHERE rating.stars >= 4
ORDER BY rating.stars ASC;


--(2)
SELECT reviewer.NAME FROM reviewer
JOIN rating ON reviewer.vID = rating.vID
WHERE rating.ratingdate IS NULL;


--(3)
SELECT reviewer.NAME, restaurant.NAME FROM rating
JOIN reviewer ON rating.vID = reviewer.vID 
JOIN restaurant ON rating.rID = restaurant.rID
WHERE rating.stars > (
    SELECT stars
    FROM rating r2
    WHERE r2.vID = rating.vID AND r2.rID = rating.rID AND r2.ratingdate < rating.ratingdate)
ORDER BY reviewer.NAME asc;


--(4)
SELECT NAME, MAX(stars) FROM Restaurant,Rating
WHERE Restaurant.rID = Rating.rID
GROUP BY NAME 
ORDER BY NAME;


--(5)
SELECT NAME, MAX(stars) - MIN(stars) AS ratingspread FROM Restaurant,Rating
WHERE Restaurant.rID=Rating.rID
GROUP BY NAME
ORDER BY ratingspread DESC, NAME;


--(6)
SELECT MAX(AVG) - MIN(AVG) AS difference 
FROM (SELECT AVG(r.stars) AS avg 
FROM rating r, restaurant rs 
WHERE r.rid = rs.rid AND cuisine = 'Indian' UNION
SELECT AVG(r.stars)
FROM rating r, restaurant rs  
WHERE r.rid = rs.rid and cuisine = 'Chinese');


--(7)
SELECT Rating.VID,Reviewer.NAME,
CASE WHEN COUNT(Rating.VID) = 2 THEN 'YES' ELSE 'No' 
END AS " REVIEWED BOTH"
FROM Reviewer, (
    SELECT VID, CUISINE FROM Rating,Restaurant
    WHERE Rating.RID = Restaurant.RID 
    GROUP BY VID, CUISINE) Rating
WHERE Reviewer.VID = Rating.VID
GROUP BY Rating.VID, Reviewer.NAME;
--YES, Suikey S. and B. Harris reviewed both Indian and Chinese restaurants


DROP TABLE Restaurant;
DROP TABLE  Reviewer;
DROP TABLE  Rating;