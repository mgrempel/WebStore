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

ActiveRecord::Schema.define(version: 2020_11_12_233705) do

  create_table "address_infos", force: :cascade do |t|
    t.string "address"
    t.string "address2"
    t.string "postal_code"
    t.string "city"
    t.string "province"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_address_infos_on_user_id"
  end

  create_table "billing_infos", force: :cascade do |t|
    t.string "card_type"
    t.integer "card_number"
    t.string "expiry_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "billing_address_info_id_id"
    t.integer "shipping_address_info_id_id"
    t.index ["billing_address_info_id_id"], name: "index_billing_infos_on_billing_address_info_id_id"
    t.index ["shipping_address_info_id_id"], name: "index_billing_infos_on_shipping_address_info_id_id"
    t.index ["user_id"], name: "index_billing_infos_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "description"
    t.decimal "markdown"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.decimal "item_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order_id", null: false
    t.integer "item_id", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "account_prefs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "address_infos", "users"
  add_foreign_key "billing_infos", "address_infos", column: "billing_address_info_id_id"
  add_foreign_key "billing_infos", "address_infos", column: "shipping_address_info_id_id"
  add_foreign_key "billing_infos", "users"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
end
