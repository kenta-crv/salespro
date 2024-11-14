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

ActiveRecord::Schema.define(version: 2024_11_14_100720) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "columns", force: :cascade do |t|
    t.string "title"
    t.string "kategory"
    t.string "description"
    t.string "heading_1"
    t.string "file_1"
    t.text "content_1"
    t.string "heading_2"
    t.string "file_2"
    t.text "content_2"
    t.string "heading_3"
    t.string "file_3"
    t.text "content_3"
    t.string "heading_4"
    t.string "file_4"
    t.text "content_4"
    t.string "heading_5"
    t.string "file_5"
    t.text "content_5"
    t.string "heading_6"
    t.string "file_6"
    t.text "content_6"
    t.string "heading_7"
    t.string "file_7"
    t.text "content_7"
    t.string "heading_8"
    t.string "file_8"
    t.text "content_8"
    t.string "heading_9"
    t.string "file_9"
    t.text "content_9"
    t.string "heading_10"
    t.string "file_10"
    t.text "content_10"
    t.string "heading_11"
    t.string "file_11"
    t.string "content_11"
    t.string "heading_12"
    t.string "file_12"
    t.string "content_12"
    t.string "heading_13"
    t.string "file_13"
    t.string "content_13"
    t.string "heading_14"
    t.string "file_14"
    t.string "content_14"
    t.string "heading_15"
    t.string "file_15"
    t.string "content_15"
    t.string "heading_16"
    t.string "file_16"
    t.string "content_16"
    t.string "heading_17"
    t.string "file_17"
    t.string "content_17"
    t.string "heading_18"
    t.string "file_18"
    t.string "content_18"
    t.string "heading_19"
    t.string "file_19"
    t.string "content_19"
    t.string "heading_20"
    t.string "file_20"
    t.string "content_20"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "contract_id", null: false
    t.string "status"
    t.datetime "next"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_comments_on_contract_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "agree"
    t.string "co"
    t.string "president_first"
    t.string "president_last"
    t.string "tel"
    t.string "address"
    t.string "url"
    t.string "recruit_url"
    t.string "work"
    t.string "plan"
    t.string "number"
    t.string "period"
    t.string "remarks"
    t.string "person_first"
    t.string "person_last"
    t.string "person_tel"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "person_email"
    t.string "recruit_url_2"
    t.string "pdf"
    t.string "memo"
    t.string "post_title"
    t.string "contract_date"
    t.string "unit_price"
    t.string "refund"
    t.string "payment"
    t.string "salary"
    t.string "employment_conditions"
    t.string "document_screening"
    t.string "conversion"
  end

  create_table "estimates", force: :cascade do |t|
    t.string "co"
    t.string "name"
    t.string "tel"
    t.string "email"
    t.string "address"
    t.string "url"
    t.string "contents"
    t.string "budget"
    t.string "important"
    t.string "language"
    t.string "order"
    t.string "period"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "prefecture"
    t.string "city"
    t.string "birth"
    t.string "gender"
    t.string "age"
    t.string "hire_date_1"
    t.string "retirement_date_1"
    t.string "content_1"
    t.string "hire_date_2"
    t.string "retirement_date_2"
    t.string "content_2"
    t.string "hire_date_3"
    t.string "retirement_date_3"
    t.string "content_3"
    t.string "requirements"
    t.string "appeal"
    t.string "desired"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer "contract_id"
    t.string "status"
    t.datetime "next"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sfa_id"
    t.index ["contract_id"], name: "index_progresses_on_contract_id"
  end

  create_table "sfas", force: :cascade do |t|
    t.string "co"
    t.string "name"
    t.string "tel"
    t.string "address"
    t.string "email"
    t.string "url"
    t.string "recruit_url"
    t.string "business"
    t.string "first_question"
    t.string "second_question"
    t.string "third_question"
    t.string "remarks"
    t.datetime "meeting_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
