module Ecm
  module Ads
    module AdsHelper
      def display_ad(ad_position_name, ad_format_name, options = {})
        begin
          ad = ::Ad.next_for(ad_position_name, ad_format_name)
        rescue => e
          if Rails.env.production?
            logger.warn e
            return nil
          else
            raise e
          end
           
        end  

        defaults = {
          :image_class => "ad-image-#{ad_position_name} ad-image-#{ad_format_name}",
          :link_class  => "ad-link-#{ad_position_name} ad-link-#{ad_format_name}"
        }
        options = defaults.merge(options)
        
        if ad.banner_image.content_type == "application/x-shockwave-flash"
          asset_tag = swf_tag(ad.banner_image.url, :id => "ad-#{ad.id}", :class => options[:image_class], :width => ad.format_width, :height => ad.format_height, :style => "height: #{ad.format_height}; width: #{ad.format_width};")
        else
          asset_tag = image_tag(ad.banner_image.url, :id => "ad-#{ad.id}", :class => options[:image_class], :style => "height: #{ad.format_height}; width: #{ad.format_width};")
        end
        
        
        ad.update_attributes(:last_impression => Time.zone.now, :impressions => ad.impressions+1)
        return link_to asset_tag, link_ad_path(ad), :target => "_blank"
      end
    end  
  end
end 
 
