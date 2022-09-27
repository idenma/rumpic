require 'date'
require 'RMagick'
require './VectorTransformation'
require 'numo/narray'
include Magick
include Numo


class ColorChange

	def colorchange(files,*arr)#,Int32.zeros(7,3) 
	
	    arr_lengh = arr.length - 1

		choicecolor = Int32.zeros(arr.length,3) #替えたい色（選択色）
		
		(0..arr_lengh).each do |num|
		  choicecolor[num,(0..2)] = arr[num]
        end
		# choicecolor[0,(0..2)] = [  0,  0,  0]
		# choicecolor[1,(0..2)] = [255,255,255]
		# choicecolor[2,(0..2)] = [127,127,127]
		# choicecolor[3,(0..2)] = [000,000,255]
		# choicecolor[4,(0..2)] = [000,254,000]
		# choicecolor[5,(0..2)] = [253,000,000]
		# choicecolor[6,(0..2)] = [000,255,255]

		
		img = Magick::Image.read(files).first
		img_columns = img.columns
		img_rows = img.rows

		vtimg = VectorTransformation.new

		pixarray = vtimg.vector_transformation(files) #原画色


		pixlng = pixarray.length / 3 #原画のピクセル数
		subarray = Int32.zeros(arr_lengh + 1) #原画色から選択色を引いた数(一色)
		sumpix = Int32.zeros(pixlng)#選ばれた選択色を容れる

		#distance^2 = (r2 - r1)^2 + (g2 - g1)^2 + (b2 - b1)^2 ユークリッド距離
		pixcount = 0
		(0..pixlng - 1).each do |pixnum|
		  (0..arr_lengh).each do |arraynum|  
			subarray[arraynum] = 
			(pixarray[pixnum,(0)] - choicecolor[arraynum,(0)])**2 +
			(pixarray[pixnum,(1)] - choicecolor[arraynum,(1)])**2 +
			(pixarray[pixnum,(2)] - choicecolor[arraynum,(2)])**2 
			subarray[arraynum] = Math.sqrt(subarray[arraynum])
				
		  end
		   puts pixcount
		   sumpix[pixcount] = subarray.min_index
		   pixcount = pixcount.next
		end

		newimg = Image.new(img.columns, img.rows)

		pixcount = 0
		(0..img.rows - 1).each do |rows|
		  (0..img.columns - 1).each do |columns|
			pixel = Pixel.new(choicecolor[sumpix[pixcount],0],choicecolor[sumpix[pixcount],1],choicecolor[sumpix[pixcount],2],0)
			newimg.pixel_color(columns,rows, pixel)
			pixcount = pixcount.next
			puts pixcount
		  end

		end

	#	dt = Date.today
     #   newimg.write("./result/" + dt.year.to_s + "%02d"% dt.month.to_s + "%02d"% dt.day.to_s + ('a'..'z').to_a.shuffle[0..7].join + ".png")
        return newimg,sumpix 
	end

end



	
	