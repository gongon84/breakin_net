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

ActiveRecord::Schema.define(version: 2021_04_13_032525) do

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.string "pref"
    t.string "place"
    t.string "name"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "moves", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "skill"
    t.string "limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_moves_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "pref"
    t.string "place"
    t.string "station"
    t.string "facility"
    t.string "time"
    t.string "price"
    t.string "tag"
    t.string "memo"
    t.string "image_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "url"
    t.string "profile"
    t.string "image_name"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "moves", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "questions", "users"
end
