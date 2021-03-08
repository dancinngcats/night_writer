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

  def mega_first_line
    split_input.select.with_index{|e,i| (i+1) % 3 == 1}.join
  end

  def mega_second_line
    split_input.select.with_index{|e,i| (i+1) % 3 == 2}.join
  end

  def mega_third_line
    split_input.select.with_index{|e,i| (i+1) % 3 == 0}.join
  end

  def mega_first_array
    mega_first_line.chars.each_slice(2).to_a
  end

  def mega_second_array
    mega_second_line.chars.each_slice(2).to_a
  end

  def mega_third_array
    mega_third_line.chars.each_slice(2).to_a
  end
end
