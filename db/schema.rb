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

ActiveRecord::Schema.define(version: 20160215115000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "component_projects", force: :cascade do |t|
    t.integer  "component_id", null: false
    t.integer  "project_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "components", force: :cascade do |t|
    t.string   "name"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_users", force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "project_id", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "company"
    t.text     "info_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "info_ru"
  end

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "first_name_en",                null: false
    t.string   "last_name_en",                 null: false
    t.date     "birthday",                     null: false
    t.boolean  "gender",        default: true, null: false
    t.text     "avatar"
    t.text     "info_en"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "first_name_ru"
    t.string   "last_name_ru"
    t.text     "info_ru"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "component_projects", "components", name: "fk_component"
end
