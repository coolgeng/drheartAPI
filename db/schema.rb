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

ActiveRecord::Schema.define(version: 20160215221852) do

  create_table "doctor_patients", id: false, force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.integer  "doctor_id",  limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "doctor_patients", ["patient_id", "doctor_id"], name: "index_doctor_patients_on_patient_id_and_doctor_id", unique: true, using: :btree

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "avatar",     limit: 255
    t.string   "hospital",   limit: 255
    t.string   "sector",     limit: 255
    t.string   "position",   limit: 255
    t.integer  "sex",        limit: 4
    t.integer  "age",        limit: 4
  end

  add_index "doctors", ["user_id"], name: "index_doctors_on_user_id", using: :btree

  create_table "doctors_patients", force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.integer  "doctor_id",  limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "doctors_patients", ["doctor_id"], name: "index_doctors_patients_on_doctor_id", using: :btree
  add_index "doctors_patients", ["patient_id"], name: "index_doctors_patients_on_patient_id", using: :btree

  create_table "heart_rates", force: :cascade do |t|
    t.integer  "rate",           limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",        limit: 4
    t.integer  "patient_id",     limit: 4
    t.integer  "occurring_time", limit: 8
  end

  add_index "heart_rates", ["patient_id"], name: "index_heart_rates_on_patient_id", using: :btree
  add_index "heart_rates", ["user_id"], name: "index_heart_rates_on_user_id", using: :btree

  create_table "incidents", force: :cascade do |t|
    t.integer  "patient_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "doctor_id",      limit: 4
    t.string   "desp",           limit: 255
    t.string   "treat",          limit: 255
    t.integer  "state",          limit: 4
    t.integer  "time",           limit: 4
    t.integer  "occurring_time", limit: 8
  end

  add_index "incidents", ["doctor_id"], name: "index_incidents_on_doctor_id", using: :btree
  add_index "incidents", ["patient_id"], name: "index_incidents_on_patient_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "patient_id",    limit: 4
    t.string   "content",       limit: 255
    t.integer  "occurringTime", limit: 8
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",       limit: 4
    t.integer  "doctor_id",     limit: 4
  end

  add_index "messages", ["doctor_id"], name: "index_messages_on_doctor_id", using: :btree
  add_index "messages", ["patient_id"], name: "index_messages_on_patient_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "patient_doctors", id: false, force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.integer  "doctor_id",  limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "patient_doctors", ["doctor_id"], name: "index_patient_doctors_on_doctor_id", using: :btree
  add_index "patient_doctors", ["patient_id", "doctor_id"], name: "index_patient_doctors_on_patient_id_and_doctor_id", using: :btree
  add_index "patient_doctors", ["patient_id"], name: "index_patient_doctors_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "avatar",     limit: 255
    t.integer  "sex",        limit: 4
    t.integer  "age",        limit: 4
  end

  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "session",    limit: 255
    t.string   "token",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest",       limit: 255
    t.string   "password_confirmation", limit: 255
    t.string   "password_salt",         limit: 255
    t.string   "email",                 limit: 255
    t.string   "email_confirmation",    limit: 255
    t.string   "phone",                 limit: 255
    t.integer  "user_type",             limit: 4
    t.string   "verify_code",           limit: 255
    t.integer  "verify_time",           limit: 8
  end

end
