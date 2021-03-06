class OrdersController < ApplicationController

  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :find_table
  before_action :find_restaurant

  def index
    @orders = Order.all
  end

  def show
    @items = Item.all
    @order_item = OrderItem.new
  end

  def new
    @order = Order.new
    order_items
    @items = Item.all
  end

  def create
    @order = Order.create order_params

    if @order.save
      redirect_to restaurant_table_order_path(@restaurant, @table, @order)
    else
      render :new
    end
  end

  def edit
    order_items
    @items = Item.all
  end

  def update
    if @order.update_attributes order_params
      redirect_to restaurant_table_path(@restaurant, @table)
    else
      render :edit
    end
  end

  def destroy
    @order.delete
    redirect_to restaurant_table_path(@restaurant, @table)
  end

  def order_items
    @restaurant.menus.each do |menu|
      menu.items.each do |item|
        if !@order.item_ids.include?(item.id)
          @order.order_items.build(item_id: item.id)
        end
      end
    end
  end

private

  def order_params
    params.require(:order).permit(:table_id, {item_ids: []}, order_items_attributes: [:id, :quantity, :mods, :_destroy, :item_id])
  end

  def find_order
    @order = Order.find params[:id]
  end

  def find_table
    @table = Table.find params[:table_id]
  end

  def find_restaurant
    @restaurant = Restaurant.find params[:restaurant_id]
  end

end

