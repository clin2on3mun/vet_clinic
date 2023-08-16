/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon', 'feb-3-2020', 0, true, 10.23),
('Gabumon', 'Nov-15-2018', 2, true, 8),('Pikachu', 'Jan-7-2021', 1, false, 15.04),('Devimon', 'May-12-2017', 5, true, 11);
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Charmander', 'FEB-8-2020', 0,false, -11),
('Plantmon', 'NOV-15-2021',2,true,-5.7),('Squirtle', 'APR-2-1993', 3, false,-12.13),('Angemon', 'jun-12-2005',1,true, -45),
('Boarmon', 'jun-7-2005', 7, true, 20.4),('Blossom', 'OCT-13-1998', 3, true, 17),('Ditto', 'May-14-2022', 4, true, 22);
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),
('Jodie Whittaker', 38);
INSERT INTO species (name) values('Pokemon'),('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name like '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name ='Pokemon')
WHERE species_id is NULL;

UPDATE animals SET owner_id=(SELECT id FROM owners WHERE full_name= 'Sam Smith')
WHERE name = 'Agumon';
UPDATE animals SET owner_id =(SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name= 'Squirtle' OR name='Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon' OR name = 'Boarmon';