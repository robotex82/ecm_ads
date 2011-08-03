class AdFormat < Ecm::Ads::AdFormat
  has_many :ads, :dependent => :restrict
  
  def self.find_by_name(name)
    raise ActiveRecord::RecordNotFound, "Couln't find #{self.to_s} with name=#{name}" if (ad_format = where(:name => name).first).nil?
    ad_format
  end  
end
