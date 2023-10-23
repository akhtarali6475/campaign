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

ActiveRecord::Schema.define(version: 2023_10_23_111257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.decimal "budget", precision: 12, scale: 2
    t.text "description"
    t.bigint "campaign_id"
    t.bigint "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaigns_on_campaign_id"
    t.index ["contact_id"], name: "index_campaigns_on_contact_id"
  end

  create_table "campaigns_contacts", force: :cascade do |t|
    t.bigint "campaign_id"
    t.bigint "contact_id"
    t.index ["campaign_id"], name: "index_campaigns_contacts_on_campaign_id"
    t.index ["contact_id"], name: "index_campaigns_contacts_on_contact_id"
  end

  create_table "campaigns_transactions", force: :cascade do |t|
    t.bigint "campaign_id"
    t.bigint "transaction_id"
    t.index ["campaign_id"], name: "index_campaigns_transactions_on_campaign_id"
    t.index ["transaction_id"], name: "index_campaigns_transactions_on_transaction_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts_transactions", force: :cascade do |t|
    t.bigint "contact_id"
    t.bigint "transaction_id"
    t.index ["contact_id"], name: "index_contacts_transactions_on_contact_id"
    t.index ["transaction_id"], name: "index_contacts_transactions_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaigns_contacts", "campaigns"
  add_foreign_key "campaigns_contacts", "contacts"
  add_foreign_key "campaigns_transactions", "campaigns"
  add_foreign_key "campaigns_transactions", "transactions"
  add_foreign_key "contacts_transactions", "contacts"
  add_foreign_key "contacts_transactions", "transactions"
end
