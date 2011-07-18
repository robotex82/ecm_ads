class Ecm::Ad < ActiveRecord::Base
  # POSITIONS = %w(advertisement-header advertisement-right-1 advertisement-right-2 advertisement-right-3 advertisement-right-4)
  
  has_attached_file :banner_image
  
  validates :link,     :presence => true
  validates :position, :presence => true
  validates_attachment_presence :banner_image
  
  def link_for_redirect
    unless link.starts_with? 'http://' or link.starts_with? 'https://'
      return "http://#{link}"
    end
    return link
  end
end
