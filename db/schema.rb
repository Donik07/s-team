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

ActiveRecord::Schema[7.0].define(version: 2022_04_06_203549) do
# Could not dump table "answers" because of following StandardError
#   Unknown type '' for column 'body'

  create_table "question_responsibles", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id", "user_id"], name: "index_question_responsibles_on_question_id_and_user_id", unique: true
    t.index ["question_id"], name: "index_question_responsibles_on_question_id"
    t.index ["user_id"], name: "index_question_responsibles_on_user_id"
  end

# Could not dump table "questions" because of following StandardError
#   Unknown type '' for column 'title'

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_token_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "question_responsibles", "questions"
  add_foreign_key "question_responsibles", "users"
  add_foreign_key "questions", "users"
end
