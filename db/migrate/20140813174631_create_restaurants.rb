class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :location
      t.text :description
      t.integer :menu_id
      t.timestamps
    end
  end
end
