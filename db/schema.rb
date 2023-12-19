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

ActiveRecord::Schema[7.0].define(version: 2023_12_19_131442) do
  create_table "e_frontier_alls", force: :cascade do |t|
    t.integer "no"
    t.string "name"
    t.string "type1"
    t.string "type2"
    t.string "move1"
    t.string "move2"
    t.string "move3"
    t.string "move4"
    t.string "item"
    t.string "effort_values"
    t.string "character"
    t.integer "lap1_flag"
    t.integer "lap2_flag"
    t.integer "lap3_flag"
    t.integer "lap4_flag"
    t.integer "lap5_flag"
    t.integer "lap6_flag"
    t.integer "lap7_flag"
    t.integer "lap8_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pawapuro_fielders", force: :cascade do |t|
    t.integer "player_id"
    t.integer "trajectory"
    t.integer "meat"
    t.integer "power"
    t.integer "running"
    t.integer "arm_strength"
    t.integer "defense"
    t.integer "catching"
    t.integer "chance"
    t.integer "taihidaritousyu"
    t.integer "tourui"
    t.integer "sourui"
    t.integer "soukyuu"
    t.string "other_special_abilities"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pawapuro_pitchers", force: :cascade do |t|
    t.integer "player_id"
    t.integer "main_proper"
    t.integer "starter_proper"
    t.integer "reliever_proper"
    t.integer "closer_proper"
    t.integer "pace"
    t.integer "control"
    t.integer "stamina"
    t.string "second_fastball_type"
    t.string "slider_type_pitch"
    t.integer "slider_type_movement"
    t.string "second_slider_type_pitch"
    t.integer "second_slider_type_movement"
    t.string "curveball_type_pitch"
    t.integer "curveball_type_movement"
    t.string "second_curveball_type_pitch"
    t.integer "second_curveball_type_movement"
    t.string "shootball_type_pitch"
    t.integer "shootball_type_movement"
    t.string "second_shootball_type_pitch"
    t.integer "second_shootball_type_movement"
    t.string "sinker_type_pitch"
    t.integer "sinker_type_movement"
    t.string "second_sinker_type_pitch"
    t.integer "second_sinker_type_movement"
    t.string "forkball_type_pitch"
    t.integer "forkball_type_movement"
    t.string "second_forkball_type_pitch"
    t.integer "second_forkball_type_movement"
    t.integer "taipinch"
    t.integer "taihidaridasya"
    t.integer "utarezuyosa"
    t.integer "nobi"
    t.integer "quick"
    t.string "other_special_abilities"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pawapuro_players", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "player_name"
    t.string "back_name"
    t.date "birthday"
    t.integer "main_position"
    t.integer "sub_position_2"
    t.integer "sub_position_3"
    t.integer "sub_position_4"
    t.integer "sub_position_5"
    t.integer "sub_position_6"
    t.integer "sub_position_7"
    t.string "throws"
    t.string "bats"
    t.integer "pitcher_id"
    t.integer "fielder_id"
    t.text "note"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kaifuku"
    t.integer "kegasinikusa"
    t.string "other_special_abilities"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_name"
    t.string "password_digest"
  end

end
