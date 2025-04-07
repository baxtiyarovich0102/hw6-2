create table payments (
	id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(id),
	amount DECIMAL,
	payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO payments (user_id, amount) VALUES (1, 120.50);
INSERT INTO payments (user_id, amount) VALUES (2, 75.00);
INSERT INTO payments (user_id, amount) VALUES (3, 200.00);
INSERT INTO payments (user_id, amount) VALUES (4, 150.25);
INSERT INTO payments (user_id, amount) VALUES (5, 300.00);
INSERT INTO payments (user_id, amount) VALUES (6, 50.00);
INSERT INTO payments (user_id, amount) VALUES (7, 180.75);
INSERT INTO payments (user_id, amount) VALUES (8, 95.50);
INSERT INTO payments (user_id, amount) VALUES (9, 220.00);
INSERT INTO payments (user_id, amount, order_date) VALUES (10, 160.00, '2025-03-30 10:00:00');



SELECT
    u.name,
    SUM(p.amount) AS total_paid
FROM
    payments p,
    users u
WHERE
    p.user_id = u.id
GROUP BY
    u.name
ORDER BY
    total_paid DESC;


    


SELECT 
    u.name,
    p.amount,
    p.payment_date
FROM 
    payments p
JOIN 
    users u ON p.user_id = u.id
WHERE 
    p.payment_date >= CURRENT_DATE - INTERVAL '1 month'
ORDER BY 
    p.payment_date DESC;





SELECT 
    u.name,
    p.amount
FROM 
    payments p
JOIN 
    users u ON p.user_id = u.id
ORDER BY 
    p.amount DESC
LIMIT 1;

