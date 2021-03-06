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

ActiveRecord::Schema.define(version: 20140923085057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "collections", force: true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "monuments", force: true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "collection_id"
    t.integer "category_id"
  end

  add_index "monuments", ["category_id"], name: "index_monuments_on_category_id", using: :btree
  add_index "monuments", ["collection_id"], name: "index_monuments_on_collection_id", using: :btree

  create_table "pictures", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "date"
    t.integer  "monument_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "login"
    t.string "password"
  end

end
