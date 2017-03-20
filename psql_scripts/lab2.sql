DROP TABLE script;
DROP TABLE role;
DROP TABLE movie;
DROP TABLE studio;
DROP TABLE person;

CREATE TABLE studio (
  studio_id integer PRIMARY KEY,
  name text
);

CREATE TABLE person (
  person_id serial PRIMARY KEY,
  first_name text,
  last_name text NOT NULL,
  sex char(1) CHECK (sex='M' or sex='F'),
  birthdate date
);

CREATE TABLE movie (
  movie_id serial PRIMARY KEY,
  title text,
  year integer CHECK (year>1900 and year<2100),
  rating text,
  studio_id integer REFERENCES studio(studio_id),
  director_id integer REFERENCES person(person_id)
);

CREATE TABLE script (
  movie_id integer PRIMARY KEY REFERENCES movie(movie_id),
  screenwriter text NOT NULL
);

CREATE TABLE role (
  role_id serial PRIMARY KEY,
  movie_id integer REFERENCES movie(movie_id),
  actor_id integer REFERENCES person(person_id),
  character_name text
);

INSERT INTO studio (studio_id, name) VALUES (1,'Disney');
INSERT INTO studio (studio_id, name) VALUES (2,'Paramount');
INSERT INTO studio (studio_id, name) VALUES (3,'Warner Bros');
INSERT INTO person (first_name, last_name, sex, birthdate)
 VALUES ('Christopher','Nolan','M','1970-07-30');
INSERT INTO person (first_name, last_name, sex, birthdate)
 VALUES ('Breck','Eisner','M','1970-12-24');
INSERT INTO person (first_name, last_name, sex, birthdate)
 VALUES ('Brad','Bird','M','1957-09-24');

INSERT INTO movie (title,year,rating,studio_id,director_id) VALUES
 ('Sahara',2005,'PG-13',2,2),
 ('Interstellar',2014,'PG-13',2,1),
 ('Inception',2010,'PG-13',3,1),
 ('The Incredibles',2004,'PG',1,3),
 ('Ratatouille',2007,'G',1,3);

INSERT INTO script (movie_id,screenwriter) VALUES (1,'Donnelly');

INSERT INTO person (first_name, last_name, sex, birthdate) VALUES
 ('Leonardo','DiCaprio','M','1974-11-11'),
 ('Joseph','Gordon-Levitt','M','1981-02-17'),
 ('Matthew','McConaughey','M','1969-11-04'),
 ('Anne','Hathaway','F','1982-11-12'),
 ('Penelope','Cruz','F','1974-04-28'),
 ('Lou','Romano','M','1972-04-15');

INSERT INTO role (movie_id, actor_id, character_name) VALUES
 (1,6,'Dirk'), (1,8,'Eva'), (2,6,'Coop'), (2,7,'Brand'),
 (3,4,'Cobb'), (3,2,'Arthur'), (4,9,'Bernie'), (5,9,'Linguini');

