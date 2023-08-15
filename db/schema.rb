# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_15_163002) do
  create_table "game_stats", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "player_id", null: false
    t.integer "period"
    t.integer "field_goal_attempted", default: 0
    t.integer "field_goal_made", default: 0
    t.integer "free_throw_attempted", default: 0
    t.integer "free_throw_made", default: 0
    t.integer "three_point_attempted", default: 0
    t.integer "three_point_made", default: 0
    t.integer "fouls", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id", null: false
    t.index ["game_id"], name: "index_game_stats_on_game_id"
    t.index ["player_id"], name: "index_game_stats_on_player_id"
    t.index ["team_id"], name: "index_game_stats_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "local_team_id", null: false
    t.integer "away_team_id", null: false
    t.integer "tournament_id", null: false
    t.date "on_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "local_team_score", default: 0
    t.integer "away_team_score", default: 0
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["local_team_id"], name: "index_games_on_local_team_id"
    t.index ["tournament_id"], name: "index_games_on_tournament_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "doc_number"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_players", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_team_players_on_player_id"
    t.index ["team_id"], name: "index_team_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "tournament_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_teams_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.string "start_date"
    t.string "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "game_stats", "games"
  add_foreign_key "game_stats", "players"
  add_foreign_key "game_stats", "teams"
  add_foreign_key "games", "teams", column: "away_team_id"
  add_foreign_key "games", "teams", column: "local_team_id"
  add_foreign_key "games", "tournaments"
  add_foreign_key "team_players", "players"
  add_foreign_key "team_players", "teams"
  add_foreign_key "teams", "tournaments"
end
