SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')



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

SELECT continent, name 
FROM world x
WHERE name <= ALL(SELECT name FROM world y 
                   WHERE y.continent=x.continent)
ORDER BY continent, name;

SELECT name, continent, population
FROM world x
WHERE continent IN(
SELECT continent FROM world j WHERE 25000000 > (SELECT MAX(population) FROM world k WHERE k.continent=j.continent))
ORDER BY continent, name;

SELECT name, continent
FROM world x
WHERE population >(SELECT MAX(population *3) FROM world y WHERE y.continent = x.continent AND x.name <> y.name);

