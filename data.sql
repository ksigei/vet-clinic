/* Populate database with sample data. */
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020/02/03', 10.23, TRUE, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018/11/15', 8, TRUE, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021/01/07', 15.04, FALSE, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017/05/12', 11, TRUE, 5);

-- new data
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', '2020/02/08', -11.0, FALSE, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', '2021/11/15', -5.7, TRUE, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', '1993/04/02', -12.3, FALSE, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', '2005/06/12', -45.0, TRUE, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', '2005/06/07', 20.4, TRUE, 7);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', '1998/10/13', 17.0, TRUE, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Ditto', '2022/05/14', 22.0, TRUE, 4);
-- query mulitple tables
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');
INSERT INTO owners(full_name,age) VALUES('Jodie Whittaker',38);
INSERT INTO owners(full_name,age) VALUES('Dean Winchester',14);
INSERT INTO owners(full_name,age) VALUES('Melody Pond',77);
INSERT INTO owners(full_name,age) VALUES('Bob',45);
INSERT INTO owners(full_name,age) VALUES('Jennifer Orwell',19);
INSERT INTO owners(full_name,age) VALUES('Sam Smith',34);
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name='Pokemon') WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Sam Smith') WHERE name='Agumon';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Jennifer Orwell') WHERE name='Gabumon';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Jennifer Orwell') WHERE name='Pikachu';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Bob') WHERE name='Devimon';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Bob') WHERE name='Plantmon';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Melody Pond') WHERE name='Charmander';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Melody Pond') WHERE name='Squirtle';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Melody Pond') WHERE name='Blossom';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Dean Winchester') WHERE name='Angemon';
UPDATE animals SET owner_id=(SELECT id from owners WHERE full_name='Dean Winchester') WHERE name='Boarmon';