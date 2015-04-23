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

ActiveRecord::Schema.define(version: 20150423184930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "url"
    t.string   "location"
    t.string   "industry"
    t.string   "logo_url"
    t.float    "overall_rating"
    t.string   "rating_description"
    t.float    "cultureandvalues_rating"
    t.float    "seniorleadership_rating"
    t.float    "compensationandbenefits_rating"
    t.float    "careeropportunities_rating"
    t.float    "worklifebalance_rating"
    t.float    "recommendtofriends_rating"
    t.string   "ceo_name"
    t.string   "ceo_picture"
    t.integer  "approval_rating"
  end

  create_table "hiddenjobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hiddenjobs", ["job_id"], name: "index_hiddenjobs_on_job_id", using: :btree
  add_index "hiddenjobs", ["user_id"], name: "index_hiddenjobs_on_user_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "position"
    t.date     "posting_date"
    t.text     "description"
    t.string   "location"
    t.integer  "company_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "source"
    t.boolean  "relevant",     default: false
  end

  create_table "jobtags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "jobtags", ["job_id"], name: "index_jobtags_on_job_id", using: :btree
  add_index "jobtags", ["tag_id"], name: "index_jobtags_on_tag_id", using: :btree

  create_table "likedjobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likedjobs", ["job_id"], name: "index_likedjobs_on_job_id", using: :btree
  add_index "likedjobs", ["user_id"], name: "index_likedjobs_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "token"
    t.string   "uid"
    t.string   "profile_image_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_foreign_key "hiddenjobs", "jobs"
  add_foreign_key "hiddenjobs", "users"
  add_foreign_key "jobtags", "jobs"
  add_foreign_key "jobtags", "tags"
  add_foreign_key "likedjobs", "jobs"
  add_foreign_key "likedjobs", "users"
end
