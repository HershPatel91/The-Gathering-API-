class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :party_id
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
