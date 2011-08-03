include ActionDispatch::TestProcess

Factory.define(:ad) do |ad|
  ad.association :ad_position,   :factory => :ad_position
  ad.association :ad_format,   :factory => :ad_format  
  ad.banner_image { fixture_file_upload "assets/ad/banner_image.jpg", 'image/jpeg' }
  ad.link "http://www.example.com"
end
