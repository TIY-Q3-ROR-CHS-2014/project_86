class Menu < ActiveRecord::Base

  has_many :items, dependent: :destroy
  
  has_many :restaurant_menus
  has_many :restaurants, through: :restaurant_menus


end
