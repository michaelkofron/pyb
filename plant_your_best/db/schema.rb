# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_05_192400) do

  create_table "plants", force: :cascade do |t|
    t.string "com_name"
    t.string "sci_name"
    t.string "fam_name"
    t.string "wiki"
  end

  create_table "plants_states", id: false, force: :cascade do |t|
    t.integer "state_id", null: false
    t.integer "plant_id", null: false
    t.index ["plant_id", "state_id"], name: "index_plants_states_on_plant_id_and_state_id"
    t.index ["state_id", "plant_id"], name: "index_plants_states_on_state_id_and_plant_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.integer "plant_number"
  end

end
