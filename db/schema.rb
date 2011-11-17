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

ActiveRecord::Schema.define(:version => 20111114133431) do

  create_table "categoryalls", :force => true do |t|
    t.string   "name",         :null => false
    t.integer  "mailstart_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "categoryalls", ["mailstart_id"], :name => "categoryalls_mailstart_id_to_mailstarts"

  create_table "categoryalls_subcontacts", :id => false, :force => true do |t|
    t.integer "subcontact_id",  :null => false
    t.integer "categoryall_id", :null => false
  end

  add_index "categoryalls_subcontacts", ["categoryall_id"], :name => "categoryalls_subcontacts_categoryall_id_to_categoryalls"
  add_index "categoryalls_subcontacts", ["subcontact_id"], :name => "categoryalls_subcontacts_subcontact_id_to_subcontacts"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "emails", :force => true do |t|
    t.string   "name"
    t.string   "adress"
    t.string   "cppostal"
    t.string   "tel"
    t.string   "addr_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "emails_newsletters", :id => false, :force => true do |t|
    t.integer "newsletter_id", :null => false
    t.integer "email_id",      :null => false
  end

  add_index "emails_newsletters", ["email_id"], :name => "emails_newsletters_email_id"
  add_index "emails_newsletters", ["newsletter_id"], :name => "emails_newsletters_newsletter_id"

  create_table "emails_subcontacts", :id => false, :force => true do |t|
    t.integer "subcontact_id", :null => false
    t.integer "email_id",      :null => false
  end

  add_index "emails_subcontacts", ["email_id"], :name => "emails_subcontacts_email_id_to_mails"
  add_index "emails_subcontacts", ["subcontact_id"], :name => "emails_subcontacts_subcontact_id_to_subcontacts"

  create_table "mailstarts", :force => true do |t|
    t.string   "name",       :default => ""
    t.string   "mail",                       :null => false
    t.integer  "user_id",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "mailstarts", ["user_id"], :name => "mailstarts_user_id_to_users"

  create_table "newsletters", :force => true do |t|
    t.string   "name",                                         :null => false
    t.string   "mailadd"
    t.text     "content",        :limit => 255,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mailstart_id",                  :default => 1, :null => false
    t.integer  "categoryall_id",                :default => 1, :null => false
    t.integer  "cptstatistic",                  :default => 0
  end

  add_index "newsletters", ["mailstart_id"], :name => "altered_newsletters_mailstart_id_to_mailstarts"

  create_table "newsletters_subcontacts", :force => true do |t|
    t.integer "subcontact_id", :null => false
    t.integer "newsletter_id", :null => false
  end

  add_index "newsletters_subcontacts", ["newsletter_id"], :name => "newsletters_subcontacts_newsletter_id_to_subcontacts"
  add_index "newsletters_subcontacts", ["subcontact_id"], :name => "newsletters_subcontacts_subcontact_id_to_subcontacts"

  create_table "statistics", :force => true do |t|
    t.string  "ip",            :default => "", :null => false
    t.string  "localization",  :default => "", :null => false
    t.integer "newsletter_id",                 :null => false
  end

  add_index "statistics", ["newsletter_id"], :name => "statistics_newsletter_id_to_newsletters"

  create_table "subcontacts", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",   :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "language",                              :default => "fr"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
