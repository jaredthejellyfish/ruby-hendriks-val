# rVal

A wrapper built around the freely accessible [Hendrinks API](https://docs.henrikdev.xyz/valorant.html)

---


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
  - [ ] Get Account Data
  - [ ] Get MMR Data
  - [ ] Get MMR Data by PUUID
  - [ ] Get MMR History
  - [ ] Get MMR History by PUUID
  - [ ] Get Match History
  - [ ] Get Match History by PUUID
  - [ ] Get Match Data
  - [ ] Get Website Articles
  - [ ] Get Leaderboard
  - [ ] Get Server Status
  - [ ] Get Content
  - [ ] Get all available offers
  - [ ] Get Featured Bundle

- Adopt the Ruby GEM scheme

## Rake Tasks:

Run rspec on valorant_api.rb
```ruby
rake api
```

Run rspec on :focus tagged tests
```ruby
rake focus
```

Generate file loading for single file tests
```ruby
rake loader[type]
```

Run rspec on match.rb
```ruby
rake match
```

Run rspec on matches_history.rb
```ruby
rake matches_history
```

Run rspec on mmr_history_spec.rb
```ruby
rake mmr_history
```

Run rspec on mmr_v1_spec.rb
```ruby
rake mmrv1
```

Run rspec on player.rb
```ruby
rake player
```

Look for style guide offenses in your code
```ruby
rake rubocop
```

Run RSpec code examples
```ruby
rake spec
```

Run rspec on user.rb
```ruby
rake user
```

## Regions:

- NA
- EU
- KR
- AP


## Documentation:

### `account_data(name, tag)` → User

Returns a `User` object with instance variables:

- (str) :`puuid`: The unique player identifier key.
- (str) :`region`: The region the player is based in [regions](#regions).
- (str) :`name`: The player's name.
- (str) :`tag`: The player's tag.
- (int) :`account_level`: The player's account level.
- (hash) :`card`: 
  - (str) :`small`: Holds the url to the small version of a player's card.
  - (str) :`large`: Holds the url to the large version of a player's card.
  - (str) :`wide`: Holds the url to the wide version of a player's card.
  - (str) :`id`: Holds the id of a player's card.
- (str) :`last_update`: The last time the server updated the data in a human readable format.
- (int) :`last_update_raw`: The last time the server updated the data in unix millis.

To run static tests use: 
```sh 
rake api:account_data
```