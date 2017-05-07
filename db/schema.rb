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

ActiveRecord::Schema.define(version: 20170507175502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "scene_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_characters_on_name"
    t.index ["scene_id"], name: "index_characters_on_scene_id"
  end

  create_table "lines", force: :cascade do |t|
    t.integer "number", null: false
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "speech_id"
    t.index ["number"], name: "index_lines_on_number"
    t.index ["speech_id"], name: "index_lines_on_speech_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.string "title"
    t.string "setting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_scenes_on_title"
  end

  create_table "speeches", force: :cascade do |t|
    t.integer "number", null: false
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_speeches_on_character_id"
    t.index ["number"], name: "index_speeches_on_number"
  end

  add_foreign_key "characters", "scenes"
  add_foreign_key "lines", "speeches"
  add_foreign_key "speeches", "characters"
end
