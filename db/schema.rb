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

ActiveRecord::Schema[7.0].define(version: 2024_07_19_025550) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "routes", "cities", column: "city1_id"
  add_foreign_key "routes", "cities", column: "city2_id"
end
