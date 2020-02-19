# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_19_160139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.bigint "position_id", null: false
    t.bigint "puzzle_id", null: false
    t.string "last_move"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "expected_position_ids", default: [], array: true
    t.index ["position_id"], name: "index_challenges_on_position_id"
    t.index ["puzzle_id"], name: "index_challenges_on_puzzle_id"
  end

  create_table "continuations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position_ids", default: [], array: true
    t.bigint "challenge_id", null: false
    t.index ["challenge_id"], name: "index_continuations_on_challenge_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "fen"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "puzzles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_attempts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "puzzle_id", null: false
    t.boolean "success"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["puzzle_id"], name: "index_user_attempts_on_puzzle_id"
    t.index ["user_id"], name: "index_user_attempts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "planned_puzzle_ids", default: [], array: true
  end

  add_foreign_key "challenges", "positions"
  add_foreign_key "challenges", "puzzles"
  add_foreign_key "continuations", "challenges"
  add_foreign_key "user_attempts", "puzzles"
  add_foreign_key "user_attempts", "users"
end
