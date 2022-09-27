require 'RMagick'


class MLImage #< Magick::Image

  attr_accessor :image_array 
  
  def image_array=(num)
    @image_array = num
  end
  
  
  
end