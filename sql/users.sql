create table users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(50),
	age INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
insert into users (name, email, age) values ('Richmond', 'rbaylay0@live.com', 50);
insert into users (name, email, age) values ('Jordon', 'joday1@prlog.org', 66);
insert into users (name, email, age) values ('Brucie', 'bcrossingham2@wsj.com', 91);
insert into users (name, email, age) values ('Malory', 'mdoog3@yellowpages.com', 7);
insert into users (name, email, age) values ('Win', 'wbaxster4@mtv.com', 5);
insert into users (name, email, age) values ('Andrew', 'adewilde5@ezinearticles.com', 51);
insert into users (name, email, age) values ('Natka', 'nstanistrete6@skyrock.com', 34);
insert into users (name, email, age) values ('Candida', 'csimoneton7@taobao.com', 65);
insert into users (name, email, age) values ('Faydra', 'fcrackel8@dmoz.org', 69);
insert into users (name, email, age) values ( 'Emelita', 'ecrinkley9@chronoengine.com', 19);


-- 1
SELECT * FROM users ORDER BY age DESC;

-- 2
SELECT * FROM users WHERE age>30;

-- 3
SELECT * FROM users ORDER BY created_at DESC LIMIT 5;