class TablesController < ApplicationController
  
  before_action :find_table, only: [:show, :edit, :update, :destroy, :transition]
  before_action :find_restaurant

  def index
    @tables = Table.all
  end

  def show
  end

  def new
    @table = Table.new
  end

  def create
    @table = @restaurant.tables.new(table_params)
    if @table.save == true
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @table.update_attributes table_params
      redirect_to restaurant_table_path(@restaurant, @table)
    else
      render :edit
    end
  end

  def destroy
    @table.destroy
    redirect_to restaraunt_path(@restaurant)
  end
 
  def transition
    event = params[:event]+'!'
    @table.send(event.to_sym)
    redirect_to restaurant_table_path(@restaurant, @table)
  end

private

  def find_table
    @table = Table.find params[:id]
  end

  def find_restaurant
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  def table_params
    params.require(:table).permit(:number, :restaurant_id)
  end

end
