class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.string :title
      t.date :date
      t.string :description
      t.string :location
      t.integer :capacity
      t.string :images
      t.integer :rating
      t.integer :admin_id

      t.timestamps
    end
  end
end
