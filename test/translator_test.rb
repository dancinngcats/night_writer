require_relative 'test_helper'

class TranslatorTest < Minitest::Test

  def setup
    @translator = Translator.new("hello world its me")
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_can_return_braille_array
    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."], ["..", "..", ".."], [".0", "00", ".0"], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."], ["..", "..", ".."], [".0", "0.", ".."], [".0", "00", "0."], [".0", "0.", "0."], ["..", "..", ".."], ["00", "..", "0."], ["0.", ".0", ".."]]
    assert_equal expected, @translator.braille_array
  end
end
