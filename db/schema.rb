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

ActiveRecord::Schema.define(version: 20160126120311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.text     "biography",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_genres", force: :cascade do |t|
    t.integer "book_id"
    t.integer "genre_id"
  end

  add_index "book_genres", ["book_id"], name: "index_book_genres_on_book_id", using: :btree
  add_index "book_genres", ["genre_id"], name: "index_book_genres_on_genre_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "description",  null: false
    t.datetime "published_at", null: false
    t.string   "cover_url",    null: false
    t.integer  "author_id"
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_entries", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "list_id", null: false
  end

  add_index "list_entries", ["book_id", "list_id"], name: "index_list_entries_on_book_id_and_list_id", unique: true, using: :btree
  add_index "list_entries", ["book_id"], name: "index_list_entries_on_book_id", using: :btree
  add_index "list_entries", ["list_id"], name: "index_list_entries_on_list_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "book_genres", "books"
  add_foreign_key "book_genres", "genres"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "books", "authors"
  add_foreign_key "list_entries", "books"
  add_foreign_key "list_entries", "lists"
end
