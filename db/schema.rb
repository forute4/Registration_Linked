# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_02_07_051338) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["name"], name: "index_admins_on_name", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "admin_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_comments_on_admin_id"
    t.index ["student_id"], name: "index_comments_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "address", null: false
    t.string "email", null: false
    t.string "post_code", null: false
    t.integer "grade", null: false
    t.string "school_name", null: false
    t.date "subscription_day", null: false
    t.integer "student_status", default: 1
    t.integer "situation_status", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "target_numbers", force: :cascade do |t|
    t.string "target_name"
    t.date "start_day"
    t.date "finish_day"
    t.integer "subscription_number"
    t.integer "continue_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "telephone_numbers", force: :cascade do |t|
    t.integer "student_id", null: false
    t.string "number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_telephone_numbers_on_student_id"
  end

  create_table "tests", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "test_status"
    t.string "test_name"
    t.integer "english_score"
    t.integer "math_score"
    t.integer "japanese_score"
    t.integer "science_score"
    t.integer "social_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_tests_on_student_id"
  end

  add_foreign_key "comments", "admins"
  add_foreign_key "comments", "students"
  add_foreign_key "telephone_numbers", "students"
  add_foreign_key "tests", "students"
end
