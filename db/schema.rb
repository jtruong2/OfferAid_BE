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

ActiveRecord::Schema.define(version: 20171103170650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donation_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "donation_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_id"], name: "index_donation_items_on_donation_id"
    t.index ["item_id"], name: "index_donation_items_on_item_id"
  end

  create_table "donations", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pickup_date"
    t.string "pickup_address"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "donation_items", "donations"
  add_foreign_key "donation_items", "items"
end
