class Menu < ActiveRecord::Base

  has_many :menu_items, dependent: :destroy
  has_many :restaraunts

end
