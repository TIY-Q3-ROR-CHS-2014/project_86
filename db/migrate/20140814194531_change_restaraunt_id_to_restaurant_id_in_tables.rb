class ChangeRestarauntIdToRestaurantIdInTables < ActiveRecord::Migration
  def change
    remove_column :tables, :restaraunt_id, :integer
    add_column :tables, :restaurant_id, :integer
  end
end
