puts "Введите коэффициент a"
a = gets.chomp.to_f

puts "Введите коэффициент b"
b = gets.chomp.to_f

puts "Введите коэффициент c"
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d < 0
  puts "Дискриминант #{d}, корней нет"
elsif d == 0
  puts "Дискриминант #{d}, корень равен #{-1 * b / (2 * a)}"
else
  puts "Дискриминант #{d}, первый корень равен #{(-1 * b - Math.sqrt(d)) / (2 * a)}, второй корень равен #{(-1 * b + Math.sqrt(d)) / (2 * a)}"
end
