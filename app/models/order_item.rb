class OrderItem < ActiveRecord::Base
  attr_accessible :food_id, :food_price, :order_id, :quantity

  belongs_to :food
  belongs_to :order

  delegate :name, :to => :food, :prefix => true, :allow_nil => true

  def self.init(food, quantity=1)
    OrderItem.new(:food_id => food.id, :food_price => food.price, :quantity => quantity)
  end

  def total_price
    (food_price || 0) * (quantity || 1)
  end

end
