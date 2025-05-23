CREATE TABLE IF NOT EXISTS Sales (sale_id INT, product_id INT, YEAR INT, quantity INT, price INT);
CREATE TABLE IF NOT EXISTS Product (product_id INT, product_name VARCHAR(10));
TRUNCATE TABLE Sales;
INSERT INTO Sales (sale_id, product_id, YEAR, quantity, price) VALUES ('1', '100', '2008', '10', '5000');
INSERT INTO Sales (sale_id, product_id, YEAR, quantity, price) VALUES ('2', '100', '2009', '12', '5000');
INSERT INTO Sales (sale_id, product_id, YEAR, quantity, price) VALUES ('7', '200', '2011', '15', '9000');
TRUNCATE TABLE Product;
INSERT INTO Product (product_id, product_name) VALUES ('100', 'Nokia');
INSERT INTO Product (product_id, product_name) VALUES ('200', 'Apple');
INSERT INTO Product (product_id, product_name) VALUES ('300', 'Samsung');

# My solutions ...
SELECT product_name, YEAR, price
FROM Sales
JOIN Product ON Sales.product_id = Product.product_id;

SELECT P.product_name, S.year, S.price
FROM SALES AS S, PRODUCT AS P
WHERE S.product_id=P.product_id;