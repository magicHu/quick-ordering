class Restaurant < ActiveRecord::Base
  attr_accessible :address, :desc, :name, :telephone

  has_many :categories
  has_many :foods
end
