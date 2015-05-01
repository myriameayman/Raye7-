class Order < ActiveRecord::Base
  belongs_to :order_status
  attr_accessible :shipping, :subtotal, :tax, :total
end
