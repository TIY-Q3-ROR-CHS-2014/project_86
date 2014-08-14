class OrdersController < ApplicationController

  before_action :find_order, only: [:show, :edit, :update, :destroy]


  def index
    @order = Order.all
  end

  def show
    @order = Order.all

  end
  def new
    @order = Order.all
  end
  def create
    @order.save
  end
  def edit
    
  end
  def update
    @order.update_attributes order_params
    redirect_to restaurant_path
  end
  def destroy
    @order.deleter
    redirect_to restaurant_path
  end


private
  def order_params
    params.require(:order).permit(:table_id)
    end

  def find_order
  @order = Order.find params[:id]
  end

  def find_table

    
  end
  def find_restaurant
    
  end
end

