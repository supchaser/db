create table movie (
    id int primary key,
    title text,
    year int,
    director text
);

create table reviewer (id int primary key, name text);

create table rating (
    id int primary key,
    reviewer_id int references reviewer (id),
    movie_id int references movie (id),
    stars int,
    rating_date date
);
