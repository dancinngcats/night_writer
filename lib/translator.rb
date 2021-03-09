require_relative 'dictionary'

class Translator
  include Dictionary

  attr_reader :input_text

  def initialize(input_text)
    @input_text = input_text
  end

  def braille_array
    input_text.chars.map do |letter|
      eng_to_braille[letter]
    end.compact
  end

  def all_lines(leftover)
    braille_array.flatten.select.each_with_index { |_, i| i % 3 == (leftover) }.join
  end

  def slicer(number)
    number.slice!(0..79)
  end

  def braille_it
    array = []
    first = all_lines(0)
    second =  all_lines(1)
    third = all_lines(2)

    until first.length == 0
      array << slicer(first) + "\n"
      array << slicer(second) + "\n"
      array << slicer(third) + "\n"
    end
    array.join
  end
end
