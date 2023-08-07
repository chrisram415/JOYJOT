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

ActiveRecord::Schema[7.0].define(version: 2023_08_05_092637) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gamecards", force: :cascade do |t|
    t.boolean "solved", default: false
    t.text "image_url"
    t.bigint "joy_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_gamecards_on_game_id"
    t.index ["joy_id"], name: "index_gamecards_on_joy_id"
  end

  create_table "games", force: :cascade do |t|
    t.boolean "completed", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "joys", force: :cascade do |t|
    t.text "description"
    t.text "fortune"
    t.string "genre"
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating", default: 0
    t.index ["game_id"], name: "index_joys_on_game_id"
    t.index ["user_id"], name: "index_joys_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.text "activity"
    t.integer "rating", default: 0
    t.string "genre"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gamecards", "games"
  add_foreign_key "gamecards", "joys"
  add_foreign_key "games", "users"
  add_foreign_key "joys", "games"
  add_foreign_key "joys", "users"
  add_foreign_key "recommendations", "users"
end
