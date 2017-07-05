class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.string :title
      t.date :date
      t.string :time
      t.string :description
      t.string :location
      t.float :latitude
      t.float :longitude
      t.string :location_area
      t.integer :capacity
      t.string :image
      t.integer :rating
      t.integer :cover
      t.integer :admin_id

      t.timestamps
    end
  end
end
