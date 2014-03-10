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

ActiveRecord::Schema.define(version: 20140310154222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.string   "answer_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breeds", force: true do |t|
    t.string   "name"
    t.string   "size"
    t.string   "lifespan"
    t.string   "weight"
    t.string   "height"
    t.string   "group"
    t.string   "exercise"
    t.string   "grooming"
    t.string   "family_friendly"
    t.string   "role"
    t.text     "temperament"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "answer_id"
    t.integer  "breed_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shelters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "petfinder_id"
    t.string   "zip"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.string   "email"
    t.float    "latitude"
    t.float    "longitude"
  end

end
