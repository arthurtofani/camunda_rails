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

ActiveRecord::Schema.define(version: 2019_08_19_234342) do

  create_table "camunda_rails_external_tasks", force: :cascade do |t|
    t.string "camunda_id"
    t.string "state", default: "new"
    t.string "activity_id"
    t.string "activity_instance_id"
    t.string "error_message"
    t.string "business_key"
    t.string "error_details"
    t.string "execution_id"
    t.string "lock_expiration_time"
    t.string "process_definition_id"
    t.string "process_definition_key"
    t.string "process_instance_id"
    t.string "tenant_id"
    t.string "retries"
    t.string "suspended"
    t.string "worker_id"
    t.string "priority"
    t.string "topic_name"
    t.json "variables"
    t.json "result_variables"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camunda_rails_message_responses", force: :cascade do |t|
    t.integer "code"
    t.string "result_type"
    t.json "execution"
    t.json "process_instance"
    t.integer "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "message_id_idx"
  end

  create_table "camunda_rails_messages", force: :cascade do |t|
    t.string "message_name"
    t.string "business_key"
    t.string "tenant_id"
    t.boolean "without_tenant_id"
    t.string "process_instance_id"
    t.json "correlation_keys"
    t.json "process_variables"
    t.boolean "all"
    t.boolean "result_enabled"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
