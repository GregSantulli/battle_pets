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

ActiveRecord::Schema.define(version: 20150616005425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battle_pets", force: :cascade do |t|
    t.string   "name"
    t.integer  "experience"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "battle_pets", ["user_id"], name: "index_battle_pets_on_user_id", using: :btree

  create_table "competitions", force: :cascade do |t|
    t.integer  "winner_id"
    t.string   "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "complete"
    t.integer  "skill_id"
  end

  add_index "competitions", ["winner_id"], name: "index_competitions_on_winner_id", using: :btree

  create_table "pet_competitions", force: :cascade do |t|
    t.integer  "battle_pet_id"
    t.integer  "competition_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pet_competitions", ["battle_pet_id"], name: "index_pet_competitions_on_battle_pet_id", using: :btree
  add_index "pet_competitions", ["competition_id"], name: "index_pet_competitions_on_competition_id", using: :btree

  create_table "pet_skills", force: :cascade do |t|
    t.integer  "level"
    t.integer  "battle_pet_id"
    t.integer  "skill_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "pet_skills", ["battle_pet_id"], name: "index_pet_skills_on_battle_pet_id", using: :btree
  add_index "pet_skills", ["skill_id"], name: "index_pet_skills_on_skill_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "auth_token"
  end

  add_foreign_key "battle_pets", "users"
  add_foreign_key "pet_competitions", "battle_pets"
  add_foreign_key "pet_competitions", "competitions"
end
