class Category < ActiveRecord::Base
  attr_accessible :name, :restaurant_id

  validates :name, :presence => true, :uniqueness => true

  belongs_to :restaurant
  has_many :foods
end
