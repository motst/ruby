calendar = { 1=> 31, 2=> 28, 3=> 31, 4=> 30, 5=> 31, 6=> 30, 7=> 31, 8=> 31, 9=> 30, 10=> 31, 11=> 30, 12=> 31 }

puts 'Введите день'
day = gets.chomp.to_i

puts 'Введите месяц'
month = gets.chomp.to_i

puts 'Введите год'
year = gets.chomp.to_f


if ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)
  calendar[2] = 29
end

result = calendar.select { |key, value| key < month }
puts "Порядковый номер даты #{result.values.sum + day}"
