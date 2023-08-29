/*1. Select the code which produces this table*/
SELECT name, population
FROM world
WHERE population BETWEEN 100000 AND 125000

/*2. Pick the result you would obtain from this code:*/
SELECT name, population
FROM world
WHERE name LIKE "Al%";

/*LIKE keyword finds records that follow a certain pattern based on the wildcard given*/

/*3. Select the code which shows the countries that end in A or L*/
SELECT name
FROM world
WHERE name LIKE '%A' OR name LIKE '%L'

/*4. Pick the result from the query*/
SELECT name, LENGTH(name)
FROM world
WHERE LENGTH(name) = 5 AND region='Europe'

/*5. Pick the result you would obtain from this code:*/
SELECT name, area*2 FROM world WHERE population = 64000

"""
name    | blank
Andorra | 936
"""


/*6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000*/
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000

/*7. Select the code that shows the population density of China, Australia, Nigeria and France*/
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Australia', 'Nigeria', 'France')
