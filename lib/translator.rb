require_relative 'dictionary'

include Dictionary

input = "hooray i made this woooork"
  output = input.chars.map do |letter|
  eng_to_braille.map do |eng, braille|
    if letter == eng
      braille
    end
  end.compact.flatten
end

# add condition that if array.length == 80 then new line

first_line = output.flatten.select.each_with_index { |_, i| i % 3 == 0 }
second_line = output.flatten.select.each_with_index { |_, i| i % 3 == 1 }
third_line = output.flatten.select.each_with_index { |_, i| i % 3 == 2 }

puts first_line.reduce(:+).gsub('"', '')
puts second_line.reduce(:+).gsub('"', '')
puts third_line.reduce(:+).gsub('"', '')
