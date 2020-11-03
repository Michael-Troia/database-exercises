# Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

CREATE DATABASE if not exists joins_test_db;
USE joins_test_db;

CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

select * from roles;

select * from users;

# Create a database named join_test_db and run the SQL provided in the Join Example DB section above; to create the same setup used for this lesson.
#
# Insert 4 new users into the database. One should have a NULL role. The other three should be authors.
INSERT INTO users (name, email, role_id)
VALUES ('Moe', 'moe@moe.com',null),
       ('Koe', 'koe@koe.com',2),
       ('Noe','noe@noe.com',2),
       ('Qoe', 'qoe@qoe.com',2);

# Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

select u.name as user_name, r.name as role_name
from users as u
join roles as r
on r.id = u.role_id;

#left join
# select users.name as user_name, roles.name as role_name
# from users
# left join roles r on users.role_id = roles.id;

#right join
select users.name as user_name, roles.name as rolse_name
from users
    right join roles on users.role_id = roles.id;
# Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that have a given role. Hint: You will also need to use group by in the query.
#



