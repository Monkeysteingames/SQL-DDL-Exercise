-- PART ONE: MEDICAL CENTER

DROP DATABASE IF EXISTS medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  phone_number INTEGER
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  phone_number INTEGER
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    diagnosis TEXT,
    treatment TEXT
);

CREATE TABLE client_relationships
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  doctor_id  INTEGER REFERENCES  doctors ON DELETE CASCADE,
  patient_id  INTEGER REFERENCES  patients ON DELETE CASCADE,
  diseases_id  INTEGER REFERENCES  diseases ON DELETE CASCADE
);


-- PART TWO: CRAIGSLIST

DROP DATABASE IF EXISTS craiglist_db;
CREATE DATABASE craiglist_db;
\c craiglist_db;

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  location TEXT NOT NULL
);

CREATE categories
(
  id SERIAL PRIMARY KEY,
  category TEXT UNIQUE
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  preferred_region_id REFERENCES regions ON DELETE SET NULL
);


CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title VARCHAR(20) NOT NULL,
  text TEXT,
  user_id REFERENCES users ON DELETE SET NULL,
  region_id REFERENCES regions ON DELETE SET NULL,
  category_id REFERENCES categories ON DELETE SET NULL
);

-- PART THREE: SOCCER LEAGUE

DROP DATABASE IF EXISTS craiglist_db;
CREATE DATABASE craiglist_db;
\c craiglist_db;


CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE leagues
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  start_date DATE,
  end_date DATE,
  first_place_team INTEGER REFERENCES teams ON DELETE SET NULL,
  last_place_team INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  team_id INTEGER REFERENCES teams ON DELETE SET NULL,
);

CREATE TABLE games
(
  id SERIAL PRIMARY KEY,
  team1 INTEGER REFERENCES teams,
  team2 INTEGER REFERENCES teams,
  winner INTEGER REFERENCES teams,
  referee_id INTEGER REFERENCES referees,
  date DATE 
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players,
  game_id INTEGER REFERENCES games,
  total INTEGER
);