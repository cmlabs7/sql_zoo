-- USING NULL

-- 1. 

SELECT name
FROM teacher
WHERE dept IS NULL;

-- 2. 

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3. 

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept ON teacher.dept = dept.id;

-- 4. 

SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id;

-- 5. 

SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile
FROM teacher;

-- 6. 

SELECT teacher.name, COALESCE(dept.name, 'None') as department_name
From teacher
LEFT JOIN dept ON dept.id = teacher.dept;


-- 7. 

SELECT COUNT(teacher.name), COUNT(mobile)
FROM teacher 

-- 8. 

SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name;

-- 9. 

SELECT teacher.name,
CASE 
    WHEN teacher.dept = 1 OR teacher.dept = 2 THEN 'Sci'
    ELSE 'Art'
END AS teacher_dept
FROM teacher;

-- 10. 

SELECT name, 
CASE 
   WHEN teacher.dept = 1 OR teacher.dept = 2 THEN 'Sci'
   WHEN teacher.dept = 3 THEN 'Art'
   ELSE 'None'
END AS teacher_dept
FROM teacher;



