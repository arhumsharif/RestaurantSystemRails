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

ActiveRecord::Schema.define(version: 2022_08_14_171711) do

  create_table "addons", force: :cascade do |t|
    t.string "addon_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "category_name"
    t.string "restaurant_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_categories_on_item_id"
  end

  create_table "deal_items", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "deal_id", null: false
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deal_id"], name: "index_deal_items_on_deal_id"
    t.index ["item_id"], name: "index_deal_items_on_item_id"
  end

  create_table "deals", force: :cascade do |t|
    t.string "deal_name"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "Discount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_discounts_on_item_id"
  end

  create_table "item_addons", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "addon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addon_id"], name: "index_item_addons_on_addon_id"
    t.index ["item_id"], name: "index_item_addons_on_item_id"
  end

  create_table "item_options", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_options_on_item_id"
    t.index ["option_id"], name: "index_item_options_on_option_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "item_desc"
    t.string "price"
    t.string "restaurant_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "option_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "restaurant_name"
    t.string "price"
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "order_items_id", null: false
    t.string "total_bill"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_items_id"], name: "index_orders_on_order_items_id"
  end

  create_table "restaurant_percents", force: :cascade do |t|
    t.string "restaurant_name"
    t.float "percent"
    t.integer "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_restaurant_percents_on_admin_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "restaurant_name"
    t.integer "manager_id"
    t.integer "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "open_time"
    t.string "close_time"
    t.index ["admin_id"], name: "index_restaurants_on_admin_id"
  end

  add_foreign_key "categories", "items"
  add_foreign_key "deal_items", "deals"
  add_foreign_key "deal_items", "items"
  add_foreign_key "discounts", "items"
  add_foreign_key "item_addons", "addons"
  add_foreign_key "item_addons", "items"
  add_foreign_key "item_options", "items"
  add_foreign_key "item_options", "options"
  add_foreign_key "order_items", "items"
  add_foreign_key "orders", "order_items", column: "order_items_id"
  add_foreign_key "restaurant_percents", "admins"
  add_foreign_key "restaurants", "admins"
end
