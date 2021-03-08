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
      end.compact
    end
  end

  def first_line
    braille_array.flatten.select.each_with_index { |_, i| i % 3 == 0 }.join
  end

  def second_line
    braille_array.flatten.select.each_with_index { |_, i| i % 3 == 1 }.join
  end

  def third_line
    braille_array.flatten.select.each_with_index { |_, i| i % 3 == 2 }.join
  end

  def braille_it
    array = []
    first = first_line
    second = second_line
    third = third_line

    until first.length == 0
      array << first.slice!(0..79) + "\n"
      array << second.slice!(0..79)  + "\n"
      array << third.slice!(0..79) + "\n"
    end
    array.join
  end
end
