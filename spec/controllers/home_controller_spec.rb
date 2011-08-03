require 'spec_helper'

describe HomeController do
  render_views
  
  def wipe_database
    Ad.all.map &:destroy
    AdPosition.all.map &:destroy
    AdFormat.all.map &:destroy
  end  
  
  describe "GET 'test_single_banner'" do
    before(:each) do
      wipe_database
      @ad = Factory(:ad)
    end
    
    it "should render the correct template" do
      get :test_single_banner
      response.should render_template 'test_single_banner'
    end  
    
    it "should have an image tag" do
      get :test_single_banner
      response.should have_selector('img')
    end
  end
end
