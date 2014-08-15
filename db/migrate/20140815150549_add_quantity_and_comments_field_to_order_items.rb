class AddQuantityAndCommentsFieldToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :quantity, :integer
    add_column :order_items, :mods, :string
    add_column :order_items, :temperature, :string
  end
end
