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

ActiveRecord::Schema.define(version: 2018_11_09_083450) do

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
    t.text "admin_profile_image_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "desk_events", force: :cascade do |t|
    t.integer "event_id"
    t.integer "desk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "desks", force: :cascade do |t|
    t.integer "desk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "finish_time"
    t.string "title"
    t.integer "regist_user_id"
    t.text "content"
    t.boolean "admin_ok"
    t.text "admin_message"
    t.boolean "admin_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "event_image_id"
    t.integer "participant"
  end

  create_table "past_events", force: :cascade do |t|
    t.datetime "past_start_time"
    t.datetime "past_finish_time"
    t.string "past_title"
    t.text "past_content"
    t.string "past_name"
    t.string "past_user_mail_address"
    t.integer "past_participant"
    t.integer "past_event_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regist_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "regist_name"
    t.string "regist_name_kana"
    t.date "birthday"
    t.string "regist_tel_number"
    t.text "introduction"
    t.datetime "regist_deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job"
    t.text "profile_image_id"
    t.index ["email"], name: "index_regist_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_regist_users_on_reset_password_token", unique: true
  end

end
