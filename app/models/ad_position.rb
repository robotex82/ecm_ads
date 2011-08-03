class AdPosition < Ecm::Ads::AdPosition
  has_many :ads, :dependent => :restrict
end
