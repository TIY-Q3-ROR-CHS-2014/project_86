class RestaurantsController < ApplicationController

def index
  @restaurants = Restaurant.all
  # @restaurant = Restaurant.find params[:id]
end

def show 
  @restaurant = Restaurant.find params[:id]
  @menu = @restaurant.menu
end

def new 
  @restaurant = Restaurant.new
end

def create 
  @restaurant = Restaurant.new restaurant_params
  @restaurant.save

def edit
  @restuarant = Restaurant.find params[:id]
end

def update 
  @restaurant = Restaurant.find params[:id]
  @restaurant.update_attributes restaurant_params
  redirect_to restaurants_path
end 

def destroy 
  @restaurant = Restaurant.find params [:id]
  @restaurant.delete
  redirect_to restuarants_path
end

private
def restaurant_params
  params.require(:restaurant).permit(:name, :description, :location, :menu_id)
end
end









end
