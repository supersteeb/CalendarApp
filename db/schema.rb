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

ActiveRecord::Schema.define(version: 20171122125451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "name"
    t.date     "published_on"
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["name"], name: "index_articles_on_name", using: :btree
    t.index ["published_on"], name: "index_articles_on_published_on", using: :btree
  end

  create_table "to_do_items", force: :cascade do |t|
    t.integer  "to_do_lists_id"
    t.string   "name"
    t.boolean  "is_done"
    t.text     "desc"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["to_do_lists_id"], name: "index_to_do_items_on_to_do_lists_id", using: :btree
  end

  create_table "to_do_lists", force: :cascade do |t|
    t.integer  "percent_complete"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "to_do_items", "to_do_lists", column: "to_do_lists_id"
end
