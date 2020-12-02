CREATE TABLE OCCUPATIONS(
    Name VARCHAR(40),
    Occupation VARCHAR(40)
);

SELECT * FROM OCCUPATIONS;

INSERT INTO OCCUPATIONS(Name, Occupation)
VALUES
('Samanatha' , 'Doctor'),
('Julia' , 'Actor'),
('Maria' , 'Actor'),
('Meera' , 'Singer'),
('Ashely' , 'Professor'),
('Ketty' , 'Professor'),
('Christeen' , 'Professor'),
('Jane' , 'Actor'),
('Jenny' , 'Doctor'),
('Priya' , 'Singer');

SELECT * FROM OCCUPATIONS;

SELECT 
(NAME || "(" || substr(OCCUPATION,1,1) || ")") AS 'CLASS'
FROM OCCUPATIONS 
ORDER BY NAME ASC;


SELECT 
("There are total " || count(OCCUPATION) || ' ' || lower(occupation) || "s.")
FROM OCCUPATIONS 
GROUP BY OCCUPATION 
ORDER BY COUNT(OCCUPATION) ASC;


SELECT
select 
min(Doctor),
min(Professor),
min(Singer),
min(Actor)