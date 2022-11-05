# rVal
##### A wrapper built around the freely accessible Hendrinks API

---
## To do:

- Implement routes:
  - [x] Get Account Data (_GET /valorant/v1/account/:name/:tag_)
  - [ ] Get MMR Data (_GET /valorant/:version/mmr/:name/:tag_)
  - [ ] Get MMR Data by PUUID (_GET /valorant/:version/by-puuid/mmr/:region/:puuid_)
  - [ ] Get MMR History (_GET /valorant/v1/mmr-history/:region/:name/:tag_)
  - [ ] Get MMR History by PUUID (_GET /valorant/v1/by-puuid/mmr-history/:region/:puuid_)
  - [ ] Get Match History (_GET /valorant/v3/matches/:region/:name/:tag_)
  - [ ] Get Match History by PUUID (_GET /valorant/v3/by-puuid/matches/:region/:puuid_)
  - [ ] Get Match Data (_GET /valorant/v2/match/:matchid_)
  - [ ] Get Website Articles (_GET /valorant/v1/website/:country-code_)
  - [ ] Get Leaderboard (_GET /valorant/v1/leaderboard/:region_)
  - [ ] Get Server Status (_GET /valorant/v1/status/:region)
  - [ ] Get Content (_GET /valorant/v1/content_)
  - [ ] Get all available offers (_GET /valorant/v1/store-offers_)
  - [ ] Get Featured Bundle (_GET /valorant/v1/store-featured_)

---
## Rake Tasks:

Run rspec on match.rb
```ruby
  rake match
  ```

Run rspec on player.rb
```ruby
  rake player
  ```

Run rspec on user.rb
```ruby
  rake user
  ```

Run rspec on matches_history.rb
```ruby
  rake history
  ```

Generate file loading for single file tests
```ruby
  rake loader[file_name]
  ```