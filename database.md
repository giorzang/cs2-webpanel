| Users |
|-|
| id (key) |
| username |
| password |
| profile_name |
| real_name |
| email |
| steamid64 |
| avatar |
| is_admin |
| created_at |

| Matches |
|-|
| id (key) |
| created_by -> User.id |
| match_name |
| team1_id -> Teams.id |
| team2_id -> Teams.id |
| bo_mode |
| is_public |
| is_finished |
| winner_team_id |
| password |
| description |
| start_at |
| created_at |

| Teams |
|-|
| id |
| teamname |
| captain_id |

| Players |
|-|
| id |
| user_id -> Users.id |
| team_id -> Teams.id |
| match_id -> Matches.id |

| Maps |
|-|


| Map_actions |


#### Example match_config.json
```javascript
{
  "team1": {
    "name": "Astralis", // default: team_<captain_team1's profile_name>
    "players": {
      "76561197990682262": "Xyp9x",
      "76561198010511021": "gla1ve",
      "76561197979669175": "K0nfig",
      "76561198028458803": "BlameF",
      "76561198024248129": "farlig"
    }
  },
  "team2": {
    "name": "NaVi", // default: team_<captain_team2's profile_name>
    "players": {
      "76561198034202275": "s1mple",
      "76561198044045107": "electronic",
      "76561198246607476": "b1t",
      "76561198121220486": "Perfecto",
      "76561198040577200": "sdy"
    }
  },
  "num_maps": 3, // BO1 = 1, BO3 = 3, BO5 = 5
  "maplist": [
    "de_mirage",
    "de_overpass",
    "de_inferno"
  ],
  "map_sides": [
    "team1_ct", // team1_ct or team1_t
    "team2_ct", // team2_ct or team2_t
    "knife"
  ]
}
```