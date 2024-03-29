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

ActiveRecord::Schema.define(version: 20160818113720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "selected_page",          default: 1
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "advantages", force: :cascade do |t|
    t.integer  "page_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.index ["page_id"], name: "index_advantages_on_page_id", using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "page_id"
    t.text     "description"
    t.string   "author"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.index ["page_id"], name: "index_feedbacks_on_page_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "discount"
    t.string   "name"
    t.integer  "price"
    t.integer  "price_old"
    t.string   "button_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.string   "link"
    t.index ["page_id"], name: "index_offers_on_page_id", using: :btree
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "offer"
    t.text     "footer_text"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "design",      default: 1
  end

end
