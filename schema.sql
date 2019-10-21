-- Drop table if exists
DROP TABLE IF EXISTS movies;
-- Create New Table
CREATE TABLE movies (
serial_id INT PRIMARY KEY,
	original_language 	VARCHAR,
	release_date  DATE,
	title  VARCHAR
);

SELECT * FROM movies;

SELECT title
from movies;

SELECT release_date
FROM movies;

SELECT * FROM movies 
WHERE release_date >='2009-05-25'
AND release_date <'2011-05-26'

SELECT * FROM movies where serial_id % 2 = 0;

SELECT * FROM movies
WHERE release_date >='2012-12-01'
AND release_date <'2012-12-31'



-- Drop Table if exists
DROP TABLE books;
-- Create table 
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    book_id INT,
    best_book_id INT,
    work_id INt,
    books_count INT,
    isbn VARCHAR(10000),
    isbn13 BIGINT,
    authors VARCHAR(10000),
    original_publication_year INT,
    original_title VARCHAR(10000),
    title VARCHAR(10000),
    language_code VARCHAR(10000),
    average_rating DECIMAL,
    ratings_count INT,
    work_ratings_count INT,
    work_text_reviews_count INT
);

SELECT * FROM books;

SELECT book_id, coalesce(book_id,0)
FROM books;

SELECT isbn, coalesce(isbn, ‘Unknown’)
FROM books;

SELECT authors, coalesce(authors, ‘Unknown’)
FROM books;

SELECT title, coalesce(title, ‘Unknown’)
FROM books;

SELECT language_code, coalesce(language_code, ‘Unknown’)
FROM books;


--Join tables to display Title
SELECT * from books;
SELECT * from movies;
SELECT original_title, authors, original_publication_year, release_date
from books
INNER JOIN movies ON
movies.title=books.original_title;


--Joined tables to display Authors
SELECT * FROM (
    SELECT original_title, authors, original_publication_year, release_date
    from books
    INNER JOIN movies ON
    movies.title=books.original_title
) combined1
WHERE authors IN(
SELECT authors FROM(
        SELECT authors
        FROM books, movies
        WHERE movies.title=books.original_title
        ) combined2
        Group by authors
        Having count (authors) > 1)


--Earliest Published Book
SELECT * from books;
SELECT * from movies;
SELECT original_title, authors, original_publication_year, release_date
from books
INNER JOIN movies ON
movies.title=books.original_title
WHERE original_publication_year >='0'
AND original_publication_year <'2019'


--Latest Movie Release Date
SELECT * from books;
SELECT * from movies;
SELECT original_title, authors, original_publication_year, release_date
from books
INNER JOIN movies ON
movies.title=books.original_title
WHERE release_date >='2016-01-01'
AND release_date <'2016-12-31'
