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

ActiveRecord::Schema.define(version: 20170502013926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "line_id"
    t.index ["line_id"], name: "index_characters_on_line_id"
    t.index ["name"], name: "index_characters_on_name"
  end

  create_table "lines", force: :cascade do |t|
    t.integer "number", null: false
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_lines_on_number"
  end

  create_table "scenes", force: :cascade do |t|
    t.string "title"
    t.string "setting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "line_id"
    t.index ["line_id"], name: "index_scenes_on_line_id"
    t.index ["title"], name: "index_scenes_on_title"
  end

  add_foreign_key "characters", "lines"
  add_foreign_key "scenes", "lines"
end
