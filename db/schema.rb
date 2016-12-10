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

ActiveRecord::Schema.define(version: 20161210052657) do

  create_table "posts", force: :cascade do |t|
    t.string   "title",      default: ""
    t.text     "body",       default: ""
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "asset_img"
  end

  create_table "profiles", force: :cascade do |t|
    t.string  "hometown",       default: ""
    t.string  "favorite_color", default: ""
    t.integer "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name",        default: ""
    t.string   "room_number"
    t.string   "hotel_name",  default: ""
    t.string   "address",     default: ""
    t.string   "city",        default: ""
    t.string   "zip",         default: ""
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: ""
    t.string "last_name",  default: ""
    t.string "email",      default: ""
    t.string "password",   default: ""
    t.string "username"
  end

end
