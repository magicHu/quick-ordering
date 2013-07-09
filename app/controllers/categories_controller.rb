class CategoriesController < ApplicationController

  before_filter :find_restaurant

  # GET /categories
  # GET /categories.json
  def index
    @categories = @restaurant.categories

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = @restaurant.categories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = @restaurant.categories.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @restaurant.categories.build(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to restaurant_categories_url(@restaurant), notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = @restaurant.categories.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to restaurant_categories_url(@restaurant), notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = @restaurant.categories.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_categories_url(@restaurant) }
      format.json { head :no_content }
    end
  end

  private 
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
