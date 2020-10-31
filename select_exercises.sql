USE codeup_test_db;

SELECT 'Pink Floyd albums' AS 'Pink Floyd';

SELECT * FROM albums WHERE artist = 'Pink Floyd';

SELECT 'Sgt. Pepper''s Lonely Hearts Club Band ralease date' as '';

select release_date from albums where name = 'Sgt. Pepper''s Lonely Hearts Club Band';

select genre from albums where name = 'Nevermind';

select name from albums where release_date between 1990 and 1999;

select name from albums where sales < 20;

select name from albums where genre = 'Rock';