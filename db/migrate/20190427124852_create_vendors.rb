class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :name, comment: "供应商名称"
      t.string :contact, comemnt: "联系人"
      t.string :mobile, comment: "联系人手机"
      t.string :tax_no, comment: "税号"
      t.string :bank, comment: "开户行"
      t.string :bank_account_no, comment: "开户行账号"
      t.string :address, comment: "地址"
      t.string :tel, comment: "电话"
      t.string :fax, comment: "传真"
      t.timestamps
    end
  end
end
