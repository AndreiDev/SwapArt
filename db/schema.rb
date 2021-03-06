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

ActiveRecord::Schema.define(version: 20140803185257) do

  create_table "ages", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocks", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blocks", ["item_id"], name: "index_blocks_on_item_id", using: :btree
  add_index "blocks", ["user_id"], name: "index_blocks_on_user_id", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.string   "secret"
    t.datetime "expires_at"
    t.string   "email"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "link"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "user_id"
    t.integer  "type_id"
    t.string   "description"
    t.integer  "price_id"
    t.integer  "height",                      null: false
    t.integer  "width",                       null: false
    t.integer  "age_id"
    t.integer  "state_id"
    t.string   "image_url"
    t.boolean  "is_active",   default: true,  null: false
    t.boolean  "is_blocked",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["age_id"], name: "index_items_on_age_id", using: :btree
  add_index "items", ["price_id"], name: "index_items_on_price_id", using: :btree
  add_index "items", ["state_id"], name: "index_items_on_state_id", using: :btree
  add_index "items", ["type_id"], name: "index_items_on_type_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "prices", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "flg_default",   default: 1, null: false
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "states", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "swaps", force: true do |t|
    t.integer  "swapper_id"
    t.integer  "swappee_id"
    t.integer  "clicked_item_id"
    t.text     "swapper_items"
    t.text     "swappee_items"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "swaps", ["clicked_item_id"], name: "index_swaps_on_clicked_item_id", using: :btree
  add_index "swaps", ["swappee_id"], name: "index_swaps_on_swappee_id", using: :btree
  add_index "swaps", ["swapper_id"], name: "index_swaps_on_swapper_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "item_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["item_id"], name: "index_taggings_on_item_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "region_id",              default: 1,     null: false
    t.boolean  "is_active",              default: true,  null: false
    t.boolean  "is_blocked",             default: false, null: false
    t.datetime "swap_informed_at"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["region_id"], name: "index_users_on_region_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "wants", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.boolean  "extra_mile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wants", ["item_id"], name: "index_wants_on_item_id", using: :btree
  add_index "wants", ["user_id"], name: "index_wants_on_user_id", using: :btree

end
