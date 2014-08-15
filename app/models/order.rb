class Order < ActiveRecord::Base

  belongs_to :table
  
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  accepts_nested_attributes_for :order_items, reject_if: proc { |att| att['item_id'].to_i == 0}, allow_destroy: true

end
