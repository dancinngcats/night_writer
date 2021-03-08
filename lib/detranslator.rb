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
end
