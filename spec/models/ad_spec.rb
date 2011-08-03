require 'spec_helper'

describe Ad do
  def wipe_database
    Ad.all.map &:destroy
    AdPosition.all.map &:destroy
    AdFormat.all.map &:destroy
  end  
  
  before(:each) do
    wipe_database
    @ad = Factory(:ad)
  end
  
  describe "with flash banner_image" do
    before(:each) do
      wipe_database
      @flash_ad = Factory(:flash_ad)
    end
    
    it "should not require a link" do
      @flash_ad.link = nil
      @flash_ad.should be_valid
    end
  end
  
  it "should be valid with correct parameters" do
    @ad.should be_valid
  end  
  
  it "should require a banner" do
    @ad.banner_image = nil
    @ad.should_not be_valid
  end
  
  it "should require a link" do
    @ad.link = nil
    @ad.should_not be_valid
  end
    
  it "should require a position" do
    @ad.ad_position = nil
    @ad.should_not be_valid
  end
end
