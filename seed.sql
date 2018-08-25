-- Used to store data into the database.
-- It deletes the existing table
DROP TABLE IF EXISTS animals;
-- Creates a new table called animal, with these data headings
CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  enclosure_no INT,
  age INT,
  species VARCHAR(255),
  class VARCHAR(255),
  animal_description TEXT
);
-- Creates 4 rows of infomation. Each representing an animal
INSERT INTO animals (name , enclosure_no , age , species , class , animal_description) VALUES ('Sarah' , 52 , 42 , 'Camel' , 'Mamma1' , 'Spits a lot');
INSERT INTO animals (name , enclosure_no , age , species , class , animal_description) VALUES ('Eddy' , 69 , 150 , 'Turtle' , 'Reptile' , 'Really slow');
INSERT INTO animals (name , enclosure_no , age , species , class , animal_description) VALUES ('Markus' , 59 , 5 , 'Kobra' , 'Reptile' , 'Loves to kill');
INSERT INTO animals (name , enclosure_no , age , species , class , animal_description) VALUES ('Morgan' , 66 , 20 , 'Tiger' , 'Mamma1' , 'He loves to eat deer');
