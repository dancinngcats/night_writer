require_relative 'test_helper'

class TranslatorTest < Minitest::Test
  include Dictionary

  def setup
    @translator = Translator.new("hello world its me")
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_can_return_eng_to_braille_values
    assert_instance_of Hash, @translator.eng_to_braille
    assert_equal ["0.", "0.", "0."], @translator.eng_to_braille["l"]
  end

  def test_it_can_return_braille_array
    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."], ["..", "..", ".."], [".0", "00", ".0"], ["0.", ".0", "0."], ["0.", "00", "0."], ["0.", "0.", "0."], ["00", ".0", ".."], ["..", "..", ".."], [".0", "0.", ".."], [".0", "00", "0."], [".0", "0.", "0."], ["..", "..", ".."], ["00", "..", "0."], ["0.", ".0", ".."]]

    assert_equal expected, @translator.braille_array
  end

  def test_it_can_only_put_80_characters_per_line
    argument = "0.0.0.0.0....00.0.0.00...0.0.0..000.0.000.000.00.0.0.0.0....00.0.0.00...0.0.0..00"

    assert_equal 81, argument.length

    expected = "0.0.0.0.0....00.0.0.00...0.0.0..000.0.000.000.00.0.0.0.0....00.0.0.00...0.0.0..0"
    assert_equal expected, @translator.slicer(argument)
  end

  def test_it_can_format_the_first_line
    expected = "0.0.0.0.0....00.0.0.00...0.0.0..000."

    assert_equal expected, @translator.all_lines(0)
  end

  def test_it_can_format_the_second_line
    expected = "00.00.0..0..00.0000..0..0.000......0"

    assert_equal expected, @translator.all_lines(1)
  end

  def test_it_can_format_the_third_line
    expected = "....0.0.0....00.0.0.......0.0...0..."

    assert_equal expected, @translator.all_lines(2)
  end

  def test_it_can_return_braille_for_text_file

    expected = "0.0.0.0.0....00.0.0.00...0.0.0..000.
00.00.0..0..00.0000..0..0.000......0
....0.0.0....00.0.0.......0.0...0...
"

    assert_instance_of String, @translator.braille_it
    assert_equal expected, @translator.braille_it
  end
end
