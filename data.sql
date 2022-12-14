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

-- join tables
INSERT INTO vets(name,age,date_of_graduation) VALUES('William Tatcher',45,'2000/04/23');
INSERT INTO vets(name,age,date_of_graduation) VALUES('Maisy Smith',26,'2019/01/17');
INSERT INTO vets(name,age,date_of_graduation) VALUES('Stephanie Mendez',64,'1981/05/04');
INSERT INTO vets(name,age,date_of_graduation) VALUES('Jack Harkness',38,'2008/06/08');

INSERT INTO specializations(vets_id,species_id) VALUES((SELECT id FROM vets WHERE name='William Tatcher'),(SELECT id FROM species WHERE name='Pokemon'));
INSERT INTO specializations(vets_id,species_id) VALUES((SELECT id FROM vets WHERE name='Stephanie Mendez'),(SELECT id FROM species WHERE name='Pokemon'));
INSERT INTO specializations(vets_id,species_id) VALUES((SELECT id FROM vets WHERE name='Stephanie Mendez'),(SELECT id FROM species WHERE name='Digimon'));
INSERT INTO specializations(vets_id,species_id) VALUES((SELECT id FROM vets WHERE name='Jack Harkness'),(SELECT id FROM species WHERE name='Digimon'));

INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Agumon'),(SELECT id from vets WHERE name='William Tatcher'), '2020/05/24');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Agumon'),(SELECT id from vets WHERE name='Stephanie Mendez'), '2020/07/22');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Gabumon'),(SELECT id from vets WHERE name='Jack Harkness'), '2021/02/02');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Pikachu'),(SELECT id from vets WHERE name='Maisy Smith'), '2020/01/05');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Pikachu'),(SELECT id from vets WHERE name='Maisy Smith'), '2020/03/08');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Pikachu'),(SELECT id from vets WHERE name='Maisy Smith'), '2020/05/14');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Devimon'),(SELECT id from vets WHERE name='Stephanie Mendez'), '2021/05/04');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Charmander'),(SELECT id from vets WHERE name='Jack Harkness'), '2021/02/24');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Plantmon'),(SELECT id from vets WHERE name='Maisy Smith'), '2019/12/21');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Plantmon'),(SELECT id from vets WHERE name='William Tatcher'), '2020/08/10');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Plantmon'),(SELECT id from vets WHERE name='Maisy Smith'), '2021/04/07');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Squirtle'),(SELECT id from vets WHERE name='Stephanie Mendez'), '2019/09/29');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Angemon'),(SELECT id from vets WHERE name='Jack Harkness'), '2020/10/03');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Angemon'),(SELECT id from vets WHERE name='Jack Harkness'), '2020/11/04');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Boarmon'),(SELECT id from vets WHERE name='Maisy Smith'), '2019/01/24');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Boarmon'),(SELECT id from vets WHERE name='Maisy Smith'), '2019/05/15');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Boarmon'),(SELECT id from vets WHERE name='Maisy Smith'), '2020/02/27');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Boarmon'),(SELECT id from vets WHERE name='Maisy Smith'), '2020/08/03');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Blossom'),(SELECT id from vets WHERE name='Stephanie Mendez'), '2020/05/24');
INSERT INTO visits(animals_id, vets_id, visit_date) VALUES((SELECT id from animals WHERE name='Blossom'),(SELECT id from vets WHERE name='William Tatcher'), '2021/01/11');