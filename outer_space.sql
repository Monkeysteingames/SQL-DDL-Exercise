-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE obital_centers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES obital_centers ON DELETE SET NULL,
  galaxy INTEGER REFERENCES galaxies ON DELETE SET NULL,
);

CREATE TABLE planet_moons 
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE,
  moon_id INTEGER REFERENCES moons ON DELETE CASCADE
);
