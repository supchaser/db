INSERT INTO
    movie (id, title, year, director)
VALUES
    (1, 'Titanic', 1997, 'James Cameron'),
    (2, 'Avatar', 2009, 'James Cameron'),
    (3, 'Inception', 2010, 'Christopher Nolan'),
    (4, 'Interstellar', 2014, 'Christopher Nolan'),
    (5, 'The Dark Knight', 2008, 'Christopher Nolan'),
    (6, 'Pulp Fiction', 1994, 'Quentin Tarantino'),
    (7, 'Django Unchained', 2012, 'Quentin Tarantino'),
    (8, 'Reservoir Dogs', 1992, 'Quentin Tarantino'),
    (9, 'Se7en', 1995, 'David Fincher');

-- Таблица reviewer
INSERT INTO
    reviewer (id, name)
VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith'),
    (3, 'Emily Johnson');

-- Таблица rating
INSERT INTO
    rating (id, reviewer_id, movie_id, stars, rating_date)
VALUES
    (1, 1, 1, 5, '2023-01-01'),
    (2, 2, 2, 4, '2023-01-02'),
    (3, 3, 3, 5, '2023-01-03'),
    (4, 1, 4, 5, '2023-01-04'),
    (5, 2, 5, 5, '2023-01-05'),
    (6, 3, 6, 4, '2023-01-06'),
    (7, 1, 7, 5, '2023-01-07'),
    (8, 2, 8, 4, '2023-01-08'),
    (9, 3, 9, 4, '2023-01-09');
