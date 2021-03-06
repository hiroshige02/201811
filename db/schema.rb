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

ActiveRecord::Schema.define(version: 2019_01_12_140909) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "admin_name"
    t.string "admin_name_kana"
    t.string "admin_tel_number"
    t.datetime "admin_deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "desk_numbers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "desk_number"
    t.datetime "start"
    t.datetime "finish"
    t.integer "event_id"
  end

  create_table "dummies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.integer "equipment_number"
    t.string "equipment"
    t.integer "dummy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "finish_time"
    t.string "title"
    t.integer "regist_user_id"
    t.text "content"
    t.boolean "admin_ok", default: false, null: false
    t.text "admin_message"
    t.boolean "admin_no", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "event_image_id"
    t.integer "participant"
    t.integer "desk"
    t.integer "year"
    t.integer "month"
    t.integer "day"
    t.boolean "finish", default: false, null: false
    t.datetime "admin_ok_date"
  end

  create_table "regist_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "regist_name"
    t.string "regist_name_kana"
    t.integer "birthday"
    t.string "regist_tel_number"
    t.datetime "regist_deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job"
    t.text "profile_image_id"
    t.index ["email"], name: "index_regist_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_regist_users_on_reset_password_token", unique: true
  end

end
