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

ActiveRecord::Schema[8.0].define(version: 2025_07_06_175136) do
  create_table "accelerometers", force: :cascade do |t|
    t.float "x"
    t.float "y"
    t.float "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  create_table "records", force: :cascade do |t|
    t.datetime "timestamp_begin"
    t.datetime "timestamp_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "timestamp_begin"
    t.datetime "timestamp_end"
  end

  create_table "user_accelerometers", force: :cascade do |t|
    t.float "x"
    t.float "y"
    t.float "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
