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

ActiveRecord::Schema.define(version: 20150409204208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.integer  "product_code"
    t.string   "upg_description"
    t.string   "compound"
    t.string   "nec_article"
    t.boolean  "shielded"
    t.string   "application"
    t.string   "strand_type"
    t.integer  "pairs_count"
    t.integer  "awg"
    t.string   "stand_count"
    t.boolean  "stranded"
    t.boolean  "solid"
    t.string   "putup"
    t.integer  "length"
    t.integer  "unit_weight_lbs"
    t.integer  "unit_weight_kgs"
    t.string   "nom_od"
    t.float    "unit_copper_weight"
    t.integer  "carton_quantity"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
