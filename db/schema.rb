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

ActiveRecord::Schema.define(version: 2019_04_22_171505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliate_events", force: :cascade do |t|
    t.bigint "exchange_id", null: false
    t.datetime "created_at", null: false
    t.date "date", null: false
    t.integer "month", null: false
    t.integer "year", null: false
    t.integer "day", null: false
    t.index ["exchange_id"], name: "index_affiliate_events_on_exchange_id"
    t.index ["year", "month", "day", "exchange_id"], name: "full"
  end

  create_table "exchanges", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.string "xml_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_available", default: false, null: false
    t.string "last_find_error"
    t.string "affiliate_url"
    t.string "affiliate_login"
    t.string "affiliate_password"
    t.datetime "archived_at"
    t.index ["is_available"], name: "index_exchanges_on_is_available"
    t.index ["name"], name: "index_exchanges_on_name", unique: true
    t.index ["url"], name: "index_exchanges_on_url", unique: true
  end

  create_table "payment_systems", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.string "currency_iso_code"
    t.index ["code"], name: "index_payment_systems_on_code", unique: true
    t.index ["name"], name: "index_payment_systems_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "failed_logins_count", default: 0
    t.datetime "lock_expires_at"
    t.string "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string "last_login_from_ip_address"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.boolean "is_admin", default: false, null: false
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at"
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["unlock_token"], name: "index_users_on_unlock_token"
  end

  add_foreign_key "affiliate_events", "exchanges"
end
