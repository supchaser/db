CREATE TABLE highschooler (
    id serial PRIMARY KEY,
    name TEXT NOT NULL,
    grade SMALLINT NOT NULL
);

comment on table highschooler is 'Студент с уникальным ID. Имя и Класс.';

create table friend (
    id1 int not null references highschooler (id),
    id2 int not null references highschooler (id)
);

comment on table friend is 'Студент с id1 друг студента с id2. Дружба взаимная, если есть запись (123, 456), то есть и (456, 123).';

create table likes (
    id1 int not null references highschooler (id),
    id2 int not null references highschooler (id)
);

COMMENT ON TABLE likes IS 'Студенту с id1 нравится студент с id2. Симпатии не взаимны, если есть запись (123, 456), то необязательно есть (456, 123).';
