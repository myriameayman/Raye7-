class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  attr_accessible :quantity, :total_price, :unit_price
end
