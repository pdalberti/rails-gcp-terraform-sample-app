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

ActiveRecord::Schema.define(version: 2022_02_14_030302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_spells", force: :cascade do |t|
    t.bigint "spell_id", null: false
    t.bigint "dnd_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dnd_class_id"], name: "index_class_spells_on_dnd_class_id"
    t.index ["spell_id"], name: "index_class_spells_on_spell_id"
  end

  create_table "dnd_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rulebooks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sources", force: :cascade do |t|
    t.bigint "spell_id", null: false
    t.bigint "rulebook_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rulebook_id"], name: "index_sources_on_rulebook_id"
    t.index ["spell_id"], name: "index_sources_on_spell_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.string "school"
    t.integer "level"
    t.string "casting"
    t.string "range"
    t.string "components"
    t.string "duration"
    t.string "description"
    t.boolean "ritual"
    t.boolean "concentration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "en_name"
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

  add_foreign_key "class_spells", "dnd_classes"
  add_foreign_key "class_spells", "spells"
  add_foreign_key "sources", "rulebooks"
  add_foreign_key "sources", "spells"
end
