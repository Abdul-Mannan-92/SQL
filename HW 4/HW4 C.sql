CREATE TABLE SocialNetwork (
    Person       VARCHAR2(25) NOT NULL,
    Friend       VARCHAR2(25) NOT NULL
);

insert into SocialNetwork values ('Amy', 'Brad');
insert into SocialNetwork values ('Amy', 'Christine');
insert into SocialNetwork values ('Amy', 'Edgar');
insert into SocialNetwork values ('Brad', 'Fiona');
insert into SocialNetwork values ('Brad', 'Gary');
insert into SocialNetwork values ('Brad', 'Hannah');
insert into SocialNetwork values ('Christine', 'Hannah');
insert into SocialNetwork values ('Christine', 'Ingrid');
insert into SocialNetwork values ('Christine', 'Dave');
insert into SocialNetwork values ('Dave', 'Ingrid');
insert into SocialNetwork values ('Dave', 'Kate');
insert into SocialNetwork values ('Dave', 'James');
insert into SocialNetwork values ('Dave', 'Leo');
insert into SocialNetwork values ('Edgar', 'Kate');
insert into SocialNetwork values ('Edgar', 'Melissa');
insert into SocialNetwork values ('Edgar', 'Nicole');
insert into SocialNetwork values ('Fiona', 'Amy');    
insert into SocialNetwork values ('Gary', 'Oliver');
insert into SocialNetwork values ('Hannah', 'Quincey');
insert into SocialNetwork values ('James', 'Quincey');
insert into SocialNetwork values ('Melissa', 'Leo');
insert into SocialNetwork values ('Oliver', 'Fiona');
insert into SocialNetwork values ('Oliver', 'Penny');
insert into SocialNetwork values ('Quincey', 'James');



--1
WITH Reaches(person, friend, cnt, path) AS (
    SELECT person, friend, 1, person || '.' || friend FROM socialnetwork
    UNION ALL
    SELECT F.person, R.friend, cnt+1, F.person || '.' || PATH
    FROM socialnetwork F, Reaches R
    WHERE F.person = 'Brad' AND R.person != R.person
)

CYCLE person, friend SET cycle TO 1 DEFAULT 0
SELECT * FROM Reaches;



--2
WITH Reaches(person, friend, cnt, path) AS (
    SELECT person, friend, 1, person || '.' || friend FROM socialnetwork
    UNION all
    SELECT F.person, R.friend, cnt+1, F.person || '.' || PATH
    FROM socialnetwork F, Reaches R
    WHERE R.person != R.person
)

CYCLE person, friend SET cycle TO 1 DEFAULT 0
SELECT person, friend, PATH
FROM Reaches
WHERE PATH NOT LIKE '%Brad%';



--3
WITH Reaches(person, friend, cnt, path) AS (
    SELECT person, friend, 1, person || '.' || friend FROM socialnetwork
    UNION all
    SELECT F.person, R.friend, cnt+1, F.person || '.' || PATH
    FROM socialnetwork F, Reaches R
    WHERE R.friend = 'Christine' AND R.person != R.person
)

CYCLE person, friend SET cycle TO 1 DEFAULT 0
SELECT person, friend, PATH FROM reaches
WHERE PATH NOT LIKE '%Christine%';




--4
WITH Reaches(person, friend, cnt, path) AS (
    SELECT person, friend, 1, person || '.' || friend FROM socialnetwork
    UNION all
    SELECT F.person, R.friend, cnt+1, F.person || '.' || path
    FROM socialnetwork F, Reaches R
    WHERE F.person = 'Amy' AND R.friend = 'James'
)

CYCLE person, friend SET cycle TO 1 DEFAULT 0
SELECT person, friend, PATH FROM reaches
WHERE PATH LIKE 'Amy%James%';


DROP TABLE SocialNetwork;