require_relative 'dictionary'

class Detranslator
  include Dictionary

  attr_reader :input_text

  def initialize(input_text)
    @input_text = input_text
  end

  def split_input
    input_text.split()
  end

  def mega_line(leftover)
    split_input.select.with_index{|e,i| (i+1) % 3 == (leftover)}.join
  end

  def mega_first_array
    mega_line(1).chars.each_slice(2).to_a
  end

  def mega_second_array
    mega_line(2).chars.each_slice(2).to_a
  end

  def mega_third_array
    mega_line(0).chars.each_slice(2).to_a
  end

  def rearrangement_by_index
    mega_first_array.map.with_index do |element,index|
      element + mega_second_array[index] + mega_third_array[index]
    end
  end

  def make_it_readable
    rearrangement_by_index.join.scan(/.{2}/).each_slice(3).to_a
  end

  def eng_it
    make_it_readable.map do |braille|
      braille_to_eng[braille]
    end.join
  end
end
