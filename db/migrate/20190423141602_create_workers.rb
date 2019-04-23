class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.string :name, limit: 16, comment: "姓名"
			t.string :sex, limit: 8, comment: "性别"
			t.string :mobile, limit: 16, comment: "手机号"
      t.string :idcard_no, limit: 32, comment: "身份证号"
			t.string :idcard_address, limit: 64, comment: "身份证住址"
			t.string :bank, limit: 64, comment: "收款银行"
			t.string :account_no, limit: 64, comment: "银行账号"
      t.string :idcard_front_image, comment: "身份证正面"
			t.string :idcard_back_image, comment: "身份证反面"
      t.timestamps
    end
  end
end
