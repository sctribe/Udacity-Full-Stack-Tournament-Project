-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Delete database if it already exists

DROP DATABASE IF EXISTS tournament;

-- Creates new database

CREATE DATABASE tournament;
\connect tournament

-- Delete all tables. Views also deleted with CASCADE command
DROP TABLE IF EXISTS player CASCADE;
DROP TABLE IF EXISTS match CASCADE;

--  Create player table
CREATE TABLE player(
	id SERIAL primary key,
	name text
);

-- Create match table

CREATE TABLE match(
	id SERIAL primary key,
	player1 int REFERENCES player(id),
	player2 int REFERENCES player(id),
	winner int
);

-- Create view showing number of wins for Player1.
-- First create seperate view for subquery.

CREATE VIEW sub as
	SELECT * FROM match WHERE winner>0;

CREATE VIEW wins as
	SELECT player.id, count(sub.player2) as wins
	FROM player LEFT JOIN sub
	ON player.id = sub.player1 GROUP BY player.id;

-- Create view showing number of matches each player has played

CREATE VIEW matches_played as
	SELECT player.id, count(match.player2) matches_played
	FROM player LEFT JOIN match
	ON player.id = match.player1 GROUP BY player.id;

-- Create view showing how many wins/matches played each player has

CREATE VIEW leaderboard as
	SELECT player.id, player.name, wins.wins as wins, matches_played.matches_played as matches
	FROM player, wins, matches_played
	WHERE player.id = wins.id and wins.id = matches_played.id;














