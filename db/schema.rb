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

ActiveRecord::Schema.define(version: 2020_06_15_102031) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "court_id"
    t.integer "player_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["court_id"], name: "index_comments_on_court_id"
    t.index ["player_id"], name: "index_comments_on_player_id"
  end

  create_table "courts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", default: 1, null: false
    t.string "floor", null: false
    t.string "fee", default: "無料", null: false
    t.string "available_time", default: "特になし", null: false
    t.string "station", null: false
    t.string "parking", null: false
    t.text "url"
    t.string "court_image_id"
    t.integer "postal_code"
    t.integer "prefecture_code"
    t.string "city"
    t.string "street"
    t.text "address"
    t.text "other"
    t.boolean "is_valid", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_courts_on_id"
    t.index ["name"], name: "index_courts_on_name"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "court_id"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["court_id"], name: "index_favorites_on_court_id"
    t.index ["player_id"], name: "index_favorites_on_player_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "court_id"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["court_id"], name: "index_likes_on_court_id"
    t.index ["player_id"], name: "index_likes_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.text "intro"
    t.string "player_image_id"
    t.integer "position"
    t.integer "history"
    t.string "skill"
    t.integer "fav_courts"
    t.integer "fav_players"
    t.string "twitter"
    t.string "facebook"
    t.string "instagram"
    t.boolean "is_valid", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["id"], name: "index_players_on_id"
    t.index ["name"], name: "index_players_on_name"
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

  create_table "relations", force: :cascade do |t|
    t.integer "following_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "rv_title", null: false
    t.text "rv_body", null: false
    t.float "rate", default: 0.0, null: false
    t.string "rv_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
