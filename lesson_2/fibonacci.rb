array = []
array[0, 1] = [0, 1]

i = array[-1]
loop do
  i += array[-2]
  array.push(i)
break if i > 100
end

array.delete_if {|x| x > 100}
puts array
