require 'RMagick'
require './VectorTransformation'
include Magick

files = "./originalimage/colorpic.png"

vt = VectorTransformation.new
puts vt

p vt.vector_transformation(files)
