require 'spec_helper'

describe EquipmentMiscellaneou do

  before(:each) do
  end

  it "validate required data when create a new Equipment" do
    @equipment = EquipmentMiscellaneou.new
    @equipment.should_not be_valid
    @equipment.brand = "some brand"
    @equipment.inventory_number = "a2"
    @equipment.should_not be_valid
    @equipment.inventory_number = 2233
    @equipment.should be_valid
  end

end
