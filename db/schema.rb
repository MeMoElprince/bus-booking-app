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

ActiveRecord::Schema[7.0].define(version: 2024_07_19_140349) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.float "cost"
    t.float "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city1_id"
    t.bigint "city2_id"
    t.index ["city1_id"], name: "index_routes_on_city1_id"
    t.index ["city2_id"], name: "index_routes_on_city2_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bus_id", null: false
    t.index ["bus_id"], name: "index_seats_on_bus_id"
  end

  create_table "trips", force: :cascade do |t|
    t.time "departure_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "departure_city_id"
    t.bigint "arrival_city_id"
    t.bigint "bus_id", null: false
    t.index ["arrival_city_id"], name: "index_trips_on_arrival_city_id"
    t.index ["bus_id"], name: "index_trips_on_bus_id"
    t.index ["departure_city_id"], name: "index_trips_on_departure_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "routes", "cities", column: "city1_id"
  add_foreign_key "routes", "cities", column: "city2_id"
  add_foreign_key "seats", "buses"
  add_foreign_key "trips", "buses"
  add_foreign_key "trips", "cities", column: "arrival_city_id"
  add_foreign_key "trips", "cities", column: "departure_city_id"
end
