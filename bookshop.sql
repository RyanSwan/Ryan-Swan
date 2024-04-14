--Create a database called BOOKSHOP
CREATE DATABASE BOOKSHOP;

-- Create a table named 'Book' with specified columns
CREATE TABLE Book (
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(100),
    price NUMERIC(8, 2),
    publication_year INTEGER
);

-- Create another table named 'Order' with specified columns
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES Customer(customer_id),
    order_date DATE,
    total_amount NUMERIC(10, 2)
);

-- Add a new column named publication_year of type integer to the 'Book' table
ALTER TABLE Book
ADD COLUMN publication_year INTEGER;

-- Change the data type of the total_amount column in the 'Orders' table
ALTER TABLE Orders
ALTER COLUMN total_amount TYPE NUMERIC(12, 2);

-- Insert three records into the 'Book' table with the provided information
INSERT INTO Book (book_id, title, author, genre, price, publication_year)
VALUES
    (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 10.99, 1925),
    (2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 12.50, 1960),
    (3, '1984', 'George Orwell', 'Dystopian', 9.95, 1949);

-- Insert three records into the 'Orders' table with the provided information
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2022-01-15', 23.45),
    (102, 2, '2022-02-01', 45.67),
    (103, 3, '2022-03-10', 12.99);

-- Update the price of the book with book_id 1 to $11.99 in the 'Book' table
UPDATE Book
SET price = 11.99
WHERE book_id = 1;

-- Update the order date of the order with order_id 103 to '2022-03-15' in the 'Orders' table
UPDATE Orders
SET order_date = '2022-03-15'
WHERE order_id = 103;

-- Delete the book with book_id 3 from the 'Book' table
DELETE FROM Book
WHERE book_id = 3;

-- Delete the order with order_id 101 from the 'Orders' table
DELETE FROM Orders
WHERE order_id = 101;

-- Retrieve the titles and authors of all books from the 'Book' table
SELECT title, author
FROM Book;

-- Retrieve the titles and authors of books from the 'Book' table where the price is greater than $10.00 and the genre is 'Fiction'
SELECT title, author
FROM Book
WHERE price > 10.00 AND genre = 'Fiction';

-- Calculate the average price of books in the 'Book' table
SELECT AVG(price) AS average_price
FROM Book;

-- Count the total number of orders in the 'Orders' table
SELECT COUNT(*) AS total_orders
FROM Orders;

-- Retrieve the distinct genres from the 'Book' table
SELECT DISTINCT genre
FROM Book;

-- Calculate the total sales (sum of total_amount) from the 'Orders' table
SELECT SUM(total_amount) AS total_sales
FROM Orders;

-- Find the minimum and maximum prices of books in the 'Book' table
SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM Book;

-- Retrieve the titles of books in uppercase from the 'Book' table
SELECT UPPER(title) AS title_uppercase
FROM Book;

-- Retrieve the titles of books in lowercase from the 'Book' table
SELECT LOWER(title) AS title_lowercase
FROM Book;

-- Write an SQL query to retrieve the titles and prices of books, ordering the results by price in descending order
SELECT title, price
FROM Book
ORDER BY price DESC;