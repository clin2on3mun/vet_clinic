/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered=true AND escape_attempts < 3;
SELECT name, escape_attempts from animals WHERE weight_kg >10.5;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name='Pikachu';
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
SELECT * FROM animals WHERE name NOT IN('Gabumon');

BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM ANIMALS ;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species='digimon'
WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon'
WHERE species is NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > 'jan-1-2022';
SAVEPOINT update;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO delete1;
UPDATE animals SET weight_kg = weight_kg*-1
WHERE weight_kg <0;
SELECT * FROM animals; 
COMMIT;

SELECT COUNT(*) as total_number_of_animals FROM animals;
SELECT COUNT(*) as Never_escaped from animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) as average_weight FROM animals;
SELECT neutered,MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species,MIN(weight_kg) as minimum_weight, MAX(weight_kg) as maximum_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS average_escape_attempts FROM animals WHERE date_of_birth BETWEEN 'jan-1-1990' AND 'dec-31-2000'
GROUP BY species;

SELECT animals.id,owner_id, name from animals
JOIN owners
ON owner_id = owners.ID
WHERE owners.full_name = 'Melody Pond';

SELECT animals.id, species_id, animals.name from animals
JOIN species
ON species_id = species.id
WHERE species.name = 'Pokemon';

SELECT full_name, name from owners
LEFT JOIN animals
ON animals.owner_id = owners.ID;

SELECT species.name, COUNT(animals.id) from species
JOIN animals
ON species.id = species_id
GROUP BY species.name;

SELECT animals.name, owners.full_name from animals
JOIN species
ON species_Id = species.id
JOIN owners
ON owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name='Digimon';

SELECT animals.name,owners.full_name from animals
JOIN owners
ON owner_id = owners.id
WHERE owners.full_name= 'Dean Winchester' AND escape_attempts is NULL;

SELECT owners.full_name, COUNT(animals.id) from animals
JOIN owners
ON owners.id = owner_id
GROUP BY owners.full_name
ORDER BY COUNT DESC
LIMIT 1;

SELECT animals.name from animals
JOIN visits v ON animals.id = v.animal_id
JOIN vets vet ON vet.id = v.vet_id
WHERE vet.name = 'William Tatcher'
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT COUNT(*) as animals from animals
JOIN visits v ON animals.id = v.animal_id
JOIN vets vet ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez';

SELECT vets.name, species.name From vets
FULL OUTER JOIN specializations s ON vets.id = s.vet
FULL OUTER JOIN species ON s.species = species.id;

SELECT animals.name, v.date_of_visit From animals
JOIN VISITS v ON animals.id = v.animal_id
JOIN vets vet ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez' AND V.date_of_visit BETWEEN 'APR-1-2020' AND 'AUG-10-2020';

SELECT animals.id animal_id, animals.name, COUNT(v.id) as visits_count FROM animals
JOIN visits v ON animals.id = v.animal_id
GROUP BY animals.id, animals.name
ORDER BY visits_count DESC
LIMIT 1;

SELECT vets.name,animals.name animal_name, v.date_of_visit FROM vets
JOIN visits v ON v.vet_id = vets.id
JOIN animals ON animals.id = v.animal_id
WHERE vets.name = 'Maisy Smith'
ORDER BY v.date_of_visit ASC
LIMIT 1;

SELECT vets.name vet_name, animals.name animal_name, v.date_of_visit FROM vets 
JOIN visits v ON v.vet_id = vets.id
JOIN animals ON v.animal_id = animals.id
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT COUNT(*) AS num_visit_no_unspecialized  FROM visits
JOIN vets vet ON vet.id = visits.vet_id
JOIN animals  ON animals.id = visits.animal_id
LEFT JOIN specializations s ON s.vet = vet.id AND animals.species_id = s.species
WHERE s.vet is NULL

SELECT species.name AS Recommended_speciality,  COUNT(*) FROM visits v 
JOIN vets vet ON vet.id = v.vet_id
JOIN animals ON animals.id = v.animal_id
JOIN species ON species.id = animals.species_id
WHERE vet.name = 'Maisy Smith'
GROUP BY species.name
LIMIT 1;


