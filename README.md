# rVal

##### A wrapper built around the freely accessible Hendrinks API

---

## To do:

- Implement routes:
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

Implement route versions:
- [ ] Get MMR Data (implmented v1, needs v2 & 3)
- [ ] Get MMR Data by PUUID (implmented v1, needs v2 & 3)
---

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

---

### Possible Regions:

- NA
- EU
- KR
- AP
