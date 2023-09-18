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

ActiveRecord::Schema.define(version: 2023_08_22_171408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "size_id"
    t.bigint "kind_id"
    t.index ["kind_id"], name: "index_breeds_on_kind_id"
    t.index ["size_id"], name: "index_breeds_on_size_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frecuencies", force: :cascade do |t|
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.date "last_purchase"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "breed_id"
    t.string "phase"
    t.bigint "size_id"
    t.bigint "kind_id"
    t.bigint "user_id"
    t.index ["breed_id"], name: "index_pets_on_breed_id"
    t.index ["kind_id"], name: "index_pets_on_kind_id"
    t.index ["product_id"], name: "index_pets_on_product_id"
    t.index ["size_id"], name: "index_pets_on_size_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pet_id"
    t.bigint "product_id"
    t.bigint "frecuency_id"
    t.bigint "quantity_id"
    t.date "initial_date"
    t.date "delivered_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frecuency_id"], name: "index_plans_on_frecuency_id"
    t.index ["pet_id"], name: "index_plans_on_pet_id"
    t.index ["product_id"], name: "index_plans_on_product_id"
    t.index ["quantity_id"], name: "index_plans_on_quantity_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "existence"
    t.decimal "price"
    t.string "image"
    t.bigint "category_id"
    t.bigint "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "pound_price"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "programs", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "product_id"
    t.bigint "quantity_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "frecuency_id"
    t.date "initial_date"
    t.date "delivered_date"
    t.index ["frecuency_id"], name: "index_programs_on_frecuency_id"
    t.index ["pet_id"], name: "index_programs_on_pet_id"
    t.index ["product_id"], name: "index_programs_on_product_id"
    t.index ["quantity_id"], name: "index_programs_on_quantity_id"
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "quantities", force: :cascade do |t|
    t.string "phase"
    t.string "age"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "size_id"
    t.index ["size_id"], name: "index_quantities_on_size_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "weight"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "seller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "image"
    t.boolean "admin", default: false
    t.string "name"
    t.string "address"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouse_records", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quantity"
    t.bigint "supplier_id"
    t.bigint "products_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["products_id"], name: "index_warehouse_records_on_products_id"
    t.index ["supplier_id"], name: "index_warehouse_records_on_supplier_id"
  end

  add_foreign_key "breeds", "kinds"
  add_foreign_key "breeds", "sizes"
  add_foreign_key "pets", "breeds"
  add_foreign_key "pets", "kinds"
  add_foreign_key "pets", "products"
  add_foreign_key "pets", "sizes"
  add_foreign_key "pets", "users"
  add_foreign_key "plans", "frecuencies"
  add_foreign_key "plans", "pets"
  add_foreign_key "plans", "products"
  add_foreign_key "plans", "quantities"
  add_foreign_key "plans", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "suppliers"
  add_foreign_key "programs", "frecuencies"
  add_foreign_key "programs", "pets"
  add_foreign_key "programs", "products"
  add_foreign_key "programs", "quantities"
  add_foreign_key "programs", "users"
  add_foreign_key "quantities", "sizes"
  add_foreign_key "warehouse_records", "products", column: "products_id"
  add_foreign_key "warehouse_records", "suppliers"
end
