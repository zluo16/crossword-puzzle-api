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

ActiveRecord::Schema.define(version: 20171121232230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grid_boxes", force: :cascade do |t|
    t.integer "boxId"
    t.string "key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "puzzle_id"
    t.string "className"
    t.index ["puzzle_id"], name: "index_grid_boxes_on_puzzle_id"
  end

  create_table "puzzle_words", force: :cascade do |t|
    t.bigint "word_id"
    t.bigint "puzzle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "boxId"
    t.string "alignment"
    t.index ["puzzle_id"], name: "index_puzzle_words_on_puzzle_id"
    t.index ["word_id"], name: "index_puzzle_words_on_word_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.integer "times_played"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.integer "score"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "answer"
    t.string "question"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grid_boxes", "puzzles"
  add_foreign_key "puzzle_words", "puzzles"
  add_foreign_key "puzzle_words", "words"
end
