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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130316163535) do

  create_table "accounts", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "company_id"
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true
  add_index "accounts", ["reset_password_token"], :name => "index_accounts_on_reset_password_token", :unique => true

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", :force => true do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.integer  "postal_code"
    t.string   "phone"
    t.string   "email"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "fax"
  end

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "parent_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "logo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "siret"
    t.string   "company_name"
  end

  create_table "customers", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
    t.string   "customer_name"
  end

  create_table "employee_tasks", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "worksite_id"
    t.decimal  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "nb_day"
    t.boolean  "half_day"
  end

  add_index "employee_tasks", ["employee_id", "worksite_id"], :name => "index_employee_tasks_on_employee_id_and_worksite_id"

  create_table "employees", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.decimal  "day_price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  create_table "employees_statements", :id => false, :force => true do |t|
    t.integer "statement_id"
    t.integer "employee_id"
  end

  create_table "items", :force => true do |t|
    t.integer  "quantity"
    t.decimal  "totalTF"
    t.decimal  "tva"
    t.integer  "material_id"
    t.integer  "worksite_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.decimal  "unit_priceTF"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "category_id"
  end

  add_index "materials", ["category_id"], :name => "index_materials_on_category_id"

  create_table "statements", :force => true do |t|
    t.decimal  "total"
    t.integer  "nb_days"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "customer_id"
    t.integer  "company_id"
    t.string   "type"
  end

  create_table "worksites", :force => true do |t|
    t.string   "reason"
    t.text     "description"
    t.date     "work_start_on"
    t.date     "work_end_on"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "statement_id"
  end

end
