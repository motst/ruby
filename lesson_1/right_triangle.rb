puts `Введите сторону а`
a = gets.chomp.to_f

puts `Введите сторону b`
b = gets.chomp.to_f

puts `Введите сторону c`
c = gets.chomp.to_f

if (a == b) && (b == c)
  puts `Треугольник равносторонний`
elsif (a == b) || (b == c) || (a == c)
  puts `Треугольник равнобедренный`
elsif (a**2 == b**2 + c **2) || (b**2 == a**2 + c**2) || (c**2 == a**2 + b**2)
  puts `Треугольник прямоугольный`
end
