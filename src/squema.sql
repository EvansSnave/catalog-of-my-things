CREATE DATABASE catalog;

CREATE TABLE genres (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE music_albums (
    id INTEGER PRIMARY KEY,
    publish_date DATE NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    label_id INTEGER,
    genre_id INTEGER,
    author_id INTEGER,
    FOREIGN KEY (label_id) REFERENCES labels(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE labels (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  color VARCHAR(100) NOT NULL
);

CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(50) NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT FALSE,
  label_id INT NOT NULL REFERENCES labels (id),
);

CREATE TABLE Games (
    id INT GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN NOT NULL,
    last_payed_at DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (item_id) REFERENCES Item(id)
);

CREATE TABLE Author (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    items INTEGER,
    PRIMARY KEY (id)
);
