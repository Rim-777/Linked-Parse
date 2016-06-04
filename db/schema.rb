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

ActiveRecord::Schema.define(version: 20160602224241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["title"], name: "index_skills_on_title", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "current_title"
    t.string   "current_position"
    t.text     "summary"
    t.integer  "level",            default: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "users", ["current_position"], name: "index_users_on_current_position", using: :btree
  add_index "users", ["current_title"], name: "index_users_on_current_title", using: :btree
  add_index "users", ["name", "current_title"], name: "index_users_on_name_and_current_title", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree

  create_table "users_educations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "education_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "users_educations", ["education_id"], name: "index_users_educations_on_education_id", using: :btree
  add_index "users_educations", ["user_id", "education_id"], name: "index_users_educations_on_user_id_and_education_id", using: :btree
  add_index "users_educations", ["user_id"], name: "index_users_educations_on_user_id", using: :btree

  create_table "users_experiences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "experience_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users_experiences", ["experience_id"], name: "index_users_experiences_on_experience_id", using: :btree
  add_index "users_experiences", ["user_id", "experience_id"], name: "index_users_experiences_on_user_id_and_experience_id", using: :btree
  add_index "users_experiences", ["user_id"], name: "index_users_experiences_on_user_id", using: :btree

  create_table "users_skills", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_skills", ["skill_id"], name: "index_users_skills_on_skill_id", using: :btree
  add_index "users_skills", ["user_id", "skill_id"], name: "index_users_skills_on_user_id_and_skill_id", using: :btree
  add_index "users_skills", ["user_id"], name: "index_users_skills_on_user_id", using: :btree

  add_foreign_key "users_educations", "educations"
  add_foreign_key "users_educations", "users"
  add_foreign_key "users_experiences", "experiences"
  add_foreign_key "users_experiences", "users"
  add_foreign_key "users_skills", "skills"
  add_foreign_key "users_skills", "users"
end
