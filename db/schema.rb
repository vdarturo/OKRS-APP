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

ActiveRecord::Schema[7.0].define(version: 2022_08_02_161121) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "initiatives", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "type_metric"
    t.decimal "start_value"
    t.decimal "target"
    t.decimal "current_value"
    t.decimal "progress"
    t.bigint "key_result_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key_result_id"], name: "index_initiatives_on_key_result_id"
    t.index ["owner_id"], name: "index_initiatives_on_owner_id"
  end

  create_table "key_results", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "period"
    t.string "type_metric"
    t.decimal "start_value"
    t.decimal "target"
    t.decimal "current_value"
    t.decimal "progress"
    t.bigint "objective_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["objective_id"], name: "index_key_results_on_objective_id"
    t.index ["owner_id"], name: "index_key_results_on_owner_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "average_progress"
    t.bigint "organization_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_objectives_on_organization_id"
    t.index ["owner_id"], name: "index_objectives_on_owner_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "vision"
    t.text "mision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_owners_on_organization_id"
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "initiatives", "key_results"
  add_foreign_key "initiatives", "owners"
  add_foreign_key "key_results", "objectives"
  add_foreign_key "key_results", "owners"
  add_foreign_key "objectives", "organizations"
  add_foreign_key "objectives", "owners"
  add_foreign_key "owners", "organizations"
  add_foreign_key "owners", "users"
end
