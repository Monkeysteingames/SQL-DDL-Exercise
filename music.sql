-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producers TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artists TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
);

CREATE TABLE song_artists
(
  id SERIAL PRIMARY KEY,
  song_id REFERENCES songs ON DELETE CASCADE,
  artist_id REFERENCES artists ON DELETE SET NULL
);


CREATE TABLE songs_producers
(
  id SERIAL PRIMARY KEY,
  song_id REFERENCES songs ON DELETE CASCADE,
  producers_id REFERENCES producers ON DELETE SET NULL
);
