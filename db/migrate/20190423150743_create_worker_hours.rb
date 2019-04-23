class CreateWorkerHours < ActiveRecord::Migration[5.1]
  def change
    create_table :worker_hours do |t|
      t.integer :worker_id
      t.integer :project_id
      t.integer :work_type, default: 0
      t.date :work_on
      t.decimal :quantity, precision: 10, scale: 2
      t.decimal :amount, precision: 10, scale: 2
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
