class Ecm::Ads::AdPosition < ActiveRecord::Base
  self.abstract_class = true  
  
  validates :name,   :presence => true, :uniqueness => true
  #####
  def self.find_by_name(name)
    raise ActiveRecord::RecordNotFound, "Couldn't find #{self.to_s} with name=#{name}" if (ad_position = where(:name => name).first).nil?
    ad_position
  end      
end  
