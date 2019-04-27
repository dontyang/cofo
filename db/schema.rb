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

ActiveRecord::Schema.define(version: 20190427124852) do

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "mobile"
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email"
    t.index ["mobile"], name: "index_employees_on_mobile"
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "project_id"
    t.integer "vendor_id"
    t.string "name"
    t.decimal "quantity", precision: 10, scale: 2
    t.string "unit"
    t.decimal "amount", precision: 10, scale: 2
    t.date "purchase_on"
    t.string "note"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", comment: "项目名称"
    t.string "address", comment: "项目地址"
    t.date "start_on"
    t.string "sigonggongyi", limit: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area", limit: 1024
    t.string "xianchang", limit: 1024
    t.string "yangban", limit: 1024
    t.string "jihua", limit: 1024
    t.string "shebei", limit: 1024
    t.string "sigongshuoming", limit: 1024
  end

  create_table "vendors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", comment: "供应商名称"
    t.string "contact"
    t.string "mobile", comment: "联系人手机"
    t.string "tax_no", comment: "税号"
    t.string "bank", comment: "开户行"
    t.string "bank_account_no", comment: "开户行账号"
    t.string "address", comment: "地址"
    t.string "tel", comment: "电话"
    t.string "fax", comment: "传真"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worker_advances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "worker_id"
    t.integer "employee_id"
    t.decimal "amount", precision: 10, scale: 2
    t.date "advance_on"
    t.integer "status", default: 0
    t.string "note"
    t.integer "worker_settle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worker_hours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "worker_id"
    t.integer "project_id"
    t.integer "work_type", default: 0
    t.date "work_on"
    t.decimal "quantity", precision: 10, scale: 2
    t.decimal "amount", precision: 10, scale: 2
    t.integer "status", default: 0
    t.integer "worker_settle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worker_settles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "worker_id"
    t.decimal "gong", precision: 10
    t.decimal "area", precision: 10
    t.decimal "advance_amount", precision: 10, scale: 2
    t.decimal "work_amount", precision: 10, scale: 2
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 16, comment: "姓名"
    t.string "sex", limit: 8, comment: "性别"
    t.string "mobile", limit: 16, comment: "手机号"
    t.string "idcard_no", limit: 32, comment: "身份证号"
    t.string "idcard_address", limit: 64, comment: "身份证住址"
    t.string "bank", limit: 64, comment: "收款银行"
    t.string "account_no", limit: 64, comment: "银行账号"
    t.string "idcard_front_image", comment: "身份证正面"
    t.string "idcard_back_image", comment: "身份证反面"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
