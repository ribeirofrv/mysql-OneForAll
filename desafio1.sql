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

CREATE TABLE
  followers(
    artist_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT PRIMARY KEY (artist_id, user_id)
  ) engine = InnoDB;

INSERT INTO
  budget_plans (plan_name, price)
VALUES
  ('gratuito', 0.00),
  ('pessoal', 6.99),
  ('universitário', 5.99),
  ('familiar', 7.99);

INSERT INTO
  users (user_name, age, budget_plans_id, signature_date)
VALUES
  ('Thati', 23, 1, '2019-10-20'),
  ('Cintia', 35, 2, '2017-12-30'),
  ('Bill', 20, 3, '2019-06-05'),
  ('Roger', 45, 4, '2020-05-13'),
  ('Norman', 58, 4, '2017-02-17'),
  ('Patrick', 33, 2, '2017-01-06'),
  ('Vivian', 26, 3, '2018-01-05'),
  ('Carol', 19, 3, '2018-02-14'),
  ('Angelina', 42, 2, '2018-04-29'),
  ('Paul', 46, 2, '2017-01-17');
