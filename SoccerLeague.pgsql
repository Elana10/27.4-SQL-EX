DROP DATABASE soccer_league_db; 
CREATE DATABASE soccer_league_db; 
\c soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL 
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL, 
    team INTGER REFERENCES teams, 

);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY, 
    team1 INTEGER REFERENCES teams, 
    team2 INTEGER REFERENCES teams,
    game_num INTEGER REFERENCES games, 
    week INTEGER NOT NULL
);

CREATE TABLE players_gamepoints (
    id SERIAL PRIMARY KEY, 
    player INTEGER REFERENCES players,
    game INTEGER REFERENCES matches, 
    points INTEGER NOT NULL
);

CREATE TABLE refs (
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL,
);

CREATE TABLE refs_matches (
    id SERIAL PRIMARY KEY, 
    match INTEGER REFERENCES matches, 
    ref INTEGER REFERENCES refs
);
