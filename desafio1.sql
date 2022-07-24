DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE
  budget_plans(
    plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    price INT NOT NULL
  ) engine = InnoDB;

CREATE TABLE
  users(
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    signature_date DATE NOT NULL,
    budget_plans_id INT NOT NULL,
    FOREIGN KEY (budget_plans_id) REFERENCES budget_plans(plan_id)
  ) engine = InnoDB;

CREATE TABLE
  artists(
    artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(50) NOT NULL
  ) engine = InnoDB;

CREATE TABLE
  albums(
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
  ) engine = InnoDB;

CREATE TABLE
  songs(
    track_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    track_name VARCHAR(50) NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    duration TIME NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
  ) engine = InnoDB;

CREATE TABLE
  history(
    user_id INT NOT NULL,
    track_id INT NOT NULL,
    reproduction_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (track_id) REFERENCES songs(track_id),
    CONSTRAINT PRIMARY KEY (user_id, track_id)
  ) engine = InnoDB;
