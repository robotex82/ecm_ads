class Ecm::Ads::AdPosition < ActiveRecord::Base
  self.abstract_class = true  
  
  validates :name,   :presence => true, :uniqueness => true
end  
