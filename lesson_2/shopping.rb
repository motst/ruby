cart = {}
total_for_good = {}
loop do
  puts 'Введите наименование товара'
  good = gets.chomp
break if good == 'stop'
  puts 'Введите цену за товар'
  price = gets.chomp.to_f
  puts 'Введите количество товара'
  quantity = gets.chomp.to_f
  cart[good] = { price: price, quantity: quantity }
  total_for_good[good] = price * quantity
end

puts "Ваша корзина #{cart}"
puts "Итоговая сумма за каждый товар #{total_for_good}"
puts "Итоговая сумма всех покупок в корзине #{total_for_good.values.sum}"
