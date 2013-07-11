class OrdersController < ApplicationController
  before_filter :find_restaurant

  def index
    @orders = @restaurant.orders.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = @restaurant.orders.find(params[:id])
  end

  def create
    begin
      @order = Order.init(current_user, @restaurant, params[:order][:food_ids])

      @order.save!
      redirect_to action: 'index'

    rescue Exception => e
      binding.pry
      logger.error e
      render action: 'new'
    end
  end

  private
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
