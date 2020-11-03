-- # drop database test_db; #reset button
use test_db;
select database();
show tables;
-- # todo setup

describe users;
drop table if exists users;
create table if not exists users (
    id int unsigned not null auto_increment,
    email varchar(50) default null,
    pass varchar(50) default null,
    primary key (id)
    );
truncate users;
insert into users (email, pass)
values ('chonkymonkey@gmail.com','8675309'),
       ('heywhatsup@gmail.com','suchacoolpassword'),
       ('sillyfakeemail@gmail.com','cantguessme');
select * from users;


drop table if exists category;
create table if not exists category (
    id int unsigned not null auto_increment,
    name varchar(50),
    primary key (id)
);
insert into category(name)
values
('auto'),
('electronics'),
('job');
select * from category;


drop table if exists ads;
create table if not exists ads(
    id int unsigned not null auto_increment,
    title varchar(50),
    body varchar(50),
    price int,
    status bool default true,
    user_id int unsigned,
    cat_id int unsigned,
    primary key (id),
    foreign key (user_id) references users (id), # reference users
    foreign key (cat_id) references category (id)# from category
);
insert into ads (title, body, price, status, user_id, cat_id)
values ('buy my car','please buy this! good price',4500,true,1,1),
       ('TV for sale','Probably the best TV in history!',19,true,2,2);
select * from ads;

show tables;

# todo check
select name as 'is electronics id 2?'
from category
where id = 2;


select title, name as 'Category', email as 'from user:'
from ads
join category c on c.id = ads.cat_id
join users u on ads.user_id = u.id;