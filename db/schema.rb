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

ActiveRecord::Schema.define(:version => 20130113052726) do

  create_table "expenses", :force => true do |t|
    t.decimal  "amount"
    t.decimal  "iva"
    t.string   "description"
    t.integer  "fiscal_month_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "expenses", ["fiscal_month_id"], :name => "index_expenses_on_fiscal_month_id"

  create_table "fiscal_months", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "month"
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "fiscal_months", ["month", "year"], :name => "index_fiscal_months_on_month_and_year"
  add_index "fiscal_months", ["user_id"], :name => "index_fiscal_months_on_user_id"

  create_table "ietus", :id => false, :force => true do |t|
    t.integer  "fiscal_month_id"
    t.decimal  "amount"
    t.decimal  "penalty"
    t.decimal  "updated_part"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "ietus", ["fiscal_month_id"], :name => "index_ietus_on_fiscal_month_id"

  create_table "incomes", :force => true do |t|
    t.decimal  "amount"
    t.decimal  "iva"
    t.string   "description"
    t.integer  "fiscal_month_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "incomes", ["fiscal_month_id"], :name => "index_incomes_on_fiscal_month_id"

  create_table "isrs", :id => false, :force => true do |t|
    t.integer  "fiscal_month_id"
    t.decimal  "amount"
    t.decimal  "penalty"
    t.decimal  "updated_part"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "isrs", ["fiscal_month_id"], :name => "index_isrs_on_fiscal_month_id"

  create_table "ivas", :id => false, :force => true do |t|
    t.integer  "fiscal_month_id"
    t.decimal  "amount"
    t.decimal  "penalty"
    t.decimal  "updated_part"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "ivas", ["fiscal_month_id"], :name => "index_ivas_on_fiscal_month_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
