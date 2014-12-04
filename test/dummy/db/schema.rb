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

ActiveRecord::Schema.define(version: 20141203124424) do

  create_table "jsonforem_categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jsonforem_forums", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "jsonforem_categories_id"
  end

  add_index "jsonforem_forums", ["jsonforem_categories_id"], name: "index_jsonforem_forums_on_jsonforem_categories_id"

  create_table "jsonforem_posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "jsonforem_topics_id"
    t.integer  "jsonforem_posts_id"
    t.integer  "user_id"
  end

  add_index "jsonforem_posts", ["jsonforem_posts_id"], name: "index_jsonforem_posts_on_jsonforem_posts_id"
  add_index "jsonforem_posts", ["jsonforem_topics_id"], name: "index_jsonforem_posts_on_jsonforem_topics_id"

  create_table "jsonforem_topics", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "jsonforem_forums_id"
  end

  add_index "jsonforem_topics", ["jsonforem_forums_id"], name: "index_jsonforem_topics_on_jsonforem_forums_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
