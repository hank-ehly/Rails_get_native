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

ActiveRecord::Schema.define(version: 20150409010312) do

  create_table "admins", force: :cascade do |t|
    t.string   "first_name",      limit: 255, null: false
    t.string   "last_name",       limit: 255, null: false
    t.string   "username",        limit: 255, null: false
    t.string   "email",           limit: 255, null: false
    t.string   "password_digest", limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "admins", ["username"], name: "index_admins_on_username", using: :btree

  create_table "languages", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "language",       limit: 4
    t.integer  "speakers_count", limit: 4
    t.integer  "videos_count",   limit: 4
    t.integer  "topics_count",   limit: 4
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.integer  "native_language", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "gender",          limit: 1
    t.integer  "age",             limit: 4
    t.text     "about",           limit: 65535
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "topics", ["name"], name: "index_topics_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255,              null: false
    t.string   "last_name",       limit: 255,              null: false
    t.string   "username",        limit: 255,              null: false
    t.string   "email",           limit: 255, default: "", null: false
    t.string   "password_digest", limit: 255,              null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "auth_token",      limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.integer  "duration",           limit: 4
    t.string   "speaker_name",       limit: 255
    t.text     "description",        limit: 65535
    t.integer  "views_count",        limit: 4
    t.integer  "speaker_id",         limit: 4
    t.string   "language",           limit: 255
    t.text     "script",             limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "video_filename",     limit: 255
    t.string   "thumbnail_filename", limit: 255
    t.integer  "topic_id",           limit: 4
    t.string   "video",              limit: 255
  end

  add_index "videos", ["speaker_id"], name: "index_videos_on_speaker_id", using: :btree
  add_index "videos", ["topic_id"], name: "index_videos_on_topic_id", using: :btree

end
