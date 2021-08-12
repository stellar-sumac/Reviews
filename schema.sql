-- DROP DATABASE IF EXISTS DnD;

-- CREATE DATABASE DnD;

-- USE DnD;

-- CREATE TABLE favorites
--   (id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   name JSON);


-- radicaldreamer@radicaldreamer-EZbook:~/stellar$ sudo -u postgres psql < schema.sql


drop database IF EXISTS stellar;

-- mysql -u root < server/schema.sql

create database stellar;

\c stellar;

CREATE SCHEMA reviewsAndRatings;



CREATE TABLE reviewer (
  id SERIAL,
  reviewername VARCHAR NOT NULL DEFAULT NULL,
  email VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Reviews (
  id SERIAL,
  product_id INTEGER NOT NULL,
  rating INTEGER NOT NULL DEFAULT 5,
  date BIGINT NULL DEFAULT NULL,
  summary VARCHAR NOT NULL DEFAULT NULL,

  body VARCHAR NOT NULL DEFAULT NULL,
  recommend BOOLEAN NULL DEFAULT false,
  reported BOOLEAN NULL DEFAULT false,
  reviewer_name VARCHAR NULL DEFAULT NULL,
  reviewer_email VARCHAR NULL DEFAULT NULL,
  response VARCHAR NOT NULL DEFAULT NULL,
  helpfulness INTEGER NULL DEFAULT NULL,
  -- characteristics JSON NULL DEFAULT NULL,
  -- reviewerid INTEGER NULL DEFAULT NULL,

  PRIMARY KEY (id)
  -- FOREIGN KEY (reviewerid) REFERENCES reviewer(id)

);



CREATE TABLE Photos (
  id SERIAL,
  review_id INTEGER NOT NULL DEFAULT NULL,
  url VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (id)

);


  -- FOREIGN KEY (review_id) REFERENCES Reviews(id)

COPY reviews(id, product_id, rating, date, summary, body, recommend, reported, reviewer_name, reviewer_email, response, helpfulness)
FROM '/home/radicaldreamer/Desktop/reviews.csv'
DELIMITER ','
CSV HEADER;


COPY photos(id, review_id, url)
FROM '/home/radicaldreamer/Desktop/reviews_photos.csv'
DELIMITER ','
CSV HEADER;


ALTER TABLE Photos
ADD CONSTRAINT photos_constraint
FOREIGN KEY (review_id)
REFERENCES Reviews(id);



-- COPY Reviews(id, product_id, rating, date, summary, body, recommended, reported, reviewer_name, reviewer_email, response, helpfulness)
-- FROM '/home/radicaldreamer/Desktop/persons.csv'
-- DELIMITER ','
-- CSV HEADER;



-- CREATE TABLE Reviews (
--   id SERIAL,
--   product_id INTEGER NOT NULL,
--   rating INTEGER NOT NULL DEFAULT 5,
--   date DATE NULL DEFAULT NULL,
--   summary VARCHAR NOT NULL DEFAULT NULL,

--   body VARCHAR NOT NULL DEFAULT NULL,
--   recommended BOOLEAN NULL DEFAULT false,
--   reported BOOLEAN NULL DEFAULT false,
--   reviewer_name VARCHAR NULL DEFAULT NULL,
--   reviewer_email VARCHAR NULL DEFAULT NULL,
--   response VARCHAR NOT NULL DEFAULT NULL,
--   helpfulness INTEGER NULL DEFAULT NULL,
--   characteristics JSON NULL DEFAULT NULL,
--   reviewerid INTEGER NULL DEFAULT NULL,

--   PRIMARY KEY (id),
--   FOREIGN KEY (reviewerid) REFERENCES Reviewers(id)

-- );





-- COPY Reviews(id, product_id, rating, date, summary, body, recommended, reported, reviewer_name, reviewer_email, response, helpfulness)
-- FROM '/home/radicaldreamer/Desktop/persons.csv'
-- DELIMITER ','
-- CSV HEADER;

