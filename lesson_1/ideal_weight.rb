puts `Enter you name`
name = gets.chomp
name.capitalize!

puts `Enter your height`
height = gets.chomp.to_f

weight = (height - 110) *1.15

if weight > 0
  puts "#{name},your weight is #{weight}"
else
  puts `Your weight already is optimal`
end

