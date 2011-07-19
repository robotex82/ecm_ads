module Ecm
  module AdHelper
    def display_ad(position, options = {})
      defaults = {
        :image_class => "ad-image-#{position}",
        :link_class  => "ad-link-#{position}"
      }
      options = defaults.merge(options)
      
      unless ad = ::Ad.where(:position => position).order("last_impression ASC").first
        return position
      end
      
      ad.update_attributes(:last_impression => Time.zone.now, :impressions => ad.impressions+1)
      return link_to image_tag(ad.banner_image.url, :id => "ad-#{ad.id}", :class => options[:image_class]), link_ad_path(ad), :target => "_blank"
    end
  end
end 
 
