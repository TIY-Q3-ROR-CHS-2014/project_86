class CreateRestaurantMenus < ActiveRecord::Migration
  def change
    create_table :restaurant_menus do |t|
      t.integer :menu_id
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
