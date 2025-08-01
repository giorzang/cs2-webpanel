-- Admin user
INSERT INTO Users (username, password, profile_name, is_admin)
VALUES ('admin', 'adminpass', 'Admin1', TRUE);

-- Captain team1
INSERT INTO Users (username, password, profile_name)
VALUES ('cap1', 'pass1', 'CapOne');

-- Captain team2
INSERT INTO Users (username, password, profile_name)
VALUES ('cap2', 'pass2', 'CapTwo');

-- Thành viên khác
INSERT INTO Users (username, password, profile_name)
VALUES 
('user1', 'u1', 'User1'),
('user2', 'u2', 'User2'),
('user3', 'u3', 'User3'),
('user4', 'u4', 'User4'),
('user5', 'u5', 'User5'),
('user6', 'u6', 'User6'),
('user7', 'u7', 'User7'),
('user8', 'u8', 'User8');

-- Tạo trận đấu
INSERT INTO Matches (created_by, match_name, bo_mode, status)
VALUES (1, 'Match Test BO3', 'bo3', 'waiting');

-- team A
INSERT INTO Teams (match_id, teamname, captain_id)
VALUES (1, 'Team Alpha', 2);

-- team B
INSERT INTO Teams (match_id, teamname, captain_id)
VALUES (1, 'Team Bravo', 3);

-- Gán đội vào trận đấu
UPDATE Matches 
SET team1_id = 1, team2_id = 2 
WHERE id = 1;

-- Team Alpha: captain + 4 thành viên
INSERT INTO Players (user_id, team_id)
VALUES (2, 1), (4, 1), (5, 1), (6, 1), (7, 1);

-- Team Bravo: captain + 4 thành viên
INSERT INTO Players (user_id, team_id)
VALUES (3, 2), (8, 2), (9, 2), (10, 2), (11, 2);

-- INSERT INTO Maps (match_id, map_name)
VALUES 
(1, 'de_mirage'),
(1, 'de_inferno'),
(1, 'de_overpass'),
(1, 'de_nuke'),
(1, 'de_vertigo'),
(1, 'de_ancient'),
(1, 'de_anubis');