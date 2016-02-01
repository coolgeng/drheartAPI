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

ActiveRecord::Schema.define(version: 20160201061919) do

  create_table "activities", id: false, force: :cascade do |t|
    t.string  "Date",                              limit: 255
    t.string  "Start_Time",                        limit: 255
    t.string  "Event_Type",                        limit: 255
    t.integer "Duration_Seconds",                  limit: 4
    t.integer "Seconds_Paused",                    limit: 4
    t.integer "Calories_Burned",                   limit: 4
    t.string  "Calories_Burned_Carbs",             limit: 255
    t.string  "Calories_Burned_Fats",              limit: 255
    t.string  "HR_Lowest",                         limit: 255
    t.string  "HR_Peak",                           limit: 255
    t.string  "HR_Average",                        limit: 255
    t.string  "Total_Miles_Moved",                 limit: 255
    t.string  "Cardio_Benefit",                    limit: 255
    t.string  "Minutes_Under_50%_HR",              limit: 255
    t.string  "Minutes_In_HRZ_Very_Light_50%_60%", limit: 255
    t.string  "Minutes_In_HRZ_Light_60%_70%",      limit: 255
    t.string  "Minutes_In_HRZ_Moderate_70%_80%",   limit: 255
    t.string  "Minutes_In_HRZ_Hard_80%_90%",       limit: 255
    t.string  "Minutes_In_HRZ_Very_Hard_90%_Plus", limit: 255
    t.string  "HR_Finish",                         limit: 255
    t.string  "HR_Recovery_Rate_1_Min",            limit: 255
    t.string  "HR_Recovery_Rate_2_Min",            limit: 255
    t.string  "Recovery_Time_Seconds",             limit: 255
    t.string  "Bike_Average_MPH",                  limit: 255
    t.string  "Bike_Max_MPH",                      limit: 255
    t.string  "Elevation_Highest_Feet",            limit: 255
    t.string  "Elevation_Lowest_Feet",             limit: 255
    t.string  "Elevation_Gain_Feet",               limit: 255
    t.string  "Elevation_Loss_Feet",               limit: 255
    t.string  "Wake_Up_Time",                      limit: 255
    t.integer "Seconds_Awake",                     limit: 4
    t.integer "Seconds_Asleep_Total",              limit: 4
    t.integer "Seconds_Asleep_Restful",            limit: 4
    t.integer "Seconds_Asleep_Light",              limit: 4
    t.integer "Wake_Ups",                          limit: 4
    t.integer "Seconds_to_Fall_Asleep",            limit: 4
    t.integer "Sleep_Efficiency",                  limit: 4
    t.string  "Sleep_Restoration",                 limit: 255
    t.string  "Sleep_HR_Resting",                  limit: 255
    t.string  "Sleep_Auto_Detect",                 limit: 255
    t.string  "GW_Plan_Name",                      limit: 255
    t.string  "GW_Reps_Performed",                 limit: 255
    t.string  "GW_Rounds_Performed",               limit: 255
    t.string  "Golf_Course_Name",                  limit: 255
    t.string  "Golf_Course_Par",                   limit: 255
    t.string  "Golf_Total_Score",                  limit: 255
    t.string  "Golf_Par_or_Better",                limit: 255
    t.string  "Golf_Pace_of_Play_Minutes",         limit: 255
    t.string  "Golf_Longest_Drive_Yards",          limit: 255
  end

  create_table "claims_src_details", primary_key: "Claim_Key_ID", force: :cascade do |t|
    t.integer  "Claim_Number",          limit: 8,   null: false
    t.string   "Member_Id",             limit: 255, null: false
    t.string   "Diagnosis_Code",        limit: 255
    t.string   "Diagnosis_Description", limit: 255
    t.string   "Diagnosis_Result",      limit: 255
    t.datetime "Service_From_Date"
    t.datetime "Service_End_Date"
  end

  create_table "claims_src_hcc", primary_key: "Key_ID", force: :cascade do |t|
    t.string  "Member_Id",          limit: 255, null: false
    t.string  "DOS_Year",           limit: 4,   null: false
    t.string  "HCC_Model_Year",     limit: 4,   null: false
    t.integer "HCC_Model_ID",       limit: 4,   null: false
    t.integer "HCC",                limit: 4,   null: false
    t.integer "NonSubmittable",     limit: 4,   null: false
    t.integer "Hierachy_Exclusion", limit: 4,   null: false
    t.integer "Claim_Key_ID",       limit: 8,   null: false
    t.integer "Claim_Number",       limit: 8,   null: false
  end

  create_table "daily_summary", id: false, force: :cascade do |t|
    t.datetime "Date"
    t.integer  "Steps",                         limit: 4
    t.integer  "Calories",                      limit: 4
    t.integer  "HR_Lowest",                     limit: 4
    t.integer  "HR_Highest",                    limit: 4
    t.integer  "HR_Average",                    limit: 4
    t.float    "Total_Miles_Moved",             limit: 24
    t.integer  "Active_Hours",                  limit: 4
    t.integer  "Total_Seconds_All_Activities",  limit: 4
    t.integer  "Total_Calories_All_Activities", limit: 4
    t.integer  "Sleep_Events",                  limit: 4
    t.integer  "Sleep_Total_Calories",          limit: 4
    t.integer  "Total_Seconds_Slept",           limit: 4
    t.integer  "Run_Events",                    limit: 4
    t.integer  "Run_Total_Seconds",             limit: 4
    t.integer  "Total_Miles_Run",               limit: 4
    t.integer  "Run_Total_Calories",            limit: 4
    t.integer  "Bike_Events",                   limit: 4
    t.integer  "Bike_Total_Seconds",            limit: 4
    t.integer  "Total_Miles_Biked",             limit: 4
    t.integer  "Bike_Total_Calories",           limit: 4
    t.integer  "Exercise_Events",               limit: 4
    t.integer  "Exercise_Total_Seconds",        limit: 4
    t.integer  "Exercise_Total_Calories",       limit: 4
    t.integer  "Guided_Workout_Events",         limit: 4
    t.integer  "Guided_Workout_Total_Seconds",  limit: 4
    t.integer  "Guided_Workout_Total_Calories", limit: 4
    t.integer  "Golf_Events",                   limit: 4
    t.integer  "Golf_Total_Seconds",            limit: 4
    t.integer  "Total_Miles_Golfed",            limit: 4
    t.integer  "Golf_Total_Calories",           limit: 4
  end

  create_table "demo_sys_agesex", primary_key: "Key_ID", force: :cascade do |t|
    t.integer "HCC_Model_ID",     limit: 4,  null: false
    t.string  "RAFactorTypeCode", limit: 1,  null: false
    t.string  "Sex",              limit: 1,  null: false
    t.string  "RiskAdjAgeGroup",  limit: 4,  null: false
    t.float   "RiskFactor",       limit: 24, null: false
  end

  create_table "demo_sys_medicaid", primary_key: "Key_ID", force: :cascade do |t|
    t.integer "HCC_Model_ID",     limit: 4,  null: false
    t.string  "RAFactorTypeCode", limit: 1,  null: false
    t.string  "Sex",              limit: 1,  null: false
    t.float   "RiskFactor",       limit: 24, null: false
    t.string  "MedicaidInd",      limit: 1,  null: false
    t.string  "AgedDisabled",     limit: 1,  null: false
  end

  create_table "demo_sys_newenrollee", primary_key: "Key_ID", force: :cascade do |t|
    t.integer "HCC_Model_ID",     limit: 4,  null: false
    t.string  "RAFactorTypeCode", limit: 1,  null: false
    t.string  "Sex",              limit: 1,  null: false
    t.string  "RiskAdjAgeGroup",  limit: 4,  null: false
    t.float   "RiskFactor",       limit: 24, null: false
    t.string  "MedicaidInd",      limit: 1,  null: false
    t.string  "OREC",             limit: 1,  null: false
  end

  create_table "demo_sys_orec", primary_key: "Key_ID", force: :cascade do |t|
    t.integer "HCC_Model_ID",     limit: 4,  null: false
    t.string  "RAFactorTypeCode", limit: 1,  null: false
    t.string  "Sex",              limit: 1,  null: false
    t.float   "RiskFactor",       limit: 24, null: false
    t.string  "OREC",             limit: 1,  null: false
  end

  create_table "diagnosiscodetohcc_sys_mapping", id: false, force: :cascade do |t|
    t.integer  "HCC_Model_ID",                limit: 4,   null: false
    t.string   "Diag_Code",                   limit: 10,  null: false
    t.string   "Diag_Code_Short_Description", limit: 255, null: false
    t.integer  "HCC",                         limit: 4,   null: false
    t.datetime "Diag_Effective_Date"
    t.datetime "Diag_Term_Date"
    t.integer  "ICD_Version",                 limit: 4,   null: false
  end

  create_table "doctor_patients", id: false, force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.integer  "doctor_id",  limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "doctor_patients", ["patient_id", "doctor_id"], name: "index_doctor_patients_on_patient_id_and_doctor_id", unique: true, using: :btree

  create_table "doctors", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "avatar",     limit: 255
    t.string   "hospital",   limit: 255
    t.string   "sector",     limit: 255
    t.string   "position",   limit: 255
    t.integer  "sex",        limit: 4
    t.integer  "age",        limit: 4
  end

  add_index "doctors", ["user_id"], name: "index_doctors_on_user_id", using: :btree

  create_table "doctors_patients", force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.integer  "doctor_id",  limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "doctors_patients", ["doctor_id"], name: "index_doctors_patients_on_doctor_id", using: :btree
  add_index "doctors_patients", ["patient_id"], name: "index_doctors_patients_on_patient_id", using: :btree

  create_table "hcc_sys_hcc_model_mapping", id: false, force: :cascade do |t|
    t.integer "HCC_Model_ID",              limit: 4,   null: false
    t.string  "HCC_Model_Description",     limit: 255, null: false
    t.string  "HCC_Model_Year",            limit: 4,   null: false
    t.string  "HCC_Support_Table_Name",    limit: 255
    t.string  "HCC_Calculation_Indicator", limit: 1,   null: false
    t.string  "RAF_Support_Table_Name",    limit: 255
    t.string  "RAF_Calculation_Indicator", limit: 1,   null: false
  end

  create_table "hcc_sys_hierachy_exclusion", id: false, force: :cascade do |t|
    t.integer "HCC_Model_ID", limit: 4, null: false
    t.integer "Higher_HCC",   limit: 4, null: false
    t.integer "Current_HCC",  limit: 4, null: false
  end

  create_table "hcc_sys_risk_score_disabled_disease_interactions", primary_key: "Key_ID", force: :cascade do |t|
    t.integer "HCC_Model_ID",                 limit: 4,   null: false
    t.string  "Disabled_Disease_Code",        limit: 255, null: false
    t.string  "Disabled_Disease_Description", limit: 255, null: false
    t.integer "HCC",                          limit: 4,   null: false
    t.float   "CMS_Community_Factors",        limit: 24,  null: false
    t.float   "CMS_Institutional_Factors",    limit: 24,  null: false
  end

  create_table "hcc_sys_risk_score_disease_group", primary_key: "Key_ID", force: :cascade do |t|
    t.integer "HCC_Model_ID",                    limit: 4,   null: false
    t.integer "HCC",                             limit: 4,   null: false
    t.string  "Disease_Group_Short_Desc",        limit: 255, null: false
    t.string  "Disease_Group_Long_Desc",         limit: 255, null: false
    t.string  "Chronic_Condition_Indicator",     limit: 255, null: false
    t.string  "Disease_Category",                limit: 255, null: false
    t.float   "CMS_HCC_Risk_Community_Base",     limit: 24,  null: false
    t.float   "CMS_HCC_Risk_Institutional_Base", limit: 24,  null: false
  end

  create_table "hcc_sys_risk_score_disease_interactions", primary_key: "Key_ID", force: :cascade do |t|
    t.integer "HCC_Model_ID",              limit: 4,   null: false
    t.string  "Interaction_Number",        limit: 255, null: false
    t.string  "Interactive_Groups",        limit: 255, null: false
    t.string  "Individual_Groups",         limit: 255, null: false
    t.float   "CMS_Community_Factors",     limit: 24,  null: false
    t.float   "CMS_Institutional_Factors", limit: 24,  null: false
    t.integer "Instances",                 limit: 4,   null: false
  end

  create_table "hcc_sys_risk_score_disease_interactions_mapping", primary_key: "Key_ID", force: :cascade do |t|
    t.integer "HCC_Model_ID",        limit: 4,   null: false
    t.string  "Individual_Groups",   limit: 255, null: false
    t.string  "Disease_Description", limit: 255, null: false
    t.string  "HCC_Groups",          limit: 255, null: false
    t.integer "HCC",                 limit: 4,   null: false
  end

  create_table "hcc_sys_risk_score_normalization_coding_intensity", primary_key: "Key_ID", force: :cascade do |t|
    t.integer "HCC_Model_ID",                  limit: 4,  null: false
    t.string  "DOS_Year",                      limit: 4,  null: false
    t.string  "HCC_Model_Year",                limit: 4,  null: false
    t.float   "Normalization",                 limit: 24, null: false
    t.float   "Coding_intensity",              limit: 24, null: false
    t.float   "Combined_Normalization_Coding", limit: 24, null: false
  end

  create_table "heart_rates", force: :cascade do |t|
    t.integer  "rate",           limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",        limit: 4
    t.integer  "patient_id",     limit: 4
    t.integer  "occurring_time", limit: 8
  end

  add_index "heart_rates", ["patient_id"], name: "index_heart_rates_on_patient_id", using: :btree
  add_index "heart_rates", ["user_id"], name: "index_heart_rates_on_user_id", using: :btree

  create_table "incidents", force: :cascade do |t|
    t.integer  "patient_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "doctor_id",      limit: 4
    t.string   "desp",           limit: 255
    t.string   "treat",          limit: 255
    t.integer  "state",          limit: 4
    t.integer  "occurring_time", limit: 8
  end

  add_index "incidents", ["doctor_id"], name: "index_incidents_on_doctor_id", using: :btree
  add_index "incidents", ["patient_id"], name: "index_incidents_on_patient_id", using: :btree

  create_table "membership_src_details", primary_key: "Member_Key_ID", force: :cascade do |t|
    t.string   "Member_Id",         limit: 255, null: false
    t.string   "Member_Last_Name",  limit: 255, null: false
    t.string   "Member_First_Name", limit: 255, null: false
    t.string   "Member_Full_Name",  limit: 255, null: false
    t.string   "Member_Sex",        limit: 255, null: false
    t.date     "Member_DOB"
    t.string   "Member_Province",   limit: 255
    t.string   "Member_City",       limit: 255
    t.string   "Member_Address",    limit: 255
    t.string   "Member_Phone",      limit: 255
    t.datetime "Member_Start_Date"
    t.datetime "Member_End_Date"
    t.datetime "Member_Death_Date"
  end

  create_table "membership_src_risk_score", primary_key: "Key_ID", force: :cascade do |t|
    t.string  "Member_Id",                                  limit: 255, null: false
    t.string  "Member_Sex",                                 limit: 255, null: false
    t.date    "Member_DOB"
    t.string  "DOS_Year",                                   limit: 4,   null: false
    t.string  "HCC_Model_Year",                             limit: 4,   null: false
    t.integer "HCC_Model_ID",                               limit: 4,   null: false
    t.integer "HCC_Submittable_Count",                      limit: 4,   null: false
    t.float   "Risk_Score_HCC_Claims",                      limit: 24,  null: false
    t.integer "Disease_Interaction_Count",                  limit: 4,   null: false
    t.float   "Risk_Score_HCC_Disable_Disease_Interaction", limit: 24,  null: false
    t.float   "Risk_Score_HCC_Disease_Interaction",         limit: 24,  null: false
    t.float   "Risk_Score_HCC_Claims_Total",                limit: 24,  null: false
  end

  create_table "patient_doctors", id: false, force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.integer  "doctor_id",  limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "patient_doctors", ["doctor_id"], name: "index_patient_doctors_on_doctor_id", using: :btree
  add_index "patient_doctors", ["patient_id", "doctor_id"], name: "index_patient_doctors_on_patient_id_and_doctor_id", using: :btree
  add_index "patient_doctors", ["patient_id"], name: "index_patient_doctors_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "avatar",     limit: 255
    t.integer  "sex",        limit: 4
    t.integer  "age",        limit: 4
  end

  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "session",    limit: 255
    t.string   "token",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest",       limit: 255
    t.string   "password_confirmation", limit: 255
    t.string   "password_salt",         limit: 255
    t.string   "email",                 limit: 255
    t.string   "email_confirmation",    limit: 255
    t.string   "phone",                 limit: 255
  end

  create_table "year_config", id: false, force: :cascade do |t|
    t.datetime "Current_Year",  null: false
    t.datetime "Previous_Year", null: false
  end

end
