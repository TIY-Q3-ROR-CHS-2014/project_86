class ChangeMenuItemIdToItemIdInOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :menu_item_id, :integer
    add_column :order_items, :item_id, :integer
  end
end
