class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def show
    @menu = Menu.find params[:id]
  end

  def create
    @menu = Menu.create menu_params
    redirect_to menus_path
  end

  def edit
    @menu = Menu.find params[:id]
  end

  def update
    @menu = Menu.find params[:id]
    @menu.update_attributes menu_params
    redirect_to menus_path
  end

  def destroy
    @menu = Menu.find params[:id]
    @menu.delete
    redirect_to menu_path(@menu)
  end

private

  def menu_params
    params.require(:menu).permit(:name, :description)
  end

end
