class Ecm::Ads::Ad < ActiveRecord::Base
  self.abstract_class = true  
  
  has_attached_file :banner_image
  validates_attachment_presence :banner_image
  
  validates :link,           :presence => true
  validates :ad_position_id, :presence => true
  validates :ad_format_id,   :presence => true  

  
  def link_for_redirect
    unless link.starts_with? 'http://' or link.starts_with? 'https://'
      return "http://#{link}"
    end
    return link
  end
end
