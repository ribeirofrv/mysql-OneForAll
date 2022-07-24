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
