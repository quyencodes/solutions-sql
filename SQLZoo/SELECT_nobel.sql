# Change the query shown so that it displays Nobel prizes for 1950.
SELECT *
FROM nobel
WHERE yr = 1950

# Show who won the 1962 prize for literature.
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'literature'

# Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

# Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner
FROM nobel
WHERE subject = 'peace' AND yr >= 2000

# Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT *
FROM nobel
WHERE yr BETWEEN 1980 AND 1989 AND subject = 'literature'

# Show all details of the presidential winners:
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

# Show the winners with first name John
SELECT winner
FROM nobel
WHERE LEFT(winner, 4) = 'John'

SELECT winner
FROM nobel
WHERE winner LIKE 'JOHN%'

# Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'physics' AND yr = 1980) OR (subject = 'chemistry' AND yr = 1984)

Show the year, subject, and name of winners for 1980 excluding chemistry and medicine
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('chemistry', 'medicine')

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject <> 'chemistry' AND subject <> 'medicine'

# Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'medicine' AND yr < 1910
OR subject = 'literature' AND yr >= 2004
