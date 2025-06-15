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

ActiveRecord::Schema[8.0].define(version: 2025_06_14_032627) do
  create_table "covid_benchmarks", force: :cascade do |t|
    t.string "name"
    t.string "first_state"
    t.string "second_state"
    t.string "first_city"
    t.string "second_city"
    t.date "date_start"
    t.date "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer "covid_benchmark_id", null: false
    t.string "worse"
    t.string "comparison_metric"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "details"
    t.index ["covid_benchmark_id"], name: "index_results_on_covid_benchmark_id"
  end

  add_foreign_key "results", "covid_benchmarks"
end
