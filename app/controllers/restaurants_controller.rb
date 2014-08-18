class RestaurantsController < ApplicationController
before_action :all_menus, only: [:show, :edit, :new, :update, :destroy]
before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  
  def index
    @restaurants = Restaurant.all
    # @restaurant = Restaurant.find params[:id]
  end

  def show 
  end

  def new 
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create restaurant_params 
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit
  end

  def update 
    @restaurant.update_attributes restaurant_params
    redirect_to restaurants_path
  end 

  def destroy 
    @restaurant.delete
    redirect_to restaurants_path
  end

private

  def all_menus
    @menus = Menu.all
  end
  def find_restaurant
    @restaurant = Restaurant.find params[:id]
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :location, {menu_ids:[]})
  end

end

