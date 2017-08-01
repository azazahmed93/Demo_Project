# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170801104513) do

  create_table "actors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "appearances", force: :cascade do |t|
    t.string   "role",       limit: 255
    t.integer  "movie_id",   limit: 4
    t.integer  "actor_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "appearances", ["actor_id"], name: "index_appearances_on_actor_id", using: :btree
  add_index "appearances", ["movie_id"], name: "index_appearances_on_movie_id", using: :btree

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "avg",           limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.string   "data_fingerprint",  limit: 255
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "movie_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "favorites", ["movie_id", "user_id"], name: "index_favorites_on_movie_id_and_user_id", unique: true, using: :btree
  add_index "favorites", ["movie_id"], name: "index_favorites_on_movie_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "plot",       limit: 65535
    t.string   "year",       limit: 255
    t.string   "genre",      limit: 255
    t.string   "time",       limit: 255
    t.string   "url",        limit: 255
    t.integer  "rating",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "featured",   limit: 1
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "overall_avg",   limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posters", force: :cascade do |t|
    t.integer  "movie_id",          limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
  end

  add_index "posters", ["movie_id"], name: "index_posters_on_movie_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "stars",         limit: 24,  null: false
    t.string   "dimension",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id",   limit: 4
    t.string   "cacheable_type", limit: 255
    t.float    "avg",            limit: 24,  null: false
    t.integer  "qty",            limit: 4,   null: false
    t.string   "dimension",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "review_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reports", ["review_id", "user_id"], name: "index_reports_on_review_id_and_user_id", unique: true, using: :btree
  add_index "reports", ["review_id"], name: "index_reports_on_review_id", using: :btree
  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "content",      limit: 65535
    t.integer  "user_id",      limit: 4
    t.integer  "movie_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "report_count", limit: 4
  end

  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "admin",                  limit: 1
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "appearances", "actors"
  add_foreign_key "appearances", "movies"
  add_foreign_key "favorites", "movies"
  add_foreign_key "favorites", "users"
  add_foreign_key "posters", "movies"
  add_foreign_key "reports", "reviews"
  add_foreign_key "reports", "users"
  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
end
