include ActionDispatch::TestProcess

Factory.define(:ad) do |ad|
  ad.position "advertisement-header"
  ad.banner_image { fixture_file_upload "assets/ad/banner_image.jpg", 'image/jpeg' }
  ad.link "http://www.example.com"
end
