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

ActiveRecord::Schema.define(version: 20160514191527) do

  create_table "companies", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "hiring_agent_name", limit: 255
    t.string   "address1",          limit: 255
    t.string   "address2",          limit: 255
    t.string   "post_code",         limit: 255
    t.integer  "cover_letter_id",   limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "department",        limit: 255
  end

  add_index "companies", ["cover_letter_id"], name: "index_companies_on_cover_letter_id", using: :btree

  create_table "cover_letters", force: :cascade do |t|
    t.text     "text",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "cover_letters", ["user_id"], name: "index_cover_letters_on_user_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "text",       limit: 255
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "resume_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "educations", ["resume_id"], name: "index_educations_on_resume_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "text",       limit: 255
    t.string   "home_page",  limit: 255
    t.integer  "resume_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "projects", ["resume_id"], name: "index_projects_on_resume_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.text     "summary",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "level",      limit: 4
    t.integer  "resume_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "skills", ["resume_id"], name: "index_skills_on_resume_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "address",                limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "homepage",               limit: 255
    t.string   "mobile_number",          limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "image",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_histories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "text",       limit: 255
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "resume_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "work_histories", ["resume_id"], name: "index_work_histories_on_resume_id", using: :btree

  add_foreign_key "companies", "cover_letters"
  add_foreign_key "cover_letters", "users"
  add_foreign_key "educations", "resumes"
  add_foreign_key "projects", "resumes"
  add_foreign_key "skills", "resumes"
  add_foreign_key "work_histories", "resumes"
end
