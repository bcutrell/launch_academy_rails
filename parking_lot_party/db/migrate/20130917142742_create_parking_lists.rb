class CreateParkingLists < ActiveRecord::Migration
  def change
    create_table :parking_lists do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :spot_number
      t.datetime :parked_on

      t.timestamps
    end
  end
end
