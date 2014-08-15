class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    # @restaurant = Restaurant.find params[:id]
  end

  def show 
    @restaurant = Restaurant.find params[:id]
    @menus = Menu.all
  end

  def new 
    @restaurant = Restaurant.new
    @menus = Menu.all
  end

  def create 
    @restaurant = Restaurant.new restaurant_params
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
    @restaurant = Restaurant.find params[:id]
    @menus = Menu.all
  end

  def update 
    @restaurant = Restaurant.find params[:id]
    @restaurant.update_attributes restaurant_params
    redirect_to restaurants_path
  end 

  def destroy 
    @restaurant = Restaurant.find params[:id]
    @restaurant.delete
    redirect_to restaurants_path
  end

private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :location, {menu_ids:[]})
  end

end

