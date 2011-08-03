include ActionDispatch::TestProcess

Factory.define(:ad) do |ad|
  # ad.association :ad_position,   :factory => :ad_position
  # ad.association :ad_format,   :factory => :ad_format  
  ad.association :ad_position
  ad.association :ad_format
  ad.banner_image { fixture_file_upload "assets/ad/banner_image.jpg", 'image/jpeg' }
  ad.link "http://www.example.com"
end

Factory.define(:flash_ad, :parent => :ad) do |ad|
#  # ad.association :ad_position,   :factory => :ad_position
#  # ad.association :ad_format,   :factory => :ad_format  
#  ad.association :ad_position
#  ad.association :ad_format
  ad.banner_image { fixture_file_upload "assets/ad/flash_banner_image.swf", 'application/x-shockwave-flash' }
#  ad.link "http://www.example.com"
end
