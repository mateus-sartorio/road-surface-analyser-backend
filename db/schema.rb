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

ActiveRecord::Schema[8.0].define(version: 2025_08_04_234801) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "accelerometers", force: :cascade do |t|
    t.float "x"
    t.float "y"
    t.float "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "record_id", null: false
    t.index ["record_id"], name: "index_accelerometers_on_record_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "model"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyroscopes", force: :cascade do |t|
    t.float "x"
    t.float "y"
    t.float "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "record_id", null: false
    t.index ["record_id"], name: "index_gyroscopes_on_record_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.float "altitude"
    t.float "accuracy"
    t.float "bearing"
    t.float "speed"
    t.datetime "timestamp"
    t.float "speedAccuracy"
    t.float "bearingAccuracyDegrees"
    t.float "verticalAccuracyMeters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "record_id", null: false
    t.index ["record_id"], name: "index_locations_on_record_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "record_id"
    t.index ["record_id"], name: "index_ratings_on_record_id"
  end

  create_table "records", force: :cascade do |t|
    t.datetime "timestamp_begin"
    t.datetime "timestamp_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "travel_id", null: false
    t.index ["travel_id"], name: "index_records_on_travel_id"
  end

  create_table "travels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "timestamp_begin"
    t.datetime "timestamp_end"
    t.integer "device_id", null: false
    t.index ["device_id"], name: "index_travels_on_device_id"
  end

  create_table "user_accelerometers", force: :cascade do |t|
    t.float "x"
    t.float "y"
    t.float "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "record_id", null: false
    t.index ["record_id"], name: "index_user_accelerometers_on_record_id"
  end

  add_foreign_key "accelerometers", "records"
  add_foreign_key "gyroscopes", "records"
  add_foreign_key "locations", "records"
  add_foreign_key "ratings", "records"
  add_foreign_key "records", "travels"
  add_foreign_key "travels", "devices"
  add_foreign_key "user_accelerometers", "records"
end
