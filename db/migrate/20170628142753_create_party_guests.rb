class CreatePartyGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :party_guests do |t|
      t.integer :guest_id
      t.integer :party_id
      t.string :status

      t.timestamps
    end
  end
end
