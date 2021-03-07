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
end
