class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :gender
      t.integer :age
      t.string :description
      t.string :picture
 
      t.timestamps
    end
  end
end
