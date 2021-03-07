require_relative 'dictionary'

class Translator
  include Dictionary

  attr_reader :input_text

  def initialize(input_text)
    @input_text = input_text
  end

  def braille_array
    input_text.chars.map do |letter|
      eng_to_braille.map do |eng, braille|
        if letter == eng
          braille
        end
      end.compact.flatten
    end
  end

  def first_line
    braille_array.flatten.select.each_with_index { |_, i| i % 3 == 0 }
  end

  def second_line
    braille_array.flatten.select.each_with_index { |_, i| i % 3 == 1 }
  end

  def third_line
    braille_array.flatten.select.each_with_index { |_, i| i % 3 == 2 }
  end

  def braille_it
    new_array = []
    loop do first_line.length <= 80
      new_array << first_line.reduce(:+) + "\n" + second_line.reduce(:+) + "\n" + third_line.reduce(:+) + "\n"
      break
    end
    new_array.join
  end

end
