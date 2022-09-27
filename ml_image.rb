require 'RMagick'
require './MLImage'

ml_image = MLImage.read("1.png").first
p ml_image
p ml_image.columns
p ml_image.rows 
ml_image.image_array = 1
p ml_image.image_array

