class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.string :name
      t.date :date
      t.string :location
      t.string :description
      t.integer :ratings
      
      t.timestamps
    end
  end
end
