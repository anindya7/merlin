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

ActiveRecord::Schema.define(version: 20171108112615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "total_weeks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "audio_book_url"
    t.string "slide_deck_url"
    t.string "slide_deck_title"
    t.string "slide_deck_description"
    t.string "audio_book_title"
    t.string "audio_book_description"
  end

  create_table "option_sets", force: :cascade do |t|
    t.string "name"
    t.integer "noop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "option_sets_options", id: false, force: :cascade do |t|
    t.bigint "option_id", null: false
    t.bigint "option_set_id", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "text"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.bigint "quiz_id"
    t.bigint "option_set_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "mandatory"
    t.index ["option_set_id"], name: "index_questions_on_option_set_id"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quiz_scores", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.bigint "course_id"
    t.boolean "taken", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "score"
    t.index ["course_id"], name: "index_quiz_scores_on_course_id"
    t.index ["quiz_id"], name: "index_quiz_scores_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_scores_on_user_id"
  end

  create_table "quiz_thresholds", force: :cascade do |t|
    t.string "name"
    t.bigint "quiz_id"
    t.integer "min"
    t.integer "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_quiz_thresholds_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id"
    t.integer "week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_in_week"
    t.string "result_text"
    t.index ["course_id"], name: "index_quizzes_on_course_id"
  end

  create_table "referrals", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "refer_name"
    t.string "refer_email"
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
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_id"
    t.boolean "admin", default: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
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
    t.string "pdf_url"
    t.string "sd_url"
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

  add_foreign_key "questions", "option_sets"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quiz_scores", "courses"
  add_foreign_key "quiz_scores", "quizzes"
  add_foreign_key "quiz_scores", "users"
  add_foreign_key "quiz_thresholds", "quizzes"
  add_foreign_key "quizzes", "courses"
  add_foreign_key "videos", "courses"
  add_foreign_key "views", "courses"
  add_foreign_key "views", "users"
  add_foreign_key "views", "videos"
end
