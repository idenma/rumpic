require 'date'
require 'RMagick'
require './VectorTransformation'
require 'numo/narray'
require './ColorChange'
include Magick
include Numo

color = []
color[0] = [0,0,0]
color[1] = [255,255,255]
color[2] = [127,255,255]
color[3] = [255,127,127]
color[4] = [127,255,127]
color[5] = [127,127,255]

files = "./originalimage/colorpic.png"

color_change = ColorChange. new
image = color_change.colorchange(files,color[0],color[1],color[2],color[3],color[4],color[5])

# image.sumpix









#dt = Date.today
#image.write("./result/" + dt.year.to_s + "%02d"% dt.month.to_s + "%02d"% dt.day.to_s + ('a'..'z').to_a.shuffle[0..7].join + ".png")
