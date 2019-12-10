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

ActiveRecord::Schema.define(version: 2019_12_10_213403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arrivals", force: :cascade do |t|
    t.datetime "arrive_at"
    t.bigint "flight_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flight_id"], name: "index_arrivals_on_flight_id"
    t.index ["location_id"], name: "index_arrivals_on_location_id"
  end

  create_table "departures", force: :cascade do |t|
    t.datetime "depart_at"
    t.bigint "flight_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flight_id"], name: "index_departures_on_flight_id"
    t.index ["location_id"], name: "index_departures_on_location_id"
  end

  create_table "flights", force: :cascade do |t|
    t.time "flight_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_flights_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "iata"
    t.string "icao"
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "altitude"
    t.decimal "timezone"
    t.string "dst"
    t.string "tz_olson"
    t.string "data_type"
    t.string "source_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.time "sleep"
    t.time "sleep_duration"
    t.time "wake"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "arrivals", "flights"
  add_foreign_key "arrivals", "locations"
  add_foreign_key "departures", "flights"
  add_foreign_key "departures", "locations"
  add_foreign_key "flights", "users"
end
