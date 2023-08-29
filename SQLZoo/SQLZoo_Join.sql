# Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player
FROM goal
WHERE teamid = 'GER'

# Show id, stadium, team1, team2 for just game 1012
SELECT id, stadium, team1, team2
FROM game
WHERE game.id = 1012

# Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
FROM game
INNER JOIN goal
ON game.id=goal.matchid
WHERE teamid='GER'

# Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT game.team1, game.team2, goal.player
FROM game
INNER JOIN goal
ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%'

# Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal
INNER JOIN eteam
ON (goal.teamid = eteam.id)
WHERE gtime <= 10

# List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT game.mdate, eteam.teamname
FROM game
INNER JOIN eteam
ON (game.team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos'

# List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM game
INNER JOIN goal
ON (game.id = goal.matchid)
WHERE stadium = 'National Stadium, Warsaw'

# Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
FROM goal
INNER JOIN game
ON (goal.matchid = game.id)
WHERE (team1='GER' OR team2='GER') AND goal.teamid <> 'GER'

# Show teamname and the total number of goals scored.
SELECT eteam.teamname, COUNT(teamid)
FROM eteam
INNER JOIN goal
ON (eteam.id = goal.teamid)
GROUP BY eteam.teamname

# Show the stadium and the number of goals scored in each stadium.
SELECT game.stadium, COUNT(goal.matchid)
FROM game
INNER JOIN goal
ON (game.id = goal.matchid)
GROUP BY game.stadium