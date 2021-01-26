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

ActiveRecord::Schema.define(version: 2021_01_23_065908) do

  create_table "correctedentrysheet2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "memo"
    t.bigint "user_id"
    t.bigint "entrysheet2_id"
    t.string "correctedesfile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrysheet2_id"], name: "index_correctedentrysheet2s_on_entrysheet2_id"
    t.index ["user_id"], name: "index_correctedentrysheet2s_on_user_id"
  end

  create_table "correctedentrysheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "memo"
    t.bigint "user_id"
    t.bigint "entrysheet2_id"
    t.string "correctedesfile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrysheet2_id"], name: "index_correctedentrysheets_on_entrysheet2_id"
    t.index ["user_id"], name: "index_correctedentrysheets_on_user_id"
  end

  create_table "entrysheet2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "company"
    t.string "idea"
    t.string "industry"
    t.string "business"
    t.string "esfileup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_entrysheet2s_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "correctedentrysheet2s", "entrysheet2s"
  add_foreign_key "correctedentrysheet2s", "users"
  add_foreign_key "correctedentrysheets", "entrysheet2s"
  add_foreign_key "correctedentrysheets", "users"
  add_foreign_key "entrysheet2s", "users"
end
