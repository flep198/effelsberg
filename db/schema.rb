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

ActiveRecord::Schema.define(version: 2021_06_23_095156) do

  create_table "epoches", force: :cascade do |t|
    t.date "date"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "lst_from"
    t.float "lst_to"
    t.string "slug"
    t.index ["slug"], name: "index_epoches_on_slug", unique: true
  end

  create_table "frequencies", force: :cascade do |t|
    t.float "freq_ghz"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "receiver"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "scan_nr"
    t.float "value_jy"
    t.float "error_jy"
    t.float "mjd"
    t.float "elevation"
    t.integer "source_id"
    t.integer "epoch_id"
    t.integer "frequency_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["epoch_id"], name: "index_results_on_epoch_id"
    t.index ["frequency_id"], name: "index_results_on_frequency_id"
    t.index ["source_id"], name: "index_results_on_source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "j2000_name"
    t.string "alt_name"
    t.string "source_class"
    t.string "s_mojave"
    t.string "s_alma"
    t.float "redshift"
    t.string "ra"
    t.string "decl"
    t.float "lst_from"
    t.float "lst_to"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.float "duration"
    t.string "tevcat_url", default: "http://tevcat2.uchicago.edu/"
    t.index ["slug"], name: "index_sources_on_slug", unique: true
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
