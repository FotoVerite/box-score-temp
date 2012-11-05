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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121105164418) do

  create_table "account_requests", :force => true do |t|
    t.string   "school_name"
    t.string   "school_address"
    t.string   "school_assn"
    t.string   "school_league"
    t.string   "applicant_name"
    t.string   "applicant_email"
    t.string   "applicant_phone"
    t.string   "applicant_position"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.text     "message"
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "school_id"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "assns", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.date     "date"
    t.integer  "opponent_id"
    t.string   "home_away"
    t.integer  "team_id"
    t.integer  "season_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.text     "game_stats"
    t.datetime "published_at"
    t.boolean  "neutral_site", :default => false
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "assn_id"
    t.string   "classification"
  end

  add_index "leagues", ["assn_id"], :name => "index_leagues_on_assn_id"

  create_table "player_game_stats", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "stats"
    t.integer  "position"
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "last_name"
    t.integer  "school_id"
    t.string   "middle_initial"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "mascot"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "assn_id"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "athletic_director_name"
    t.string   "athletic_director_email"
    t.string   "athletic_director_phone"
  end

  create_table "seasons", :force => true do |t|
    t.string   "year"
    t.date     "start_date"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "sport_id"
    t.boolean  "current",    :default => false
  end

  create_table "team_players", :force => true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.integer  "school_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "season_id"
    t.integer  "league_id"
    t.string   "sport_id"
    t.string   "coach_name"
    t.string   "coach_email"
    t.string   "coach_phone"
    t.string   "competitive_class"
  end

  add_index "teams", ["league_id"], :name => "index_teams_on_league_id"
  add_index "teams", ["school_id"], :name => "index_teams_on_school_id"
  add_index "teams", ["sport_id"], :name => "index_teams_on_sport_id"

end
