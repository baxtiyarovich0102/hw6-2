CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    product_id INT REFERENCES products(id),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT
);



INSERT INTO reviews (user_id, product_id, rating, comment) VALUES
(1, 1, 5, 'Zo‘r mahsulot! Juda tavsiya qilaman.'),
(2, 1, 4, 'Yaxshi, lekin narxi biroz qimmat.'),
(3, 2, 3, 'O‘rtacha, kutganimdek emas.'),
(4, 2, 2, 'Sifat past, yana olmayman.'),
(5, 3, 5, 'Ajoyib! Har doim olaman.'),
(6, 4, 1, 'Umuman yoqmadi. Tavsiya etmayman.'),
(7, 5, 4, 'Yaxshi mahsulot, yetkazib berish tez bo‘ldi.'),
(8, 5, 3, 'Mahsulot yaxshi, lekin qadoqlanish yomon edi.'),
(9, 6, 5, 'Mukammal sifat, rahmat!'),
(10, 7, 2, 'Yaxshi emas. Mahsulot shikastlangan holatda keldi.');



SELECT p.id AS product_id, p.name, AVG(r.rating) AS average_rating
FROM reviews r
JOIN products p ON r.product_id = p.id
GROUP BY p.id
HAVING AVG(r.rating) IS NOT NULL
ORDER BY average_rating DESC;




SELECT p.id AS product_id, p.name, AVG(r.rating) AS average_rating
FROM reviews r
JOIN products p ON r.product_id = p.id
GROUP BY p.id
HAVING AVG(r.rating) > 4.5
ORDER BY average_rating DESC;




SELECT u.id AS user_id, u.name, COUNT(r.id) AS reviews_count
FROM users u
LEFT JOIN reviews r ON u.id = r.user_id
GROUP BY u.id
ORDER BY reviews_count DESC;
