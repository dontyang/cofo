class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
	    t.string :name
			t.string :address
			t.date :start_on
      t.string :sigonggongyi, limit: 1024
      t.string :area, limit: 1024
      t.string :xianchang, limit: 1024
      t.string :yangban, limit: 1024
      t.string :jihua, limit: 1024
      t.string :shebei, limit: 1024
      t.string :sigongshuoming, limit: 1024
      t.timestamps
    end
  end
end
