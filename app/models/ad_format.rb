class AdFormat < Ecm::Ads::AdFormat
  has_many :ads, :dependent => :restrict
end
