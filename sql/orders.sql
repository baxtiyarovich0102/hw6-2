create table orders (
	id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(id),
	product_id INT REFERENCES products(id),
	quantity INT,
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


insert into orders (user_id, product_id, quantity) values(1, 1, 80);
insert into orders (user_id, product_id, quantity) values(2, 2, 20);
insert into orders (user_id, product_id, quantity) values(3, 3, 30);
insert into orders (user_id, product_id, quantity) values(4, 4, 70);
insert into orders (user_id, product_id, quantity) values(5, 5, 60);
insert into orders (user_id, product_id, quantity) values(6, 6, 30);
insert into orders (user_id, product_id, quantity) values(7, 7, 100);
insert into orders (user_id, product_id, quantity) values(8, 8, 20);
insert into orders (user_id, product_id, quantity) values(9, 9, 20);
insert into orders (user_id, product_id, quantity) values(10, 10, 10);



SELECT 
    u.name,
    o.id AS order_id,
    p.name,
    o.quantity,
    o.order_date
FROM 
    orders o
JOIN 
    users u ON o.user_id = u.id
JOIN 
    products p ON o.product_id = p.id
ORDER BY 
    o.order_date DESC;





SELECT 
    p.name,
    COUNT(o.id) AS total_orders
FROM 
    orders o
JOIN 
    products p ON o.product_id = p.id
GROUP BY 
    p.name
ORDER BY 
    total_orders DESC
LIMIT 10;




SELECT 
    u.name,
    p.name,
    o.quantity,
    o.order_date
FROM 
    orders o
JOIN 
    users u ON o.user_id = u.id
JOIN 
    products p ON o.product_id = p.id
WHERE 
    o.order_date >= CURRENT_DATE - INTERVAL '7 days'
ORDER BY 
    o.order_date DESC;