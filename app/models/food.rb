class Food < ActiveRecord::Base
  attr_accessible :category_id, :desc, :name, :price, :restaurant_id

  validates :name, :desc, :price, :presence => true
  validates :name, :uniqueness => { scope: :restaurant_id }

  belongs_to :restaurant
  belongs_to :category
end
