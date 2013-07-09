class Order < ActiveRecord::Base
  attr_accessible :order_no, :restaurant_id, :total_price, :user_id, :order_day, :order_status
  attr_accessor :food_ids

  belongs_to :user
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
end
