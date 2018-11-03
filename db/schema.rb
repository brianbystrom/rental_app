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

ActiveRecord::Schema.define(version: 2018_11_03_152815) do

  create_table "items", force: :cascade do |t|
    t.integer "user_id"
    t.string "serial_no"
    t.string "name"
    t.string "tag"
    t.string "location"
    t.float "price"
    t.string "brand"
    t.string "model"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "rental_start_date"
    t.datetime "rental_end_date"
    t.boolean "buyer_checkin_confirm"
    t.boolean "seller_checkin_confirm"
    t.float "total_price"
    t.boolean "assistance"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "username"
    t.string "password"
    t.boolean "status"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
