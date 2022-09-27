require 'rumale'
require "csv"
require 'numo/narray'
require './VectorTransformation'
require 'RMagick'
include Numo
#機械学習読み込み


csvdata = CSV.read("csv/pixel.csv", headers: true)
p csvdata
row = csvdata[:row_count].count
pixel_samples = Int32.zeros(row + 1,64)
pixel_labels = Int32.new(row + 1).seq
pixel_samples = csvdata

# (0..row -1 ).each do |first_number|
  # (0..63).each do |second_number|
       # pixel_samples[first_number, second_number] = (csvdata[first_number][second_number])
       # print pixel_samples[first_number, second_number]
	   # print ":"
  # end
  # print "\n"
# end

#-----------------


#pixel_samples.map {|num| csvdata = num}

# pixel_samples.map do |num|
 # print num
 # print ":"
# end
#-----------------

encoder = Rumale::Preprocessing::LabelEncoder.new
labels = encoder.fit_transform(pixel_labels) 
#-----------------



# 決定木
model = Rumale::Tree::DecisionTreeClassifier.new(random_seed: 1)

model.fit(pixel_samples, labels)

#機械学習準備完了

vector_transformation = VectorTransformation.new #画データを数字データにするクラス



files = "1vt.png"


samples =vector_transformation.vector_transformation(files)
p samples
p model.predict(samples)
