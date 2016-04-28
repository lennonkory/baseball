# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160428171844) do

  create_table "batters", force: :cascade do |t|
    t.integer "second_base"
    t.integer "third_base"
    t.integer "hr"
    t.integer "rbi"
    t.integer "sb"
    t.integer "cs"
    t.integer "bb"
    t.integer "so"
    t.integer "hbp"
    t.integer "sh"
    t.integer "sf"
    t.float   "ba"
    t.float   "obp"
    t.float   "slg"
    t.float   "ops"
    t.integer "player_id"
    t.string  "year"
    t.integer "age"
    t.string  "team"
    t.string  "lg"
    t.integer "games"
    t.integer "pa"
    t.integer "ab"
    t.integer "r"
    t.integer "h"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "player_id"
  end

  create_table "pitchers", force: :cascade do |t|
    t.string  "year"
    t.integer "age"
    t.string  "team"
    t.string  "lg"
    t.integer "w"
    t.integer "l"
    t.float   "wl"
    t.float   "era"
    t.integer "games"
    t.integer "gs"
    t.integer "gf"
    t.integer "cg"
    t.integer "sho"
    t.integer "sv"
    t.float   "ip"
    t.integer "h"
    t.integer "r"
    t.integer "er"
    t.integer "hr"
    t.integer "bb"
    t.integer "so"
    t.integer "hbp"
    t.integer "bk"
    t.integer "wp"
    t.float   "whip"
    t.integer "player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "picture"
    t.string "url"
    t.string "team"
    t.string "position"
    t.string "year"
  end

  create_table "stats", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
