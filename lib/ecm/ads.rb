module Ecm
  module Ads
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::Ads::AdsHelper)
      end  
    end
  end  
end
