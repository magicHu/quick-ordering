class Order < ActiveRecord::Base
  attr_accessible :restaurant_id, :user_id, :order_no, :order_day, :total_price, :order_status
  attr_accessor :food_ids

  validates :restaurant_id, :user_id, :order_no, :order_day, :total_price, :presence => true

  belongs_to :user
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy

  def self.init(user, restaurant, food_ids)
    order = Order.new(:restaurant_id => restaurant.id, :user_id => user.id, 
      :order_no => Order.generate_order_no, :order_day => Date.current)

    order_items = []
    food_ids.each do |food_id|
      food = restaurant.foods.find(food_id) unless food_id.blank?
      order_items << OrderItem.init(food) if food
    end

    order.order_items = order_items
    #order.total_price = order_items.inject{|sum, order_item| sum + order_item.total_price } unless order_items.empty?
    order
  end

  def total_price
    total_price = 0
    unless order_items.empty?
      order_items.each do |order_item|
        total_price += order_item.total_price
      end
    end
    total_price
  end
  
  private
  def self.generate_order_no
    today = Date.current
    today.strftime("%Y%m%d") + (Order.where(:order_day => today).count + 1).to_s
  end


end
