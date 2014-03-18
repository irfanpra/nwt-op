# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140312224511) do

  create_table "ad_types", force: true do |t|
    t.string   "type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ads", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.float    "price"
    t.string   "unit"
    t.boolean  "is_hidden"
    t.float    "duarion"
    t.integer  "views_count"
    t.datetime "date_last_edit"
    t.integer  "user_data_id"
    t.integer  "ad_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: true do |t|
    t.string   "path"
    t.integer  "ad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discussions", force: true do |t|
    t.text     "content"
    t.integer  "ad_id"
    t.integer  "user_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.text     "description"
    t.integer  "user_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "password_recovery_tokens", force: true do |t|
    t.integer  "user_data_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "rating"
    t.text     "content"
    t.integer  "ad_id"
    t.integer  "user_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.datetime "date_subscribed"
    t.integer  "user_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_data", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "email"
    t.text     "description"
    t.boolean  "is_activated"
    t.integer  "user_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_logins", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.integer  "user_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_types", force: true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
