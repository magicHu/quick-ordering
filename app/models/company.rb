class Company < ActiveRecord::Base
  attr_accessible :address, :name, :telephone

  validates :address, :name, :telephone, :presence => true

  has_many :users
end
