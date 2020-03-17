#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_16_144947) do
ActiveRecord::Schema.define(version: 2020_03_17_150736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beras", force: :cascade do |t|
    t.date "bra_date"
    t.integer "risk1"
    t.integer "risk2"
    t.integer "evolrisk1"
    t.integer "evolrisk2"
    t.integer "altitude"
    t.boolean "exposure_ne"
    t.boolean "exposure_e"
    t.boolean "exposure_s"
    t.boolean "exposure_se"
    t.boolean "exposure_sw"
    t.boolean "exposure_n"
    t.boolean "exposure_nw"
    t.boolean "exposure_w"
    t.text "comment"
    t.integer "risk_max"
    t.text "accidentel_text"
    t.text "naturel_text"
    t.bigint "mountain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mountain_id"], name: "index_beras_on_mountain_id"
  end

  create_table "coordinates", force: :cascade do |t|
    t.integer "altitude"
    t.float "latitude"
    t.float "longitude"
    t.bigint "itinerary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_coordinates_on_itinerary_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "name"
    t.bigint "mountain_range_id"
    t.integer "elevation"
    t.text "departure"
    t.text "arrival"
    t.string "departure"
    t.string "arrival"
    t.string "ascent_difficulty"
    t.string "ski_difficulty"
    t.text "description"
    t.time "duration"
    t.integer "duration"
    t.bigint "mountain_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mountain_range_id"], name: "index_itineraries_on_mountain_range_id"
    t.index ["mountain_id"], name: "index_itineraries_on_mountain_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "mountain_ranges", force: :cascade do |t|
  create_table "mountains", force: :cascade do |t|
    t.string "name"
    t.bigint "risk_level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["risk_level_id"], name: "index_mountain_ranges_on_risk_level_id"
  end

  create_table "risk_levels", force: :cascade do |t|
    t.date "bra_date"
    t.integer "risk1"
    t.integer "risk2"
    t.integer "evolrisk1"
    t.integer "evolrisk2"
    t.integer "altitude"
    t.text "exposures", default: [], array: true
    t.integer "risk_max"
    t.text "accidentel_text"
    t.text "naturel_text"
  create_table "reviews", force: :cascade do |t|
    t.integer "grade"
    t.string "comment"
    t.date "date"
    t.bigint "itinerary_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_reviews_on_itinerary_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
@@ -65,6 +97,10 @@
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "itineraries", "mountain_ranges"
  add_foreign_key "mountain_ranges", "risk_levels"
  add_foreign_key "beras", "mountains"
  add_foreign_key "coordinates", "itineraries"
  add_foreign_key "itineraries", "mountains"
  add_foreign_key "itineraries", "users"
  add_foreign_key "reviews", "itineraries"
  add_foreign_key "reviews", "users"
end
