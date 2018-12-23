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

ActiveRecord::Schema.define(version: 2018_12_18_065613) do

  create_table "board_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "stylist_id"
    t.integer "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stylist_id"
    t.string "board_image_id"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer "user_chat_id"
    t.text "content"
    t.boolean "stylist", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_chat_id"], name: "index_chat_messages_on_user_chat_id"
  end

  create_table "entries", force: :cascade do |t|
    t.integer "stylist_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["stylist_id"], name: "index_entries_on_stylist_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favorites_on_post_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "stylist_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "stylist_id"
    t.integer "room_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["stylist_id"], name: "index_messages_on_stylist_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "post_name"
    t.string "post_image_id"
    t.text "post_opinion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stylist_id"
    t.integer "category"
    t.integer "impressions_count", default: 0
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stylist_id"
  end

  create_table "stylists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stylist_name"
    t.string "salon_name"
    t.string "stylist_image_id"
    t.integer "stylist_sex"
    t.string "stylist_age"
    t.string "stylist_region"
    t.string "stylist_hobby"
    t.string "fort"
    t.string "history"
    t.text "stylist_introduction"
    t.string "post_code"
    t.string "address"
    t.string "phone_number"
    t.string "holiday"
    t.string "business_houre"
    t.string "menu"
    t.string "salon_image_id"
    t.text "salon_introduction"
    t.string "salon_url"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_stylists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_stylists_on_reset_password_token", unique: true
  end

  create_table "user_chats", force: :cascade do |t|
    t.integer "stylist_id"
    t.integer "user_id"
    t.string "chat_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id"], name: "index_user_chats_on_stylist_id"
    t.index ["user_id"], name: "index_user_chats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "user_image_id"
    t.integer "user_sex"
    t.string "user_age"
    t.string "user_region"
    t.string "user_hobby"
    t.text "user_introduction"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
