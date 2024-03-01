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

ActiveRecord::Schema[7.0].define(version: 2024_03_01_041239) do
  create_table "employment_opportunities", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "vacancy_type"
    t.integer "user_id", null: false
    t.string "status"
    t.date "application_deadline"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.string "work_environment"
    t.string "salary"
    t.text "requirements"
    t.text "conditions"
    t.string "contact_link"
    t.string "about_link"
    t.text "company_description"
    t.index ["user_id"], name: "index_employment_opportunities_on_user_id"
  end

  create_table "employment_opportunities_recents", id: false, force: :cascade do |t|
    t.integer "employment_opportunity_id", null: false
    t.integer "recent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employment_opportunity_id"], name: "index_eo_recents_on_eo_id"
    t.index ["recent_id"], name: "index_eo_recents_on_recent_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "type"
    t.string "post_title"
    t.string "pic"
    t.text "description"
    t.string "link"
    t.integer "profile_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reply_to_post_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "profile_id"
    t.string "profile_pic"
    t.string "nick_name"
    t.text "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "web_link"
  end

  create_table "recents", force: :cascade do |t|
    t.string "recentable_type"
    t.integer "recentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supports", force: :cascade do |t|
    t.string "email"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "employment_opportunities", "users"
end
