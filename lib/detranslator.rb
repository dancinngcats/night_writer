require_relative 'dictionary'

class Detranslator
  include Dictionary

  attr_reader :input_text

  def initialize(input_text)
    @input_text = input_text
  end
end
