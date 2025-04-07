create table products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	category VARCHAR(50),
	price VARCHAR(50),
	stock INT
);
insert into products (name, category, price, stock) values ('Sliced Olives', 'Food - Condiments', 1.99, 861);
insert into products (name, category, price, stock) values ('Vegetable Spiralizer', 'Kitchen', 19.99, 977);
insert into products (name, category, price, stock) values ('Garlic Naan Bread', 'Food - Bakery', 3.99, 222);
insert into products (name, category, price, stock) values ('Car Seat Organizer', 'Automotive', 14.99, 858);
insert into products (name, category, price, stock) values ('Terry Cloth Robe', 'Clothing - Loungewear', 59.99, 250);
insert into products (name, category, price, stock) values ('Water Bottle with Built-in Fruit Infuser', 'Fitness', 18.99, 885);
insert into products (name, category, price, stock) values ('Cauliflower Pizza Crust', 'Food - Frozen Foods', 5.99, 199);
insert into products (name, category, price, stock) values ('Dog Training Clicker', 'Pets', 5.99, 319);
insert into products (name, category, price, stock) values ('Satin Slip Dress', 'Clothing - Dresses', 59.99, 444);
insert into products (name, category, price, stock) values ( 'Beef Taco Skillet', 'Food - Meal Kits', 8.49, 918);



-- 1

SELECT category, COUNT(*) AS c FROM products GROUP BY category ORDER BY c;


-- 2

SELECT * FROM products ORDER BY price DESC LIMIT 3;

-- 3

SELECT * FROM products WHERE stock > 500;