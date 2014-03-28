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

ActiveRecord::Schema.define(version: 20140328130104) do

  create_table "business_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
  end

  create_table "districts", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.integer  "cep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.text     "description"
    t.integer  "property_id"
    t.integer  "position"
    t.boolean  "cover",          default: false
    t.boolean  "mobile_catalog", default: false
    t.boolean  "website",        default: false
    t.string   "file_uid"
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.text     "description"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_name"
    t.string   "address_number"
    t.string   "address_complement"
    t.text     "address_reference"
    t.integer  "district_id"
    t.integer  "privative_area"
    t.integer  "constructed_area"
    t.integer  "total_area"
    t.integer  "terrain_area"
    t.integer  "sell_price"
    t.integer  "client_price"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.integer  "suits"
    t.integer  "construction_year"
    t.integer  "garages"
    t.boolean  "furnished"
    t.integer  "property_type_id"
    t.integer  "business_type_id"
  end

  create_table "property_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "uf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
