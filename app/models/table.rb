class Table < ActiveRecord::Base

  belongs_to :restaraunt
  has_many :orders

end
