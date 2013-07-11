require 'spec_helper'

describe Order do
  it "is not valid without fields " do
    Order.new.should_not be_valid
  end
end
