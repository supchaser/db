--Задача 1
--Найти имена всех студентов кто дружит с кем-то по имени Gabriel.
SELECT
    highschooler.name
FROM
    highschooler
    JOIN friend ON highschooler.id = friend.id1
    JOIN highschooler h ON h.id = friend.id2
    AND h.name = 'Gabriel';

--Задача 2
--Для всех студентов, кому понравился кто-то на 2 или более классов младше, 
--чем он вывести имя этого студента и класс, а так же имя и класс студента который ему нравится.
SELECT
    highschooler.name,
    highschooler.grade,
    h.name,
    h.grade
FROM
    highschooler
    JOIN likes ON highschooler.id = likes.id1
    JOIN highschooler h ON h.id = likes.id2
WHERE
    highschooler.grade - h.grade >= 2;

--Задача 3
--Для каждой пары студентов, которые нравятся друг другу взаимно вывести имя и класс обоих студентов.
--Включать каждую пару только 1 раз с именами в алфавитном порядке.
SELECT
    highschooler.name,
    highschooler.grade,
    h.name,
    h.grade
FROM
    highschooler
    JOIN likes ON highschooler.id = likes.id1
    JOIN highschooler h ON h.id = likes.id2
    JOIN likes l ON l.id2 = likes.id1
WHERE
    highschooler.name < h.name
ORDER BY
    highschooler.name;

--Задача 4
--Найти всех студентов, которым никто не нравится и которые никому не нравятся одновременно, вывести их имя и класс. 
--Отсортировать по классу, затем по имени в классе.
SELECT
    highschooler.name,
    highschooler.grade
FROM
    highschooler
    LEFT JOIN likes ON highschooler.id = likes.id1
    OR highschooler.id = likes.id2
WHERE
    likes.id1 IS NULL
    AND likes.id2 IS NULL
ORDER BY
    highschooler.grade,
    highschooler.name;

--через подзапросы
SELECT
    h.name,
    h.grade
FROM
    highschooler h
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            likes l
        WHERE
            l.id1 = h.id
            OR l.id2 = h.id
    )
ORDER BY
    grade,
    name;

--Задача 5 Для каждой ситуации,
--когда студенту A нравится студент B,
--но B никто не нравится,
--вывести имена и классы A и B.
SELECT
    h1.name,
    h1.grade,
    h2.name,
    h2.grade
FROM
    highschooler h1
    JOIN likes l1 ON h1.id = l1.id1
    JOIN highschooler h2 ON h2.id = l1.id2
    LEFT JOIN likes l2 ON h2.id = l2.id1
WHERE
    l2.id1 IS NULL;

--Задача 6
--Найти имена и классы учеников, которые имеют друзей только в том же классе. 
--Вернуть результат, отсортированный по классу, затем имени в классе.
SELECT
    *
FROM
    highschooler AS h1
    JOIN friend AS f1 ON h1.id = f1.id1
    JOIN highschooler AS h2 ON h2.id = f1.id2
    JOIN friend AS f2 ON;

-- Задача 7
--Для каждого студента A, которому нравится студент B, и они не друзья, найти есть ли у них общий друг.
--Для каждой такой тройки вернуть имя и класс A, B, и C.
SELECT
    *
FROM
    highschooler AS A
    JOIN likes AS lA ON lA.id1 = A.id
    LEFT JOIN friend AS fA_l ON lA.id2 = fA_l.id2
    AND A.id = fA_l.id1
    JOIN friend AS fA ON fA.id1 = A.id
    JOIN highschooler AS B ON B.id = lA.id2
    JOIN friend AS fB ON B.id = fB.id1
    JOIN highschooler AS C ON C.id = fB.id2
    AND fA.id2 = fB.id2
WHERE
    fA_l.id1 IS NULL;

-- Задача 11
--Для всех случаев, когда А нравится В, а В нравится С - получите имена и классы А, В и С.
SELECT
    A.name,
    A.grade,
    B.name,
    B.grade,
    C.name,
    C.grade
FROM
    highschooler AS A
    JOIN likes AS l1 ON A.id = l1.id1 -- получаем всех студентов, которым кто то нравится 
    JOIN highschooler AS B ON B.id = l1.id2 -- получаем студентов, которые нравятся A (студенты B)
    JOIN likes AS l2 ON B.id = l2.id1 -- получаем все записи в Likes, в которых присутствуют студенты B, как те, которым кто то нравится
    JOIN highschooler AS C ON C.id = l2.id2;

-- получаем студентов C
-- Модификация
-- Вывести только те тройки, где C не нравится A.
SELECT
    A.name,
    A.grade,
    B.name,
    B.grade,
    C.name,
    C.grade
FROM
    highschooler AS A
    JOIN likes AS l1 ON A.id = l1.id1 -- получаем всех студентов, которым кто то нравится 
    JOIN highschooler AS B ON B.id = l1.id2 -- получаем студентов, которые нравятся A (студенты B)
    JOIN likes AS l2 ON B.id = l2.id1 -- получаем все записи в Likes, в которых присутствуют студенты B, как те, которым кто то нравится
    JOIN highschooler AS C ON C.id = l2.id2 -- получаем студентов C
    JOIN likes AS l3 ON C.id = l3.id1 -- джоиним все записи likes, в которых C учавствует как то, которому кто то нравится
WHERE
    l3.id2 <> A.id;
