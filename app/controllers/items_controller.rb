class ItemsController < ApplicationController
def index
  @items = Item.all 
  @menu = Menu.find params[:menu_id]
  # @restaurant = Restaurant.find params[:id]
end

def show 
  @item = Item.find params[:id]
  @menu = Menu.find params[:menu_id]
  @menus = Menu.all
end

def new 
  @item= Item.new
end

def create 
  @item = Item.new item_params
  @item.save
end

def edit
  @item = Item.find params[:id]
end

def update 
  @item = Item.find params[:id]
  @item.update_attributes item_params
  redirect_to menu_items_path
end 

def destroy 
  @item = Item.find params [:id]
  @item.delete
  redirect_to menu_items_path
end

private
def item_params
  params.require(:item).permit(:name, :price, :workflowstate, :season, :menu_id)
end


end
