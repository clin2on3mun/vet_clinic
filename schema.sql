/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOL,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);
ALTER TABLE animals ADD COLUMN species VARCHAR(30);

CREATE TABLE owners(
    ID INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100),
    age INT,
    PRIMARY KEY(ID)
);

CREATE TABLE species(
    ID INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(30),
    PRIMARY KEY(ID)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INTEGER,
ADD CONSTRAINT fk_species_id FOREIGN KEY(species_id) REFERENCES species(ID);
ALTER TABLE animals ADD COLUMN owner_id INTEGER,
ADD CONSTRAINT fk_owner_id FOREIGN KEY(owner_id) REFERENCES owners(ID);

CREATE TABLE vets (
    ID INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(ID)
);

CREATE TABLE specializations(
   ID INT GENERATED ALWAYS AS IDENTITY,
   vet INT,
   species INT,
   CONSTRAINT fk_vet FOREIGN KEY(vet) REFERENCES vets(ID),
   CONSTRAINT fk_species FOREIGN KEY(species) REFERENCES species(ID),
   PRIMARY KEY(ID)
)

CREATE TABLE visits (
    ID INT GENERATED ALWAYS AS IDENTITY,
    animal_id INT,
    vet_id INT,
    date_of_visit DATE,
    CONSTRAINT fk_animal FOREIGN KEY(animal_id) REFERENCES animals(ID),
    CONSTRAINT fk_vet FOREIGN KEY(vet_id) REFERENCES vets(ID),
    PRIMARY KEY(ID)
)

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_id_idx ON visits(animal_id);
CREATE INDEX vet_id_idx ON visits(vet_id);

CREATE INDEX email_idx ON owners(email);