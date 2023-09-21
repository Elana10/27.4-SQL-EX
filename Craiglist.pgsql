DROP DATABASE craiglist_db; 
CREATE DATABASE craiglist_db; 
\c craiglist_db;

CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL, 
    region_pref TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY, 
    title VARCHAR(20) NOT NULL, 
    description VARCHAR(100) NOT NULL,
    user INTEGER NOT NULL REFERENCES users,
    location INTEGER NOT NULL REFERENCES location, 
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY, 
    type TEXT UNIQUE NOT NULL
);

CREATE TABLE posts_categories (
    id SERIAL PRIMARY KEY, 
    post INTEGER REFERENCES posts,
    category INTEGER REFERENCES categories
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    area TEXT NOT NULL, 
    region TEXT NOT NULL
);