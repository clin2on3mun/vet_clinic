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
