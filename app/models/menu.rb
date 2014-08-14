class Menu < ActiveRecord::Base

  has_many :items, dependent: :destroy
  has_many :restaraunts, inverse_of: :menu

end
