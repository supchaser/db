INSERT INTO
    highschooler (name, grade)
VALUES
    ('Gabriel', 9),
    ('Alice', 10),
    --
    ('Bob', 9),
    --
    ('Charlie', 7),
    --
    ('David', 12),
    --
    ('Eve', 11),
    --
    ('Frank', 10),
    ('Grace', 8);

--
-- Заполнение таблицы friend
INSERT INTO
    friend (id1, id2)
VALUES
    (1, 3),
    -- Gabriel и Bob
    (3, 1),
    -- Обратная дружба для уверенности
    (2, 7),
    -- Alice и Frank
    (7, 2),
    -- Обратная дружба для уверенности
    (5, 6),
    -- David и Eve
    (6, 5);

-- Обратная дружба для уверенности
INSERT INTO
    friend (id1, id2)
VALUES
    (1, 7),
    -- Gabriel и Frank
    (7, 1);

-- Обратная дружба для уверенности
-- Заполнение таблицы likes
INSERT INTO
    likes (id1, id2)
VALUES
    (2, 4),
    -- Alice нравится Charlie
    (3, 8),
    -- Bob нравится Grace
    (5, 6),
    -- David нравится Eve (взаимная симпатия)
    (6, 5);

-- Eve нравится David (взаимная симпатия)
INSERT INTO
    likes (id1, id2)
VALUES
    (1, 2),
    -- Gabriel нравится Alice
    (4, 1),
    -- Charlie нравится Gabriel
    (3, 7),
    -- Bob нравится Frank
    (8, 2);

-- Grace нравится Alice
INSERT INTO
    highschooler(id, name, grade)
VALUES
    (1, 'Valik', 14),
    (2, 'Goshan The Confluentest', 14),
    (3, 'Kostya', 14);

INSERT INTO
    likes (id1, id2)
VALUES
    (2, 3);

INSERT INTO
    friend (id1, id2)
VALUES
    (2, 1),
    (1, 2),
    (1, 3),
    (3, 1);
