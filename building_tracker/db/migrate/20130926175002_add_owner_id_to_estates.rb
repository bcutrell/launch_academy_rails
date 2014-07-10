class AddOwnerIdToEstates < ActiveRecord::Migration
  def change
    add_column :estates, :owner_id, :integer
  end
end
