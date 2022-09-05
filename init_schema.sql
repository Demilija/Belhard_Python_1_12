CREATE DATABASE film_zone;

USE film_zone;

CREATE TABLE persons(
    -> id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(50) NOT NULL,
    -> surname VARCHAR(50) NOT NULL,
    -> birth_date DATETIME NOT NULL);

CREATE TABLE user_types(
    -> id VARCHAR(50) NOT NULL PRIMARY KEY,
    -> name VARCHAR(50) NOT NULL);

INSERT INTO user_types(id, name) VALUES ('USER', 'User');
INSERT INTO user_types(id, name) VALUES ('ADMIN', 'Administrator');

 CREATE TABLE users(
    -> login VARCHAR(50) NOT NULL PRIMARY KEY,
    -> password VARCHAR(50) NOT NULL,
    -> user_type_id VARCHAR(50) NOT NULL,
    -> person_id INT NOT NULL,
     CONSTRAINT fk_users_user_types FOREIGN KEY (user_type_id)
        REFERENCES user_types (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_users_persons FOREIGN KEY (person_id)
        REFERENCES persons (id)
        ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE emails(
    -> id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -> email VARCHAR(50) NOT NULL,
    -> user_login VARCHAR(50) NOT NULL,
    CONSTRAINT fk_email_users FOREIGN KEY (user_login)
        REFERENCES users (login)
        ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE genres(
    -> id VARCHAR(50) NOT NULL PRIMARY KEY,
    -> name VARCHAR(50) NOT NULL);

mysql> INSERT INTO genres (id, name) VALUES ('ACTION', 'Action');

mysql> INSERT INTO genres (id, name) VALUES ('ADVENTURE', 'Adventure');

mysql> INSERT INTO genres (id, name) VALUES ('COMEDY', 'Comedy');

mysql> INSERT INTO genres (id, name) VALUES ('DRAMA', 'Drama');

mysql> INSERT INTO genres (id, name) VALUES ('CRIME', 'Crime');

mysql> INSERT INTO genres (id, name) VALUES ('SCI-FI', 'Sci-fi');

mysql> INSERT INTO genres (id, name) VALUES ('FANTASY', 'Fantasy');

mysql> INSERT INTO genres (id, name) VALUES ('MUSICAL', 'Musical');

mysql> INSERT INTO genres (id, name) VALUES ('WESTERN', 'Western');

mysql> INSERT INTO genres (id, name) VALUES ('POST-APOCALYPTIC', 'Post-apocalyptic');

mysql> INSERT INTO genres (id, name) VALUES ('WAR', 'War');

mysql> INSERT INTO genres (id, name) VALUES ('FAMILY', 'Family');

mysql> INSERT INTO genres (id, name) VALUES ('LOVE', 'Love story');

mysql> INSERT INTO genres (id, name) VALUES ('CARTOON', 'Cartoon');

mysql> INSERT INTO genres (id, name) VALUES ('HORROR', 'Horror');

mysql> INSERT INTO genres (id, name) VALUES ('THRILLER', 'Thriller');

mysql> INSERT INTO genres (id, name) VALUES ('DOCUMENTARY', 'Documentary');

 CREATE TABLE films(
    -> id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -> duration INT NOT NULL,
    -> name VARCHAR(50) NOT NULL,
    -> release_date DATETIME NOT NULL,
    -> rating FLOAT NOT NULL,
    -> directors_id INT NOT NULL,
    CONSTRAINT fk_films_persons FOREIGN KEY (director_id)
        REFERENCES persons (id)
        ON DELETE CASCADE ON UPDATE CASCADE);

mysql> CREATE TABLE user_favorite_films(
    -> user_login VARCHAR(50) NOT NULL,
    -> film_id INT NOT NULL,
    CONSTRAINT fk_user_favorite_films_users FOREIGN KEY (user_login)
        REFERENCES users (login)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_user_favorite_films_films FOREIGN KEY (film_id)
        REFERENCES films (id)
        ON DELETE CASCADE ON UPDATE CASCADE);

mysql> CREATE TABLE films_genres(
    -> film_id INT NOT NULL,
    -> film_genre_id VARCHAR(50) NOT NULL,
     CONSTRAINT fk_film_genres_films FOREIGN KEY (film_id)
        REFERENCES films (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_film_genres_genres FOREIGN KEY (film_genre_id)
        REFERENCES genres (id)
        ON DELETE CASCADE ON UPDATE CASCADE);

mysql> CREATE TABLE charecters(
    -> id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    -> name VARCHAR(50) NOT NULL,
    -> comment VARCHAR(1000),
    -> film_id INT NOT NULL,
    CONSTRAINT fk_charecters_films FOREIGN KEY (film_id)
        REFERENCES films (id)
        ON DELETE CASCADE ON UPDATE CASCADE);


mysql> CREATE TABLE characters_actors(
    -> character_id INT NOT NULL,
    -> person_id INT NOT NULL,
    CONSTRAINT fk_characters_actors_characters FOREIGN KEY (character_id)
        REFERENCES characters (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_characters_actors_persons FOREIGN KEY (person_id)
        REFERENCES persons (id)
        ON DELETE CASCADE ON UPDATE CASCADE);
