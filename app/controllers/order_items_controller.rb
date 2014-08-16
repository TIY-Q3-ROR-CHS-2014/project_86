class OrderItemsController < ApplicationController
  before_action :find_order_item, only: [:show, :edit, :update, :destroy]
  before_action :find_order
  before_action :find_table
  before_action :find_restaurant

  def create
    @order_item = @order.order_items.create order_item_params
    redirect_to restaurant_table_order_path(@restaurant, @table, @order)
  end

  def destroy
    @order_item.destroy
    redirect_to restaurant_table_order_path(@restaurant, @table, @order)
  end


private

  def find_restaurant
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  def find_table
    @table = Table.find params[:table_id]
  end

  def find_order
    @order = Order.find params[:order_id]
  end

  def find_order_item
    @order_item = OrderItem.find params[:id]
  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :mods, :temperature)
  end
end
