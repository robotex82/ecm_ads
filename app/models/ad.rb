class Ad < Ecm::Ads::Ad
  belongs_to :ad_position
  belongs_to :ad_format
  
  def format_height
    ad_format.height
  end  
  
  def format_width
    ad_format.width
  end
  
  def format_name
    ad_format.name
  end
  
  def position_name
    ad_position.name
  end    
  
  def self.next_for(ad_position_name, ad_format_name)

    ad_position = AdPosition.find_by_name(ad_position_name)
    ad_format = AdFormat.find_by_name(ad_format_name)   
    raise ActiveRecord::RecordNotFound, "Couln't find #{self.to_s} with position=#{ad_position_name} and format=#{ad_format_name}" if (ad = where(:ad_position_id => ad_position).where(:ad_format_id => ad_format).order("last_impression ASC").first).nil?

    ad
  end
end
