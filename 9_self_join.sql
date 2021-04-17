-- SELF JOIN

-- 1. 

SELECT count(a.id) AS num_of_stops
FROM stops a
JOIN stops b ON a.id = b.id;

-- 2. 

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

-- 3. 

SELECT id, name
FROM stops
JOIN route ON stops.id = route.stop
WHERE route.num = '4' AND route.company = 'LRT';

-- 4.  

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5. 

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = (SELECT stops.id FROM stops WHERE name = 'London Road');

-- 6. 

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';

-- 7. 

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
a.company = b.company AND a.num = b.num
WHERE a.stop = 115 AND b.stop = 137;

-- 8. 

SELECT a.company, a.num
FROM route a JOIN route b ON
a.company = b.company AND a.num = b.num
JOIN stops AS stop_a ON a.stop = stop_a.id
JOIN stops AS stop_b ON b.stop = stop_b.id
WHERE stop_a.name = 'Craiglockhart' AND stop_b.name = 'Tollcross';

-- 9. 

SELECT DISTINCT b_stops.name, a_route.company, a_route.num
FROM route AS a_route JOIN route AS b_route ON a_route.company = b_route.company AND a_route.num = b_route.num
JOIN stops AS a_stops ON a_route.stop = a_stops.id
JOIN stops AS b_stops ON b_route.stop = b_stops.id
WHERE a_route.company = 'LRT' AND a_stops.name = 'Craiglockhart'; 

-- 10. 

SELECT DISTINCT 1st.num AS first_bus, 1st.company AS first_company, 
                stops.name AS transfer, 
                2nd.num AS second_bus, 2nd.company AS second_company
FROM (
    SELECT a.company, a.num, b.stop
    -- first self-join
    FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
    WHERE a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')
) AS 1st
JOIN (
    SELECT a.company, a.num, b.stop
    -- second self-join
    FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
    WHERE a.stop = (SELECT id FROM stops WHERE name = 'Lochend')
) AS 2nd
-- join the above two tables on their matching stops
ON 1st.stop = 2nd.stop
JOIN stops ON stops.id = 1st.stop
ORDER BY first_bus, transfer, second_bus;


