| Users | Mô tả |
|-|-|
| id (key) |
| username | Tên đăng nhập |
| password | Mật khẩu đăng nhập |
| profile_name | Tên hiển thị trong trận "[A-Z][a-z][0-9]._" thỏa mãn 3-20 ký tự |
| real_name | Tên thật để dễ nhận biết |
| email | email khôi phục tài khoản |
| steamid64 | Tài khoản Steam được liên kết |
| avatar | Lấy Avatar Steam làm Avatar tài khoản |
| is_admin | Có phải tài khoản Admin không |
| created_at | Thời gian tạo tài khoản |

| Matches | Mô tả |
|-|-|
| id (key) |
| created_by -> User.id | Người tạo trận đấu |
| match_name | Người tạo trận đấu phải đặt tên trận đấu |
| team1_id -> Teams.id | ID của team 1
| team2_id -> Teams.id | ID của team 2
| bo_mode | Hỗ trợ 'bo1', 'bo3', 'bo5'
| status | Trạng thái 'waiting', 'in_progress', 'finished'
| winner_team_id | Đội chiến thắng |
| password | 'NULL' là Public, ngược lại là Private |
| description | Người tạo trận trận đấu mô tả trận đấu |
| created_at | Thời gian tạo trận đấu |

| Teams | Mô tả |
|-|-|
| id (key) |
| match_id -> Matches.id | Team ID thuộc Match ID
| teamname | Tên đội
| captain_id -> Users.id | User ID của đội trưởng

| Players | Mô tả |
|-|-|
| user_id -> Users.id | User ID thuộc Team ID
| team_id -> Teams.id | Team ID chứa User ID

| Maps | Mô tả |
|-|-|
| id (key) |
| match_id -> Matches.id | Map được chọn trong ban/pick |
| map_name | Tên map |
| picked_by -> Teams.id | Map được chọn bởi Team ID, map decider là NULL |
| ct_side_team | '1' là team1 CT, '2' là team2 CT, NULL là roundknife |

| Map_actions | Mô tả |
|-|-|
| id (key) |
| map_id -> Maps.id | Action thuộc Maps ID |
| action_type | 'ban'/'pick' |
| team_action -> Teams.id | Team ID thực hiện action |
| action_time | Thời gian thực hiện action |

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