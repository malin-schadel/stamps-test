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

ActiveRecord::Schema[7.0].define(version: 2023_03_10_141527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "opening_hours", force: :cascade do |t|
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_opening_hours_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "stamp_cards", force: :cascade do |t|
    t.integer "max_amount"
    t.string "discount_item"
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_stamp_cards_on_shop_id"
  end

  create_table "user_cards", force: :cascade do |t|
    t.integer "amount"
    t.bigint "user_id", null: false
    t.bigint "stamp_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stamp_card_id"], name: "index_user_cards_on_stamp_card_id"
    t.index ["user_id"], name: "index_user_cards_on_user_id"
  end

  create_table "user_shops", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_user_shops_on_shop_id"
    t.index ["user_id"], name: "index_user_shops_on_user_id"
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

  add_foreign_key "opening_hours", "shops"
  add_foreign_key "shops", "users"
  add_foreign_key "stamp_cards", "shops"
  add_foreign_key "user_cards", "stamp_cards"
  add_foreign_key "user_cards", "users"
  add_foreign_key "user_shops", "shops"
  add_foreign_key "user_shops", "users"
end
