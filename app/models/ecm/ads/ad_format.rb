class Ecm::Ads::AdFormat < ActiveRecord::Base
  self.abstract_class = true  
  
  validates :name,   :presence => true, :uniqueness => true
  validates :width,  :presence => true
  validates :height, :presence => true
  
  #####
  def self.find_by_name(name)
    raise ActiveRecord::RecordNotFound, "Couldn't find #{self.to_s} with name=#{name}" if (ad_format = where(:name => name).first).nil?
    ad_format
  end  
end
