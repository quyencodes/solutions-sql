# List each country in the same continent as 'Brazil'.
SELECT name
FROM world
WHERE continent IN
(SELECT continent
FROM world
WHERE name = 'Brazil')

# List each country and its continent in the same continent as 'Brazil' or 'Mexico'.
SELECT name, continent
FROM world
WHERE continent IN
(SELECT continent
FROM world
WHERE name IN ('Brazil', 'Mexico'))

# Show the population of China as a multiple of the population of the United Kingdom
SELECT population / (SELECT population FROM world WHERE name = 'United Kingdom')
FROM world
WHERE name = 'China'

# Show each country that has a population greater than the population of ALL countries in Europe.
SELECT name
FROM world
WHERE population > ALL (SELECT population FROM world WHERE continent = 'Europe')

# List each country name where the population is larger than that of 'Russia'.
SELECT name
FROM world
WHERE population >
ALL (SELECT population
FROM world
WHERE name = 'Russia')

# Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

# List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent
FROM world
WHERE continent IN
(SELECT continent
FROM world
WHERE continent IN ('Americas', 'Oceania'))
ORDER BY name;

# Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
SELECT name, population
FROM world
WHERE population > ALL (SELECT population FROM world WHERE name = 'United Kingdom') AND population < ALL (SELECT population FROM world WHERE name = 'Germany')

# Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name, CONCAT(ROUND(population*100/(SELECT population FROM world WHERE name='Germany'), 2), '%')
FROM world
WHERE continent='Europe'

# Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
FROM world
WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe')