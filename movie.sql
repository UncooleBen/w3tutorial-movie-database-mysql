DROP DATABASE IF EXISTS db_movie;
CREATE DATABASE db_movie;
USE db_movie;

DROP TABLE IF EXISTS movie;
CREATE TABLE movie (
    mov_id integer NOT NULL,
    mov_title character(50),
    mov_year integer,
    mov_time integer,
    mov_lang character(15),
    mov_dt_rel date,
    mov_rel_country character(5),
	PRIMARY KEY (mov_id)
);

DROP TABLE IF EXISTS actor;
CREATE TABLE actor (
    act_id integer NOT NULL,
    act_fname character(20),
    act_lname character(20),
    act_gender character(1),
	PRIMARY KEY (act_id)
);

DROP TABLE IF EXISTS director;
CREATE TABLE director (
    dir_id integer NOT NULL,
    dir_fname character(20),
    dir_lname character(20),
	PRIMARY KEY (dir_id)
);

DROP TABLE IF EXISTS reviewer;
CREATE TABLE reviewer (
    rev_id integer NOT NULL,
    rev_name character(30),
	PRIMARY KEY (rev_id)
);

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
    gen_id integer NOT NULL,
    gen_title character(20),
	PRIMARY KEY (gen_id)
);

DROP TABLE IF EXISTS movie_cast;
CREATE TABLE movie_cast (
    act_id integer NOT NULL,
    mov_id integer NOT NULL,
    role character(30),
	FOREIGN KEY (act_id) REFERENCES actor(act_id),
	FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

DROP TABLE IF EXISTS movie_direction;
CREATE TABLE movie_direction (
    dir_id integer NOT NULL,
    mov_id integer NOT NULL,
	FOREIGN KEY (dir_id) REFERENCES director(dir_id),
	FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

DROP TABLE IF EXISTS movie_genres;
CREATE TABLE movie_genres (
    mov_id integer NOT NULL,
    gen_id integer NOT NULL,
	FOREIGN KEY (gen_id) REFERENCES genres(gen_id),
	FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

DROP TABLE IF EXISTS rating;
CREATE TABLE rating (
    mov_id integer NOT NULL,
    rev_id integer NOT NULL,
    rev_stars numeric(4,2),
    num_o_ratings integer,
	FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id),
	FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'movie.csv' INTO TABLE movie
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'actor.csv' INTO TABLE actor
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'director.csv' INTO TABLE director
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'reviewer.csv' INTO TABLE reviewer
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'genres.csv' INTO TABLE genres
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'rating.csv' INTO TABLE rating
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'movie_genres.csv' INTO TABLE movie_genres
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'movie_cast.csv' INTO TABLE movie_cast
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'movie_direction.csv' INTO TABLE movie_direction
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';




