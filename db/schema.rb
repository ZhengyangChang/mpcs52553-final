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

ActiveRecord::Schema.define(version: 0) do

  create_table "hosts", force: :cascade do |t|
    t.text    "name"
    t.text    "phone"
    t.integer "user_id"
    t.index ["user_id"], name: "index_hosts_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.text    "address"
    t.text    "start_date"
    t.text    "end_date"
    t.integer "rate"
    t.integer "number_of_bedrooms"
    t.integer "number_of_bathrooms"
    t.integer "host_id"
    t.integer "availability"
    t.text    "building_name"
    t.text    "room"
    t.index ["host_id"], name: "index_houses_on_host_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.datetime "update_at"
    t.integer  "house_id"
    t.integer  "renter_id"
    t.index ["house_id"], name: "index_messages_on_house_id"
    t.index ["renter_id"], name: "index_messages_on_renter_id"
  end

  create_table "renters", force: :cascade do |t|
    t.text    "name"
    t.text    "phone"
    t.integer "user_id"
    t.index ["user_id"], name: "index_renters_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "update_at"
    t.integer  "house_id"
    t.integer  "renter_id"
    t.index ["house_id"], name: "index_reservations_on_house_id"
    t.index ["renter_id"], name: "index_reservations_on_renter_id"
  end

  create_table "users", force: :cascade do |t|
    t.text    "email"
    t.text    "password_digest"
    t.integer "host_id"
    t.integer "renter_id"
    t.index ["host_id"], name: "index_users_on_host_id"
    t.index ["renter_id"], name: "index_users_on_renter_id"
  end

end
