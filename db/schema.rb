# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_20_153624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", primary_key: "commentid", id: :integer, default: nil, force: :cascade do |t|
    t.string "context", limit: 200
    t.integer "comment_owner", null: false
    t.integer "which_receipt_id", null: false
  end

  create_table "database_structures", force: :cascade do |t|
  end

  create_table "receipts", primary_key: "fatura_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "location", limit: 45, null: false
    t.date "date"
    t.float "total_cost", null: false
    t.float "tax", null: false
    t.string "image", limit: 1000
    t.integer "receipt_owner", null: false
    t.integer "receipt_tag_id", null: false
  end

  create_table "tags", primary_key: "tagid", id: :integer, default: nil, force: :cascade do |t|
    t.string "tagname", limit: 45, null: false
    t.integer "tagnumber"
    t.string "tagfoto", limit: 1000
  end

  create_table "users", primary_key: "userid", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "email", limit: 45, null: false
    t.string "password", limit: 45, null: false
  end

  add_foreign_key "comments", "receipts", column: "which_receipt_id", primary_key: "fatura_id", name: "comment_to_receipt_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "comments", "users", column: "comment_owner", primary_key: "userid", name: "comment_fk"
  add_foreign_key "receipts", "tags", column: "receipt_tag_id", primary_key: "tagid", name: "receipt_fk"
  add_foreign_key "receipts", "users", column: "receipt_owner", primary_key: "userid", name: "receipt_fk_1"
end
