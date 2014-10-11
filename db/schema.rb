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

ActiveRecord::Schema.define(version: 20140925004729) do

  create_table "etymologies", force: true do |t|
    t.string   "headword"
    t.string   "lang"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "etymologies", ["headword"], name: "index_etymologies_on_headword"

  create_table "words", force: true do |t|
    t.string   "content"
    t.string   "lang"
    t.integer  "distance"
    t.integer  "etymology_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["etymology_id", "distance"], name: "index_words_on_etymology_id_and_distance"

end
