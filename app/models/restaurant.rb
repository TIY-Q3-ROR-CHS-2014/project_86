class Restaurant < ActiveRecord::Base

  has_many :tables, dependent: :destroy
  
  has_many :restaurant_menus
  has_many :menus, through: :restaurant_menus

end
