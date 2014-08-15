class OrdersController < ApplicationController

  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :find_table
  before_action :find_restaurant

  def index
    @order = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    @items = Item.all
  end

  def create
    @order = Order.create order_params
    if @order.save
      redirect_to restaurant_table_path(@restaurant, @table)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update_attributes order_params
      redirect_to restaurant_table_order_path(@restaurant, @table, @order)
    else
      render :edit
    end
  end

  def destroy
    @order.delete
    redirect_to restaurant_table_path(@restaurant, @table)
  end


private

  def order_params
    params.require(:order).permit(:table_id, {order_items: []})
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

