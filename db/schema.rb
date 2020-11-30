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

ActiveRecord::Schema.define(version: 2018_09_22_012913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_requests", force: :cascade do |t|
    t.string "school_name"
    t.string "school_address"
    t.string "school_assn"
    t.string "school_league"
    t.string "applicant_name"
    t.string "applicant_email"
    t.string "applicant_phone"
    t.string "applicant_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "message"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.bigint "author_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "namespace"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "school_id"
    t.boolean "sub_editor", default: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "assns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.integer "opponent_id"
    t.string "home_away"
    t.integer "team_id"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "game_stats"
    t.datetime "published_at"
    t.boolean "neutral_site", default: false
    t.integer "admin_id"
    t.index ["admin_id"], name: "index_games_on_admin_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assn_id"
    t.string "classification"
    t.index ["assn_id"], name: "index_leagues_on_assn_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_game_stats", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "stats"
    t.integer "position"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.integer "school_id"
    t.string "middle_initial"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "excerpt"
    t.integer "game_id"
    t.string "header_image_file_name"
    t.string "header_image_content_type"
    t.bigint "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.boolean "email", default: false, null: false
    t.integer "admin_id"
    t.string "slug"
    t.datetime "published_at"
    t.index ["admin_id"], name: "index_posts_on_admin_id"
    t.index ["game_id"], name: "index_posts_on_game_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "mascot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assn_id"
    t.string "address_1"
    t.string "address_2"
    t.string "athletic_director_name"
    t.string "athletic_director_email"
    t.string "athletic_director_phone"
    t.string "short_name"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "year"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sport_id"
    t.boolean "current", default: false
  end

  create_table "team_players", force: :cascade do |t|
    t.integer "team_id"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_team_players_on_deleted_at"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "season_id"
    t.integer "league_id"
    t.string "sport_id"
    t.string "coach_name"
    t.string "coach_email"
    t.string "coach_phone"
    t.string "competitive_class"
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["school_id"], name: "index_teams_on_school_id"
    t.index ["sport_id"], name: "index_teams_on_sport_id"
  end

end
