require 'rumale'
require "csv"
require 'numo/narray'
require './VectorTransformation'
require 'RMagick'
include Numo
#機械学習読み込み
csvdata = CSV.table("csv/pixel.csv", headers: true)#, headers: true
p csvdata
row = csvdata[:row_count].count
pixel_samples = Int32.zeros(row + 1,64)
pixel_labels = Int32.new(row + 1).seq
pixel_samples = csvdata
puts pixel_samples


# stri = ""
# num = 0
# (0..row -1).each do |first_number|
  # puts num
  # (0..63).each do |second_number|
  
       # print pixel_samples[first_number][second_number]# = data_list[num].to_i#(data_list[first_number][second_number].to_i)
       # print ","
  # end
  # num = num.next
  # puts ""
# end

