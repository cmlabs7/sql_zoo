-- MORE JOIN OPERATIONS

-- 1. 

SELECT id, title
FROM movie
WHERE yr=1962

-- 2. 

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3.

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4. 

SELECT id
FROM actor
WHERE name = 'Glenn Close';

-- 5. 

SELECT id
FROM movie
WHERE title = 'Casablanca';

-- 6. 

SELECT name 
FROM movie
JOIN casting ON movie.id=casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE movie.id = 11768;

-- 7. 

SELECT name 
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE title = 'Alien';

-- 8. 

SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE name = 'Harrison Ford';

-- 9. 

SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE name = 'Harrison Ford' AND ord != 1;

-- 10. 

SELECT title, name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE yr = 1962 AND ord = 1;

-- 11. 

SELECT yr,COUNT(title) AS num_of_movies FROM
  movie JOIN casting ON movie.id = casting.movieid
        JOIN actor   ON actorid = actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12. 

SELECT title, name
FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON actor.id = casting.actorid
    WHERE movieid IN ( SELECT movie.id FROM movie
                      JOIN casting ON movie.id = casting.movieid
                      JOIN actor ON actor.id = casting.actorid
                      WHERE name = 'Julie Andrews' ) 
                    AND ord = 1;

-- 13. 

SELECT name 
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid AND ord = 1
GROUP BY name
HAVING count(name) >= 15
ORDER BY name;

-- 14. 

SELECT title, count(name) AS number
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE yr = 1978
GROUP BY title
ORDER BY number DESC, title

-- 15. 

SELECT name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE movieid IN (SELECT movie.id
     FROM movie
     JOIN casting ON movie.id = casting.movieid
    JOIN actor ON actor.id = casting.actorid
WHERE name = 'Art Garfunkel')
AND name != 'Art Garfunkel';


