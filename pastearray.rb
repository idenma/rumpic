require 'RMagick'
include Magick

count = Dir.glob("./img/*").count

pastepicarray = []

(1..count).each do |num|
  files = "./img/" + num.to_s + ".png"
    image = Image.read(files).first
    pastepicarray  << image
   
end


puts pastepicarray