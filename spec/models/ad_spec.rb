require 'spec_helper'

describe Ad do
  before(:each) do
    @valid_attributes = Factory.attributes_for(:ad)
  end
  
  it "should require a banner" do
    @ad = Ad.new(@valid_attributes.merge(:banner_image => nil))
    @ad.should_not be_valid
  end
  
  it "should require a link" do
    @ad = Ad.new(@valid_attributes.merge(:link => nil))
    @ad.should_not be_valid
  end
    
  it "should require a position" do
    @ad = Ad.new(@valid_attributes.merge(:ad_position => nil))
    @ad.should_not be_valid
  end
end
