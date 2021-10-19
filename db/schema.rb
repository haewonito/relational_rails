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


ActiveRecord::Schema.define(version: 2021_10_16_040239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adk_mountains", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "high_peak"
    t.integer "elevation"
    t.string "name"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.integer "age"
    t.boolean "alive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hikers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "on_mountain"
    t.integer "phone_num"
    t.string "name"
    t.bigint "adk_mountain_id"
    t.index ["adk_mountain_id"], name: "index_hikers_on_adk_mountain_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "genre"
    t.integer "year"
    t.boolean "used"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["artist_id"], name: "index_records_on_artist_id"
  end

  add_foreign_key "hikers", "adk_mountains"
  add_foreign_key "records", "artists"
end
