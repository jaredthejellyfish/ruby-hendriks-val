# rVal

A wrapper built around the freely accessible [Hendrinks API](https://docs.henrikdev.xyz/valorant.html)

---

## [Browse the code in your browser!](https://github.dev/jaredthejellyfish/ruby-hendriks-val)

## To do:

- Routes:

  - [x] Get Account Data (_GET /valorant/v1/account/:name/:tag_)
  - [x] Get MMR Data (_GET /valorant/:version/mmr/:name/:tag_)
  - [x] Get MMR Data by PUUID (_GET /valorant/:version/by-puuid/mmr/:region/:puuid_)
  - [x] Get MMR History (_GET /valorant/v1/mmr-history/:region/:name/:tag_)
  - [x] Get MMR History by PUUID (_GET /valorant/v1/by-puuid/mmr-history/:region/:puuid_)
  - [x] Get Match History (_GET /valorant/v3/matches/:region/:name/:tag_)
  - [x] Get Match History by PUUID (_GET /valorant/v3/by-puuid/matches/:region/:puuid_)
  - [x] Get Match Data (_GET /valorant/v2/match/:matchid_)
  - [ ] Get Website Articles (_GET /valorant/v1/website/:country-code_)
  - [ ] Get Leaderboard (_GET /valorant/v1/leaderboard/:region_)
  - [x] Get Server Status (_GET /valorant/v1/status/:region_)
  - [ ] Get Content (_GET /valorant/v1/content_)
  - [ ] Get all available offers (_GET /valorant/v1/store-offers_)
  - [ ] Get Featured Bundle (_GET /valorant/v1/store-featured_)

- Route versions:

  - [ ] Get MMR Data (implmented v1, needs v2 & 3)
  - [ ] Get MMR Data by PUUID (implmented v1, needs v2 & 3)

- Documentation

  - [x] Get Account Data
  - [x] Get MMR Data
  - [x] Get MMR Data by PUUID
  - [x] Get MMR History
  - [x] Get MMR History by PUUID
  - [x] Get Match History
  - [x] Get Match History by PUUID
  - [x] Get Match Data
  - [ ] Get Website Articles
  - [ ] Get Leaderboard
  - [x] Get Server Status
  - [ ] Get Content
  - [ ] Get all available offers
  - [ ] Get Featured Bundle

- Adopt the Ruby GEM scheme

## Rake Tasks:
```sh
rake focus                         # Run rspec on :focus tagged tests
rake loader[type]                  # Generate file loading for single file tests

rake match                         # Run rspec on match.rb
rake matches_history               # Run rspec on matches_history.rb
rake mmr_history                   # Run rspec on mmr_history_spec.rb
rake mmrv1                         # Run rspec on mmr_v1_spec.rb
rake player                        # Run rspec on player.rb
rake rubocop                       # Look for style guide offenses in your code
rake spec                          # Run RSpec code examples
rake user                          # Run rspec on user.rb

rake api                           # Run rspec on valorant_api.rb
rake api:account_data              # Run rspec on account_data()
rake api:fetch_resposne            # Run rspec on fetch_resposne()
rake api:match_data                # Run rspec on match_data()
rake api:matches_history           # Run rspec on matches_history()
rake api:matches_history_by_puuid  # Run rspec on matches_history_by_puuid()
rake api:mmr_data                  # Run rspec on mmr_data()
rake api:mmr_data_by_puuid         # Run rspec on mmr_data_by_puuid()
rake api:mmr_history               # Run rspec on mmr_history()
rake api:mmr_history_by_puuid      # Run rspec on mmr_history_by_puuid()
rake api:server_status             # Run rspec on server_status()
rake api:validate_filter           # Run rspec on validate_filter()
rake api:validate_response         # Run rspec on validate_response()
```
## Documentation: _*(¡WIP!)*_

### Index:

- Account
  - [`account_data(name, tag)`](#account_dataname-tag--user)
- Match
  - [`match_data(match_id)`](#match_datamatch_id--match--player)
  - [`matches_history(name, tag, region)`](#matches_historyname-tag-region--matcheshhistory--match--player)
  - [`matches_history_by_puuid(puuid, region)`](#matches_history_by_puuidpuuid-region--matcheshhistory--match--player)
- MMR
  - [`mmr_data(name, tag, region, version)`](#mmr_dataname-tag-region-version--mmrv1)
  - [`mmr_data_by_puuid(puuid, region, version)`](#mmr_data_by_puuidpuuid-region-version--mmrv1)
  - [`mmr_history(name, tag, region)`](#mmr_historyname-tag-region--mmrhistory--mmrv1)
  - [`mmr_history_by_puuid(puuid, region)`](#mmr_history_by_puuidpuuid-region--mmrhistory--mmrv1)
- Misc
  - [`server_status(region)`](#server_statusregion--hash)

---

### `account_data(name, tag)` → User

Returns a `User` object with instance variables:

- (str) :`puuid`: Unique player identifier.
- (str) :`region`: Region the player is based in [regions](#regions).
- (str) :`name`: Player's name.
- (str) :`tag`: Player's tag.
- (str) :`last_update`: Last time the server updated the data in a human readable format.
  <br/><br/>
- (hash) :`card`:
  - (str) :`small`: URL to the small version of a player's card.
  - (str) :`large`: URL to the large version of a player's card.
  - (str) :`wide`: URL to the wide version of a player's card.
  - (str) :`id`: ID for a player's card.
    <br/><br/>
- (int) :`account_level`: Player's account level.
- (int) :`last_update_raw`: Last time the server updated the data in unix millis.

To run static tests use:

```sh
rake api:account_data
```

<hr style="border-top: 1px dashed gray; background-color: transparent;" />

### `match_data(match_id)` → Match → Player

Returns a `Match` object with instance variables:

- (str) :`game_version`: Version of the game at the time of the match
- (str) :`game_start_patched`: Start time in the format: "Tuesday, November 1, 2022 11:33 PM"
- (str) :`season_id`: ID of the season
- (str) :`platform`: Platform and OS version the user was running at the time of the match.
- (str) :`region`: Region the match was played in. ([possible regions](#regions))
- (str) :`cluster`: Cluster the game was played in (e.g. Madrid)
- (str) :`map`: Map the game was played in. ([possible maps](#maps))
- (str) :`mode`: Game mode of the match ([possible game modes](#filters))
- (str) :`queue`: Queue type for the match ([possible queue types](#queue-types))
- (str) :`matchid`: Match ID for the match
- (str) :`winning_team`: Winning team for the match (`Blue`, `Red`)
  <br/><br/>
- (int) :`rounds_played`: Total number of rounds played
- (int) :`game_length`: Length of the game in milliseconds
- (int) :`game_start`: Start of the game in unix time
- (int) :`red_rounds_won`: Rounds won by the red team
- (int) :`red_rounds_lost`: Rounds lost by the red team
- (int) :`blue_rounds_won`: Rounds won by the blue team
- (int) :`blue_rounds_lost`: Rounds lost by the blue team
  <br/><br/>
- (arr) :`red_team`: All players in the read team as individual player objects.
- (arr) :`blue_team`: All players in the blue team as individual player objects.
- (arr) :`all_players`: All players as individual player objects.

To run static tests use:

```sh
rake api:match_data
```

<hr style="border-top: 1px dashed gray; background-color: transparent;" />

### `matches_history(name, tag, region)` → MatcheshHistory → Match → Player

Returns a `MatcheshHistory` object with instance variable:

- (arr) :`matches`: 5 match objects in an array.

To run static tests use:

```sh
rake api:matches_history
```

<hr style="border-top: 1px dashed gray; background-color: transparent;" />

### `matches_history_by_puuid(puuid, region)` → MatcheshHistory → Match → Player

Returns a `MatcheshHistory` object with instance variable:

- (arr) :`matches`: 5 match objects in an array.

To run static tests use:

```sh
rake api:matches_history_by_puuid
```

<hr style="border-top: 1px dashed gray; background-color: transparent;" />

### `mmr_data(name, tag, region, version)` → MMRV1

Returns an `MMRV1` object with instance variables:

- (int) :`ranking_in_tier`: Current Rank Rating (RR)
- (int) :`mmr_change_to_last_game`: MMR change from the last game
- (int) :`elo`: Match maker rating
- (int) :`currenttier`: Current player rank as int
<br/><br/>
- (str) :`currenttierpatched`: Current player rank in format: "Gold 2"
- (str) :`name`: Player name
- (str) :`tag`: Player tag
<br/><br/>
- (hash) :`images`: 
  - (str) :`small`: Rank logo in small size
  - (str) :`large`: Rank logo in larger size
  - (str) :`triangle_down`: Dorito sub-triangle pointing down
  - (str) :`triangle_up`: Dorito sub-triangle pointing up
<br/><br/>
- (date) :`date`: Date of the data
- (bool) :`old`: _*¿Unknown?*_


To run static tests use:

```sh
rake api:mmr_data
```

<hr style="border-top: 1px dashed gray; background-color: transparent;" />

### `mmr_data_by_puuid(puuid, region, version)` → MMRV1

Returns an `MMRV1` object with instance variables:

- (int) :`ranking_in_tier`: Current Rank Rating (RR)
- (int) :`mmr_change_to_last_game`: MMR change from the last game
- (int) :`elo`: Match maker rating
- (int) :`currenttier`: Current player rank as int
<br/><br/>
- (str) :`currenttierpatched`: Current player rank in format: "Gold 2"
- (str) :`name`: Player name
- (str) :`tag`: Player tag
<br/><br/>
- (hash) :`images`: 
  - (str) :`small`: Rank logo in small size
  - (str) :`large`: Rank logo in larger size
  - (str) :`triangle_down`: Dorito sub-triangle pointing down
  - (str) :`triangle_up`: Dorito sub-triangle pointing up
<br/><br/>
- (date) :`date`: Date of the data
- (bool) :`old`: _*¿Unknown?*_

To run static tests use:

```sh
rake api:mmr_data_by_puuid
```

<hr style="border-top: 1px dashed gray; background-color: transparent;" />

### `mmr_history(name, tag, region)` → MMRHistory → MMRV1

Returns an `MMRHistory` object with instance variable:

- (arr) :`data`: `MMRV1` objects in an array.

To run static tests use:

```sh
rake api:mmr_history
```

<hr style="border-top: 1px dashed gray; background-color: transparent;" />

### `mmr_history_by_puuid(puuid, region)` → MMRHistory → MMRV1

Returns an `MMRHistory` object with instance variable:

- (arr) :`data`: `MMRV1` objects in an array.

To run static tests use:

```sh
rake api:mmr_history_by_puuid
```

<hr style="border-top: 1px dashed gray; background-color: transparent;" />

### `server_status(region)` → Hash

Returns an `Hash` object with keys:

- (arr) :`:maintenances`: Any clusters currently down under maintenance.
- (arr) :`:incidents`: Any cluesters with active incident reports.

To run static tests use:

```sh
rake api:server_status
```

<hr style="border-top: 1px dashed gray; background-color: transparent;" />

## Regions:

| Region | Location |
| :----: | :------- |
|  `na`  | America  |
|  `eu`  | Eurpe    |
|  `kr`  | Asia     |
|  `ap`  | Oceania  |

---

### Filters:

| Game Mode   | Filter                          |
| :---------- | :------------------------------ |
| escalation  | `{endpoint}?filter=escalation`  |
| spikerush   | `{endpoint}?filter=spikerush`   |
| deathmatch  | `{endpoint}?filter=deathmatch`  |
| competitive | `{endpoint}?filter=competitive` |
| unrated     | `{endpoint}?filter=unrated`     |
| replication | `{endpoint}?filter=replication` |

---

### Maps:

| Bind | Haven | Split | Ascent | Icebox | Breeze | Fracture | Pearl |
| ---- | ----- | ----- | ------ | ------ | ------ | -------- | ----- |

---

### Queue types:

Queue type will always match `@mode` unless it is a custom game, then the queue type will designate the game mode played. (`unrated` and `competitive` get replaced by `standard`)
