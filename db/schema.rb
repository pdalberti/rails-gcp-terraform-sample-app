# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_25_060851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dnd_items", force: :cascade do |t|
    t.string "title"
    t.string "original"
    t.string "rulebook", default: [], array: true
    t.string "rarity"
    t.integer "filter_rarity", default: [], array: true
    t.string "attunement", default: [], array: true
    t.string "interaction"
    t.string "purpose", default: [], array: true
    t.string "item", default: [], array: true
    t.string "combat_effect", default: [], array: true
    t.string "bonus", default: [], array: true
    t.string "limit", default: [], array: true
    t.string "duration"
    t.integer "filter_duration"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "drd2_abilities", force: :cascade do |t|
    t.string "name"
    t.string "rulebook"
    t.string "level"
    t.string "drd2_attribute"
    t.string "related_skill", default: [], array: true
    t.string "effect", default: [], array: true
    t.string "purpose", default: [], array: true
    t.string "activation_cost", default: [], array: true
    t.string "class_basic"
    t.string "class_advanced"
    t.string "class_expert"
    t.string "race"
    t.string "monster"
    t.string "origin", default: [], array: true
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fate_tricks", force: :cascade do |t|
    t.string "actions", default: [], array: true
    t.string "costs", default: [], array: true
    t.string "dials", default: [], array: true
    t.string "fae_approach", default: [], array: true
    t.string "fc_extra", default: [], array: true
    t.string "fc_skill", default: [], array: true
    t.string "origin"
    t.string "original"
    t.string "restrictions", default: [], array: true
    t.string "source"
    t.string "sw_archetype", default: [], array: true
    t.string "sw_enemy", default: [], array: true
    t.string "sw_extra", default: [], array: true
    t.string "sw_race", default: [], array: true
    t.string "sw_skill", default: [], array: true
    t.string "tags", default: [], array: true
    t.string "title"
    t.string "trick_type", default: [], array: true
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "school"
    t.integer "level"
    t.integer "casting"
    t.integer "range"
    t.string "components"
    t.integer "duration"
    t.string "description"
    t.boolean "ritual"
    t.boolean "concentration"
    t.string "classes", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "original_casting"
    t.string "original_range"
    t.string "original_components"
    t.string "original_duration"
    t.string "title"
    t.string "original"
    t.string "rulebook", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
