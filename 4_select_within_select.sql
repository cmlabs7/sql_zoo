-- SELECT WITHIN SELECT

-- 1.

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')


-- 2.

SELECT name
FROM world
WHERE gdp/population > (
  SELECT gdp/population 
  FROM world WHERE name = 'United Kingdom'
  ) 
AND continent = 'EUROPE';

-- 3.

SELECT name, continent
  FROM world
    WHERE continent IN (

    (
    SELECT continent 
    FROM world 
    WHERE name = 'Argentina'
    ), 

    (
    SELECT continent 
    FROM world 
    WHERE name = 'Australia'
    )

)
ORDER BY name;

--4.

SELECT name, population
FROM world
WHERE population >
(
    SELECT population FROM world WHERE name = 'Canada'
    )
AND population <
(
    SELECT population FROM world WHERE name = 'Poland'
    )

-- 5.

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100,0),'%') AS percentage
FROM world
WHERE continent = 'Europe';

-- 6.

SELECT name
FROM world
WHERE gdp >= ALL(SELECT gdp
FROM world
WHERE continent = 'Europe' AND gdp > 0) AND continent != 'Europe';

-- 7.

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

-- 8.

SELECT continent, name 
FROM world x
WHERE name <= ALL(SELECT name FROM world y 
                   WHERE y.continent=x.continent)
ORDER BY continent, name;

-- 9.

SELECT name, continent, population
FROM world x
WHERE continent IN(
SELECT continent FROM world j WHERE 25000000 > (SELECT MAX(population) FROM world k WHERE k.continent=j.continent))
ORDER BY continent, name;


-- 10.

SELECT name, continent
FROM world x
WHERE population >(SELECT MAX(population *3) FROM world y WHERE y.continent = x.continent AND x.name <> y.name);



