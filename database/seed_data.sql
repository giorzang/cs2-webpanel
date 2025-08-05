USE cs2website;

-- Table: Users
INSERT INTO Users (username, passwd, profile_name, steamid64, avatar, is_admin)
VALUES ('giorzang', 'Giang231205', 'giORZang', '76561199878243134', 'https://avatars.fastly.steamstatic.com/d3a9bc171b2098145a65ccb09cdac5b8f169c2c3_full.jpg', TRUE);
INSERT INTO Users (username, passwd, profile_name, steamid64, avatar)
VALUES 
('usr2', 'pass2', 'User2', '76561199311300905', 'https://avatars.fastly.steamstatic.com/1e5809bb95984eaf130646d7bd208bc9e9023b47_full.jpg'),
('usr3', 'pass3', 'User3', '76561199111194006', 'https://cdn.akamai.steamstatic.com/steamcommunity/public/images/items/2022180/e081bb44f8c79e9b5ae44d1be71aae559d7fcf88.gif'),
('usr4', 'pass4', 'User4', '76561199498765155', 'https://avatars.fastly.steamstatic.com/99dd11addee336535ee7e4f52702c4bf77977850_full.jpg'),
('usr5', 'pass5', 'User5', '76561198413082506', 'https://avatars.fastly.steamstatic.com/15d40cd87f4fdc9f34d3ba5525efa24ffc61afea_full.jpg'),
('usr6', 'pass6', 'User6', '76561199116875924', 'https://avatars.fastly.steamstatic.com/6adf9c780571e1eb6e8c540084160c2c49f088bf_full.jpg'),
('usr7', 'pass7', 'User7', '76561199844655885', 'https://avatars.fastly.steamstatic.com/2ace564a8a9a407f7f98eaca3905d9a17eb834e8_full.jpg'),
('usr8', 'pass8', 'User8', '76561198807995176', 'https://avatars.fastly.steamstatic.com/8daab040cfde9336ebfc07dce146cd1b2df29782_full.jpg'),
('usr9', 'pass9', 'User9', '76561199038292260', 'https://avatars.fastly.steamstatic.com/e1cfab2796d7d000d261d59df194b81617556b47_full.jpg'),
('usr10', 'pass10', 'User10', '76561198892995679', 'https://avatars.fastly.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg'),
('usr11', 'pass11', 'User11', '76561199286596151', 'https://avatars.fastly.steamstatic.com/3fc0a3e1b6cbeaf4b38c44edba4a7f5cafb5611a_full.jpg');
INSERT INTO Users (username, passwd, profile_name)
VALUES 
('usr12', 'pass12', 'User12'),
('usr13', 'pass13', 'User13'),
('usr14', 'pass14', 'User14');


-- Table: Teams
INSERT INTO Teams (teamname, captain_id)
VALUES 
('team_giORZang', '1'),
('team_YangXiao', '2');


-- Table: Players
INSERT INTO Players (user_id, team_id)
VALUES
('1', '1'),
('3', '1'),
('5', '1'),
('7', '1'),
('9', '1'),
('2', '2'),
('4', '2'),
('6', '2'),
('8', '2'),
('10', '2');


-- Table: Matches
INSERT INTO Matches (created_by, match_name, team1_id, team2_id, bo_mode, stt, winner_team_id, match_date)
VALUES
('1', 'AoLang1', '1', '2', 'bo3', 'finished', '1', '2025-08-04 12:00:00'),
('2', 'AoLang2', '2', '1', 'bo1', 'waiting', NULL, '2025-12-25 19:30:00');


-- Table: Maps
INSERT INTO Maps (match_id, map_name, action_type, team_action, team_side)
VALUES 
('1', 'de_overpass', 'ban', '1', NULL),
('1', 'de_train', 'ban', '2', NULL),
('1', 'de_dust2', 'pick', '1', 'CT'),
('1', 'de_mirage', 'pick', '2', 'CT'),
('1', 'de_inferno', 'ban', '1', NULL),
('1', 'de_ancient', 'ban', '2', NULL),
('1', 'de_nuke', 'pick', NULL, NULL);