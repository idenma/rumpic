require 'RMagick'
require 'numo/narray'
include Numo
include Magick

dot = "./originalimage/1dot.png"

array = Image.read(dot).first

arraycolor = array.pixel_color(0,0)


puts array.export_pixels(0,0,1,1,map="RGB")

# colorarray = [arraycolor.red  ,arraycolor.green  ,arraycolor.blue ]

# puts colorarray



 # def rbgcolor_get(pixel)#arrayは配列
   # pixelcolor = pixel.pixel_color(0,0)
   # colorarray = [arraycolor.red  ,arraycolor.green  ,arraycolor.blue ]
   # colorarray 
 # end
  