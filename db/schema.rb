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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110921161114) do

  create_table "applications", :force => true do |t|
    t.integer  "volunteer_id"
    t.integer  "postje_id"
    t.string   "hour"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "timeslot_id"
  end

  create_table "locks", :force => true do |t|
    t.integer  "postje_id"
    t.integer  "timeslot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "postje_id"
    t.integer  "timeslot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "note"
  end

  create_table "postjes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "var",                       :null => false
    t.text     "value"
    t.integer  "target_id"
    t.string   "target_type", :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["target_type", "target_id", "var"], :name => "index_settings_on_target_type_and_target_id_and_var", :unique => true

  create_table "timeslots", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "volunteers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "klas"
    t.string   "leerling"
  end

end
