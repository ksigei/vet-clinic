/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id int, name VARCHAR(100), date_of_birth date,escape_attempts int, neutered boolean, weight_kg decimal);

-- Add column to animals table
ALTER TABLE animals ADD species VARCHAR(100);
-- query mulitple tables
CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,full_name VARCHAR NOT NULL,age INT NOT NULL);
CREATE TABLE species(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,name VARCHAR NOT NULL);
ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);