require_relative 'test_helper'

class DictionaryTest < Minitest::Test

  def setup
    @dictionary = Dictionary.new
  end

  def test_it_exists
    assert_instance_of Dictionary, @dictionary
  end

  def test_it_can_return_eng_to_braille_values
    assert_instance_of Hash, @dictionary.eng_to_braille
    assert_equal "0.0.0.", @dictionary.eng_to_braille["l"]
  end

  def test_it_can_return_braille_to_end_values
    assert_instance_of Hash, @dictionary.braille_to_eng
    assert_equal "m", @dictionary.braille_to_eng["00..0."]
  end
end
