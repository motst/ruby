alphabet = ('a'..'z').to_a
vowel = ["a", "e", "o", "u", "i"]
result = {}

alphabet.each do |letter|
  if vowel.include?(letter)
    result[letter] = alphabet.index(letter) + 1
  end
end

puts result
