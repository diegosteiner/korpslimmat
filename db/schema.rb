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

ActiveRecord::Schema.define(version: 20140330211515) do

  create_table "event_signups", force: true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.text     "options_serialized"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.datetime "from"
    t.datetime "to"
    t.string   "place"
    t.string   "organizer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_functions", id: false, force: true do |t|
    t.integer  "group_id"
    t.integer  "person_id"
    t.integer  "functions_mask"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_functions", ["group_id"], name: "index_group_functions_on_group_id"
  add_index "group_functions", ["person_id"], name: "index_group_functions_on_person_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["parent_id"], name: "index_groups_on_parent_id"

  create_table "mail_aliases", force: true do |t|
    t.string   "email"
    t.integer  "aliasable_id"
    t.string   "aliasable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "vulgo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "person_id"
    t.integer  "roles_mask",             default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
