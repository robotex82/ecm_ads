class Ecm::Ads::AdFormat < ActiveRecord::Base
  self.abstract_class = true  
  
  validates :name,   :presence => true, :uniqueness => true
  validates :width,  :presence => true
  validates :height, :presence => true
end
