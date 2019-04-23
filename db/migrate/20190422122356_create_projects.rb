class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
	    t.string :name, comment: "项目名称"
			t.string :address, comment: "项目地址"
			t.date :start_on
			t.date :end_on
			t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
