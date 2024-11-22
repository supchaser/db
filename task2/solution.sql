-- Задача 15
-- Некоторые режиссеры сняли более чем один фильм. Для всех таких режиссеров, выбрать названия всех фильмов режиссера, его имя. Сортировка по имени режиссера.
--Пример: Titanic,Avatar | James Cameron
SELECT
    STRING_AGG(m.title, ',') AS movie_title_str,
    m.director
FROM
    movie AS m
GROUP BY
    m.director
HAVING
    COUNT(*) > 1
ORDER BY
    m.director;
