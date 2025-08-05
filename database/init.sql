CREATE DATABASE IF NOT EXISTS cs2website;
USE cs2website;

CREATE TABLE IF NOT EXISTS Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    passwd VARCHAR(255) NOT NULL,
    profile_name VARCHAR(50) NOT NULL,
    real_name VARCHAR(100),
    email VARCHAR(100),
    steamid64 VARCHAR(20) UNIQUE,
    avatar TEXT,
    is_admin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teamname VARCHAR(100) NOT NULL,
    captain_id INT NOT NULL,

    FOREIGN KEY (captain_id) REFERENCES Users(id)
);

CREATE TABLE IF NOT EXISTS Players (
    user_id INT NOT NULL,
    team_id INT NOT NULL,

    PRIMARY KEY (user_id, team_id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (team_id) REFERENCES Teams(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Matches (
    id INT PRIMARY KEY AUTO_INCREMENT,
    created_by INT NOT NULL,
    match_name VARCHAR(100) NOT NULL,
    team1_id INT,
    team2_id INT,
    bo_mode ENUM('bo1', 'bo3', 'bo5') NOT NULL,
    stt ENUM('waiting', 'in_progress', 'finished') DEFAULT 'waiting',
    winner_team_id INT,
    passwd VARCHAR(100),
    descri TEXT,
    match_date DATETIME,

    FOREIGN KEY (created_by) REFERENCES Users(id),
    FOREIGN KEY (team1_id) REFERENCES Teams(id),
    FOREIGN KEY (team2_id) REFERENCES Teams(id),
    FOREIGN KEY (winner_team_id) REFERENCES Teams(id)
);

CREATE TABLE IF NOT EXISTS Maps (
    id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT NOT NULL,
    map_name VARCHAR(50) NOT NULL,
    action_type ENUM('ban', 'pick') NOT NULL,
    team_action INT,
    team_side ENUM('CT', 'T') NULL,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (match_id) REFERENCES Matches(id),
    FOREIGN KEY (team_action) REFERENCES Teams(id)
);
