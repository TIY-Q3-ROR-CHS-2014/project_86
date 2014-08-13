class Restaurant < ActiveRecord::Base

  has_many :tables, dependent: :destroy
  belongs_to :menu

end
