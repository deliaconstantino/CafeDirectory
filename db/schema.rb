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

ActiveRecord::Schema.define(version: 2021_03_15_170451) do

  create_table "cafe_categories", force: :cascade do |t|
    t.integer "cafe_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cafe_id"], name: "index_cafe_categories_on_cafe_id"
    t.index ["category_id"], name: "index_cafe_categories_on_category_id"
  end

  create_table "cafes", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "speciality"
    t.boolean "table_chair_seating"
    t.boolean "cushioned_seating"
    t.boolean "outdoor_seating"
    t.boolean "wifi"
    t.boolean "food"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "open_hour"
    t.integer "close_hour"
    t.integer "open_minute"
    t.integer "close_minute"
  end

  create_table "categories", force: :cascade do |t|
    t.string "names"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "cafe_id"
    t.integer "user_id"
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cafe_id"], name: "index_reviews_on_cafe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cafe_categories", "cafes"
  add_foreign_key "cafe_categories", "categories"
  add_foreign_key "reviews", "cafes"
  add_foreign_key "reviews", "users"
end
