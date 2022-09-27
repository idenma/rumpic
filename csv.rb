require "csv"
CSV.foreach("drink.csv") do |row|
    # 行に対する処理
    p row
end


require "csv"
data_list = CSV.read("drink.csv")
p data_list

data_list = CSV.read('drink.csv').map{|row| row[0, 2]}
p data_list