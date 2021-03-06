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

ActiveRecord::Schema.define(version: 20160214200808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "assignment_id", null: false
    t.text     "text",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id",                   null: false
    t.integer  "homework_id",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "answers_count", default: 0
  end

  add_index "assignments", ["user_id", "homework_id"], name: "index_assignments_on_user_id_and_homework_id", unique: true, using: :btree

  create_table "homeworks", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "question",   null: false
    t.datetime "due_at",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "homeworks", ["user_id"], name: "index_homeworks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.integer  "role",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
