module Ecm
  module Ads
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Generates the locale files"
             
        source_root File.expand_path('../../../../../../config/locales', __FILE__)
        
        def generate_locales
          copy_file "ecm.ads.en.yml", "config/locales/ecm.ads.en.yml"
          copy_file "ecm.ads.de.yml", "config/locales/ecm.ads.de.yml"
        end      
      end
    end
  end
end        
