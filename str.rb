str = "123,456,789"

len = str.length

p len

stri = ""

array  = []


(0..len).each do |num|
  if str[num] == "," or str[num] == nil
    array << stri.to_i
	p array
	stri = ""
  else
    stri << str[num]  
  end	
end

puts array