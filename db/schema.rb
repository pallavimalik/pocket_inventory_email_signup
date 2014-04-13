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

ActiveRecord::Schema.define(version: 20140413112511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "visitors", force: true do |t|
    t.string   "email_id"
    t.integer  "email_read_flag"
    t.datetime "email_read_flag_time"
    t.boolean  "page_visited_flag",      default: false
    t.datetime "page_visited_flag_time"
    t.boolean  "signup_flag",            default: false
    t.datetime "signup_flag_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "no_of_visits"
    t.string   "entered_email"
    t.string   "ip_address"
    t.string   "email_date"
  end

end
