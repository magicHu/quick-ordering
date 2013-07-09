class OrdersController < ApplicationController
  before_filter :find_restaurant

  def index
    @orders = @restaurant.orders.all
  end

  def new
    @order = Order.new
  end

  private
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
