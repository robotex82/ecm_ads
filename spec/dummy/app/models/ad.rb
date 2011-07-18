class Ad < Ecm::Ad
  # Example about how to restrict position to specific strings. The position
  # is added as css class to the image. Use it to style your ad.
  POSITIONS = %w(advertisement-header advertisement-right-1 advertisement-right-2 advertisement-right-3 advertisement-right-4)
  validates :position, :inclusion => { :in => POSITIONS }
end
