CREATE TABLE IF NOT EXISTS Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    profile_name VARCHAR(50) NOT NULL,
    real_name VARCHAR(100),
    email VARCHAR(100),
    steamid64 VARCHAR(20) UNIQUE,
    avatar TEXT,
    is_admin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Matches (
    id INT PRIMARY KEY AUTO_INCREMENT,
    created_by INT NOT NULL,
    match_name VARCHAR(100) NOT NULL,
    team1_id INT,
    team2_id INT,
    bo_mode ENUM('bo1', 'bo3', 'bo5') NOT NULL,
    status ENUM('waiting', 'in_progress', 'finished') DEFAULT 'waiting',
    winner_team_id INT,
    password VARCHAR(100),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (created_by) REFERENCES Users(id),
    FOREIGN KEY (team1_id) REFERENCES Teams(id),
    FOREIGN KEY (team2_id) REFERENCES Teams(id),
    FOREIGN KEY (winner_team_id) REFERENCES Teams(id)
);

CREATE TABLE IF NOT EXISTS Teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT NOT NULL,
    teamname VARCHAR(100) NOT NULL,
    captain_id INT NOT NULL,

    FOREIGN KEY (match_id) REFERENCES Matches(id),
    FOREIGN KEY (captain_id) REFERENCES Users(id)
);

CREATE TABLE IF NOT EXISTS Players (
    user_id INT NOT NULL,
    team_id INT NOT NULL,

    PRIMARY KEY (user_id, team_id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE IF NOT EXISTS Maps (
    id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT NOT NULL,
    map_name VARCHAR(50) NOT NULL,
    picked_by INT, -- team_id, NULL if decider
    team_side TINYINT, -- 1 = team1 CT, 2 = team2 CT, NULL = roundknife

    FOREIGN KEY (match_id) REFERENCES Matches(id),
    FOREIGN KEY (picked_by) REFERENCES Teams(id)
);

CREATE TABLE IF NOT EXISTS Map_actions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    map_id INT NOT NULL,
    action_type ENUM('ban', 'pick') NOT NULL,
    team_action INT NOT NULL,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (map_id) REFERENCES Maps(id),
    FOREIGN KEY (team_action) REFERENCES Teams(id)
);
