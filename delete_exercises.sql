USE codeup_test_db;

SELECT 'Albums after 1991' AS '';
DELETE FROM albums WHERE release_date > 1991;
SELECT 'Disco genres' AS '';
DELETE FROM albums WHERE genre = 'Disco';
SELECT 'Whitney Houston albums' AS '';
DELETE FROM albums WHERE artist = 'Whitney Houston';
SELECT 'All albums' AS '';
SELECT * from albums;