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

ActiveRecord::Schema.define(version: 2021_09_02_174257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benefits", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "number"
    t.string "owner_name"
    t.string "due_date"
    t.string "cvv"
    t.integer "cuote_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", default: 0
    t.datetime "start_at"
    t.datetime "finish_at"
    t.float "payment_value"
    t.bigint "user_id"
    t.bigint "vehicle_id"
    t.bigint "tariff_id"
    t.bigint "credit_card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_card_id"], name: "index_orders_on_credit_card_id"
    t.index ["tariff_id"], name: "index_orders_on_tariff_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
    t.index ["vehicle_id"], name: "index_orders_on_vehicle_id"
  end

  create_table "tariff_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tariffs", force: :cascade do |t|
    t.integer "code"
    t.string "cylinders_description"
    t.boolean "younger_than_twelve", default: false
    t.float "prime_tax"
    t.float "contribution_tax"
    t.float "total_value"
    t.bigint "tariff_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tariff_type_id"], name: "index_tariffs_on_tariff_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "document"
    t.string "document_type"
    t.string "full_name"
    t.string "email"
    t.string "password"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "placa", limit: 6
    t.datetime "date"
    t.bigint "tariff_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tariff_id"], name: "index_vehicles_on_tariff_id"
  end

end
