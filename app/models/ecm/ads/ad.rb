class Ecm::Ads::Ad < ActiveRecord::Base
  self.abstract_class = true  
  
  has_attached_file :banner_image
  validates_attachment_presence :banner_image
  
  validates :link,           :presence => true, :unless => :is_flash_banner?
  validates :ad_position_id, :presence => true
  validates :ad_format_id,   :presence => true  

  
  def link_for_redirect
    unless link.starts_with? 'http://' or link.starts_with? 'https://'
      return "http://#{link}"
    end
    return link
  end
  
  ##### 
  def is_flash_banner?
    banner_image.content_type == "application/x-shockwave-flash" rescue false
  end
  
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
    raise ActiveRecord::RecordNotFound, "Couldn't find #{self.to_s} with position=#{ad_position_name} and format=#{ad_format_name}" if (ad = where(:ad_position_id => ad_position).where(:ad_format_id => ad_format).order("last_impression ASC").first).nil?

    ad
  end
end
