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

ActiveRecord::Schema.define(version: 20150511003754) do

  create_table "admins", force: :cascade do |t|
    t.string   "first_name",      limit: 255, null: false
    t.string   "last_name",       limit: 255, null: false
    t.string   "email",           limit: 255, null: false
    t.string   "password_digest", limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "collocations", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "playlist_video_id", limit: 4
    t.string   "collocation",       limit: 255
    t.text     "context",           limit: 65535
    t.integer  "video_id",          limit: 4
  end

  add_index "collocations", ["playlist_video_id"], name: "index_collocations_on_playlist_video_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
  end

  create_table "languages_topics", id: false, force: :cascade do |t|
    t.integer "language_id", limit: 4
    t.integer "topic_id",    limit: 4
  end

  create_table "playlist_videos", force: :cascade do |t|
    t.integer  "playlist_id", limit: 4
    t.integer  "video_id",    limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "playlist_videos", ["playlist_id"], name: "index_playlist_videos_on_playlist_id", using: :btree
  add_index "playlist_videos", ["video_id"], name: "index_playlist_videos_on_video_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "gender",      limit: 1
    t.integer  "age",         limit: 4
    t.text     "about",       limit: 65535
    t.integer  "language_id", limit: 4
  end

  add_index "speakers", ["language_id"], name: "index_speakers_on_language_id", using: :btree

  create_table "speakers_topics", id: false, force: :cascade do |t|
    t.integer "speaker_id", limit: 4
    t.integer "topic_id",   limit: 4
  end

  add_index "speakers_topics", ["speaker_id", "topic_id"], name: "index_speakers_topics_on_speaker_id_and_topic_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "topics", ["name"], name: "index_topics_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255,              null: false
    t.string   "last_name",       limit: 255,              null: false
    t.string   "email",           limit: 255, default: "", null: false
    t.string   "password_digest", limit: 255,              null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "speaker_id",        limit: 4
    t.integer  "language_id",       limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "topic_id",          limit: 4
    t.string   "original_url",      limit: 255
    t.text     "japanese_script",   limit: 65535
    t.text     "english_script",    limit: 65535
    t.text     "spanish_script",    limit: 65535
    t.string   "speaker_full_name", limit: 255
    t.string   "topic_name",        limit: 255
  end

  add_index "videos", ["speaker_id"], name: "index_videos_on_speaker_id", using: :btree
  add_index "videos", ["topic_id"], name: "index_videos_on_topic_id", using: :btree

  add_foreign_key "playlist_videos", "playlists"
  add_foreign_key "playlist_videos", "videos"
  add_foreign_key "playlists", "users"
end
