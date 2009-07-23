# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090723223517) do

  create_table "bounties", :force => true do |t|
    t.decimal  "amount",     :null => false
    t.decimal  "raised",     :null => false
    t.datetime "expires_at", :null => false
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bounties", ["project_id"], :name => "index_bounties_on_project_id", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "slug",                          :null => false
    t.boolean  "official",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_projects", :force => true do |t|
    t.integer "project_id"
    t.integer "category_id"
  end

  create_table "pledges", :force => true do |t|
    t.decimal  "amount",     :null => false
    t.integer  "bounty_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_categories", :force => true do |t|
    t.string  "display_name"
    t.integer "rank",         :default => 100
    t.integer "project_id"
    t.integer "category_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name",                              :null => false
    t.text     "description",                       :null => false
    t.datetime "accepted_at"
    t.datetime "expires_at"
    t.datetime "completed_at"
    t.string   "status",       :default => "draft"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",      :null => false
    t.string   "name",       :null => false
    t.string   "password",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
