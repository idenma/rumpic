require "csv"
require "./VectorTransformation"




  def rbg_get(x)
 
    r = x.red 
    g = x.green 
    b = x.blue 
	array =[r, g, b]
	
	array.sum / 48
  end

  def vector_transformation(files)
    image = Magick::Image.read(files).first#
    image_columns = image.columns
    image_rows = image.rows 
    pix_col = Array.new(1) { Array.new(64,0) }
    pixel_number = 0
    
    (0..image_rows - 1).each do |rows|
      (0..image_columns - 1).each do |columns|
        pix_col[0][pixel_number] = rbg_get(image.pixel_color(columns,rows))#p rbg_get(image.pixel_color(columns,rows))#
	    pixel_number = pixel_number.next
	  end
    end
    image.destroy!
	pix_col#戻り値
	
  end

#--------------------------------------------
csvdata = []
dir = Dir.glob("img/*")
label = dir.count 
p label


(0..label - 1).each do |img|
  dir = "img/" + img.to_s + ".png"
  csvdata = CSV.open("csv/pixel.csv","a")
  write = vector_transformation(dir)[0]
  write << img.to_s
  csvdata.puts write
end
