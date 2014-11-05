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

ActiveRecord::Schema.define(version: 20141105155701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checks", force: true do |t|
    t.integer  "execution_id"
    t.string   "check_number"
    t.float    "amount"
    t.datetime "elaboration_date"
    t.datetime "sign_date"
    t.datetime "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checks", ["execution_id"], name: "index_checks_on_execution_id", using: :btree

  create_table "commitments", force: true do |t|
    t.string   "code"
    t.float    "amount"
    t.string   "description"
    t.string   "recipient"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "executions", force: true do |t|
    t.integer  "commitment_id"
    t.string   "code"
    t.float    "amount"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "executions", ["commitment_id"], name: "index_executions_on_commitment_id", using: :btree

  create_table "labs", force: true do |t|
    t.string "name"
    t.string "sae_code"
    t.string "sae_name"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
