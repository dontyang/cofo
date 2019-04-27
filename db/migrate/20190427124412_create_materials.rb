class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.integer :project_id
      t.integer :vendor_id
      t.string :name
      t.decimal :quantity, precision: 10, scale: 2
      t.string :unit
      t.decimal :amount, precision: 10, scale: 2
      t.date :purchase_on
      t.string :note
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
