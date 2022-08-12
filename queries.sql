

/*Queries that provide answers to the questions from all projects.*/
SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016/01/01' AND '2019/12/31';
SELECT name from animals WHERE neutered = TRUE and escape_attempts < 3;
SELECT date_of_birth from animals WHERE name='Agumon' OR name='Pikachu';
SELECT name and escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE name <> 'Gabumon';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
update animals set species='unspecified' where species is null;
SELECT species from animals WHERE species='unspecified';
ROLLBACK;
SELECT * from animals

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species is NULL;
SELECT species from animals WHERE species='unspecified';
COMMIT;
SELECT * from animals

BEGIN;
DELETE * FROM animals;
ROLLBACK;
SELECT * from animals


BEGIN;
-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022/01/01';

-- Create a savepoint for the transaction.
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg=(SELECT weight_kg FROM animals WHERE weight_kg < 0)*-1;
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) from animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT name FROM animals WHERE escape_attempts=(SELECT MAX(escape_attempts) FROM animals);
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990/01/01' AND '2000/12/3