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

ActiveRecord::Schema.define(version: 20170911103709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "total_weeks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "razorpay_payment_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.text "description"
    t.integer "week"
    t.integer "order_in_week"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_videos_on_course_id"
  end

  create_table "views", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "video_id"
    t.bigint "course_id"
    t.boolean "played", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_views_on_course_id"
    t.index ["user_id", "course_id", "video_id"], name: "index_views_on_user_id_and_course_id_and_video_id"
    t.index ["user_id", "course_id"], name: "index_views_on_user_id_and_course_id"
    t.index ["user_id"], name: "index_views_on_user_id"
    t.index ["video_id"], name: "index_views_on_video_id"
  end

  add_foreign_key "videos", "courses"
  add_foreign_key "views", "courses"
  add_foreign_key "views", "users"
  add_foreign_key "views", "videos"
end
