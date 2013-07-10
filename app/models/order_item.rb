class OrderItem < ActiveRecord::Base
  attr_accessible :food_id, :food_name, :food_price, :order_id, :quantity, :total_price

  belongs_to :food
  belongs_to :order
end
