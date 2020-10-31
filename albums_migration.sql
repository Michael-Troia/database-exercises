USE codeup_test_db;

DROP TABLE IF EXISTS albums;


CREATE TABLE albums(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist varchar(100) NOT NULL,
    name varchar(100) NOT NULL,
    release_date INT UNSIGNED,
    genre varchar(100),
    sales FLOAT UNSIGNED,
    PRIMARY KEY(id),
    UNIQUE (artist,name)
);

# insert into albums(artist, name, release_date, sales, genre)
# values('Michael Jackson', 'Thriller', 1982, 47.3, 'Pop');
select * from albums;

DESCRIBE albums;

# --mysql -u codeup_test_user -p -t < albums_migration.sql
# id — auto-incrementing unsigned integer primary key
# artist — string for storing the recording artist name
# name — string for storing a record name
# release_date — integer representing year record was released
# sales — floating point value for number of records sold (in millions)
# genre — string for storing the record's genre(s)
# GRANT ALL ON *.* TO 'codeup_test_user'@'localhost' WITH GRANT OPTION;