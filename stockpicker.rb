def stockpicker(prices)
  temp_max = 0; temp_buy = 0; temp_sell = 0;
  for i in (1...prices.length)
    for j in (0...i)
      span = prices[i] - prices[j]
      temp_max, temp_buy, temp_sell = span, j, i if span > temp_max
    end
  end
  puts "Profit would be #{temp_max}"
  return [temp_buy, temp_sell]
end

print stockpicker([17,3,6,9,15,8,6,1,10])
puts
