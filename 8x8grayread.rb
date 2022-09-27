require 'RMagick'
require 'numo/narray'
include Numo

def rbg_get(x)
 
  r = x.red / 4096
  g = x.green / 4096
  b = x.blue / 4096
  
  rgb =  r#[r , g, b ]
end

files = "8x8gray.png"

  image = Magick::Image.read(files).first
  image_columns = image.columns
  image_rows = image.rows 
  pix_col = Array.new(1) { Array.new(64,0) }
  pix_col_narray = Int32.zeros(1.64) #配列を多次元配列にしてそこに座標を入れるべきでは？
  pixel_number = 0
  color_number = 0

  # p pix_col#[0,0]
  
  # pix =  rbg_get(image.pixel_color(0,0))
  # p pix
  (0..image_rows - 1).each do |rows|
    (0..image_columns - 1).each do |columns|
      pix_col[0][pixel_number] = rbg_get(image.pixel_color(columns,rows))#p rbg_get(image.pixel_color(columns,rows))#
	  pixel_number = pixel_number.next
	end
  end
  
   # pix_col[0][0] = pix#.map {|pixel|p pixel}
    p pix_col
	
	pix_col_narray = pix_col
	p pix_col_narray
	