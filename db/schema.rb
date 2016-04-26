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

ActiveRecord::Schema.define(version: 20160426153939) do

  create_table "players", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "picture"
    t.string "url"
    t.string "team"
  end

  create_table "stats", force: :cascade do |t|
    t.string  "year"
    t.integer "age"
    t.string  "team"
    t.string  "lg"
    t.integer "games"
    t.integer "pa"
    t.integer "ab"
    t.integer "r"
    t.integer "h"
    t.integer "second_base"
    t.integer "third_base"
    t.integer "hr"
    t.integer "rbi"
    t.integer "sb"
    t.integer "cs"
    t.integer "bb"
    t.integer "so"
    t.float   "ba"
    t.float   "obp"
    t.float   "slg"
    t.float   "ops"
    t.integer "player_id"
    t.integer "hbp"
    t.integer "sh"
    t.integer "sf"
  end

end
