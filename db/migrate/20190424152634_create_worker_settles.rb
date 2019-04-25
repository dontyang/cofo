class CreateWorkerSettles < ActiveRecord::Migration[5.1]
  def change
    create_table :worker_settles do |t|
      t.integer :worker_id
      t.decimal :gong
      t.decimal :area
      t.decimal :advance_amount, precision: 10, scale: 2
      t.decimal :work_amount, precision: 10, scale: 2
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
