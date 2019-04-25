class CreateWorkerAdvances < ActiveRecord::Migration[5.1]
  def change
    create_table :worker_advances do |t|
	    t.integer :worker_id
			t.integer :employee_id
			t.decimal :amount, precision: 10, scale: 2
			t.date :advance_on
			t.integer :status, default: 0
			t.string :note
      t.integer :worker_settle_id
      t.timestamps
    end
  end
end
