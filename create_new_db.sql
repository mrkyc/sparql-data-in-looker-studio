CREATE DATABASE IF NOT EXISTS mydb;

USE mydb;

CREATE TABLE sparql (
    song VARCHAR(255),
    artist VARCHAR(255),
    artistOrigin VARCHAR(255),
    album VARCHAR(255),
    durationInSeconds INT,
    durationInMinutes DECIMAL(5,2),
    label VARCHAR(255),
    description TEXT
);