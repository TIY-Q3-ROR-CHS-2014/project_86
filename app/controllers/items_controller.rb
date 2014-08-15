class ItemsController < ApplicationController
  
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :find_menu

  def index
    @items = Item.all 
  end

  def show 
  end

  def new 
    @item= Item.new
    @menu = Menu.find params[:menu_id]
  end

  def create 
    @item = @menu.items.new(item_params)
    if @item.save
      redirect_to menu_path(@menu)
    else
      render :new
    end
  end

  def edit
  end

  def update 
    @item.update_attributes item_params
    redirect_to menu_path(@menu)
  end 

  def destroy 
    @item.delete
    redirect_to menu_path(@menu)
  end

private

  def find_item
    @item = Item.find params[:id]
  end

  def find_menu
    @menu = Menu.find params[:menu_id]
  end

  def item_params
    params.require(:item).permit(:name, :price, :workflowstate, :season, :menu_id)
  end

end
