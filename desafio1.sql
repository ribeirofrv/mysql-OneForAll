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

INSERT INTO
  artists (artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO
  albums (title, release_year, artist_id)
VALUES
  ('Envious', 1990, 1),
  ('Exuberant', 1993, 1),
  ('Hallowed', 1995, 2),
  ('Incandescent', 1998, 3),
  ('Temporary Culture', 2001, 4),
  ('Library of liberty', 2003, 4),
  ('Chained Down', 2007, 5),
  ('Cabinet of fools', 2012, 5),
  ('No guarantees', 2015, 5),
  ('Apparatus', 2015, 6);

INSERT INTO
  songs (track_name, duration, album_id, artist_id)
VALUES
  ('Soul For Us', '0:03:20', 1, 1),
  ('Reflections Of Magic', '0:02:43', 1, 1),
  ('Dance With Her Own', '0:01:56', 1, 1),
  ('Troubles Of My Inner Fire', '0:03:23', 2, 1),
  ('Time Fireworks', '0:02:32', 2, 1),
  ('Magic Circus', '0:01:45', 3, 2),
  ('Honey, So Do I', '0:03:27', 3, 2),
  ('Sweetie, Let\'s Go Wild', '0:02:19', 3, 2),
  ('She Knows', '0:04:04', 3, 2),
  ('Fantasy For Me', '0:01:40', 4, 3),
  ('Celebration Of More', '0:02:26', 4, 3),
  ('Rock His Everything', '0:03:43', 4, 3),
  ('Home Forever', '0:03:51', 4, 3),
  ('Diamond Power', '0:04:01', 4, 3),
  ('Let\'s Be Silly', '0:02:12', 4, 3),
  ('Thang Of Thunder', '0:04:00', 5, 4),
  ('Words Of Her Life', '0:03:05', 5, 4),
  ('Without My Streets', '0:02:56', 5, 4),
  ('Need Of The Evening', '0:03:10', 6, 4),
  ('History Of My Roses', '0:03:42', 6, 4),
  ('Without My Love', '0:01:51', 6, 4),
  ('Walking And Game', '0:03:49', 6, 4),
  ('Young And Father', '0:03:17', 6, 4),
  ('Finding My Traditions', '0:02:59', 7, 5),
  ('Walking And Man', '0:03:49', 7, 5),
  ('Hard And Time', '0:02:15', 7, 5),
  ('Honey, I\'m A Lone Wolf', '0:02:30', 7, 5),
  ('She Thinks I Won\'t Stay Tonight', '0:02:46', 8, 5),
  ('He Heard You\'re Bad For Me', '0:02:34', 8, 5),
  ('He Hopes We Can\'t Stay', '0:03:30', 8, 5),
  ('I Know I Know', '0:01:57', 8, 5),
  ('He\'s Walking Away', '0:02:39', 9, 5),
  ('He\'s Trouble', '0:02:18', 9, 5),
  ('I Heard I Want To Bo Alone', '0:02:00', 9, 5),
  ('I Ride Alone', '0:02:31', 9, 5),
  ('Honey', '0:01:19', 10, 6),
  ('You Cheated On Me', '0:01:35', 10, 6),
  ('Wouldn\'t It Be Nice', '0:03:33', 10, 6),
  ('Baby', '0:02:16', 10, 6),
  ('You Make Me Feel So..', '0:01:23', 10, 6);

INSERT INTO
  followers (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);

INSERT INTO
  history (user_id, track_id, reproduction_date)
VALUES
  (1, 36, '2020-02-28 10:45:55'),
  (1, 25, '2020-05-02 05:30:35'),
  (1, 23, '2020-03-06 11:22:33'),
  (1, 14, '2020-08-05 08:05:17'),
  (1, 15, '2020-09-14 16:32:22'),
  (2, 34, '2020-01-02 07:40:33'),
  (2, 24, '2020-05-16 06:16:22'),
  (2, 21, '2020-10-09 12:27:48'),
  (2, 39, '2020-09-21 13:14:46'),
  (3, 6, '2020-11-13 16:55:13'),
  (3, 3, '2020-12-05 18:38:30'),
  (3, 26, '2020-07-30 10:00:00'),
  (4, 2, '2021-08-15 17:10:10'),
  (4, 35, '2021-07-10 15:20:30'),
  (4, 27, '2021-01-09 01:44:33'),
  (5, 7, '2020-07-03 19:33:28'),
  (5, 12, '2017-02-24 21:14:22'),
  (5, 14, '2020-08-06 15:23:43'),
  (5, 1, '2020-11-10 13:52:27'),
  (6, 38, '2019-02-07 20:33:48'),
  (6, 29, '2017-01-24 00:31:17'),
  (6, 30, '2017-10-12 12:35:20'),
  (6, 22, '2018-05-29 14:56:41'),
  (7, 5, '2018-05-09 22:30:49'),
  (7, 4, '2020-07-27 12:52:58'),
  (7, 11, '2018-01-16 18:40:43'),
  (8, 39, '2018-03-21 16:56:40'),
  (8, 40, '2020-10-18 13:38:05'),
  (8, 32, '2019-05-25 08:14:03'),
  (8, 33, '2021-08-15 21:37:09'),
  (9, 16, '2021-05-24 17:23:45'),
  (9, 17, '2018-12-07 22:48:52'),
  (9, 8, '2021-03-14 06:14:26'),
  (9, 9, '2020-04-01 03:36:00'),
  (10, 20, '2017-02-06 08:21:34'),
  (10, 21, '2017-12-04 05:33:43'),
  (10, 12, '2017-07-27 05:24:49'),
  (10, 13, '2017-12-25 01:03:57');
