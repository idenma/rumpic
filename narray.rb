require 'numo/narray'
include Numo

aarray = Int32.new(5).seq + 1


p aarray

barray = Int32.zeros(2,5)

p barray

# (0..4).each do |x|
  # (0..4).each do |y|
     # aarray [x,y]  = barray [x,y]
  # end
# end

(0..4).each {|x| barray[0,x] = aarray[x] }



p barray