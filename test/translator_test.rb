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

  # def test_it_can_return_braille_to_end_values
  #   assert_instance_of Hash, @translator.braille_to_eng
  #   assert_equal "l", @translator.braille_to_eng[["0.", "0.", "0."]]
  # end

  def test_it_can_return_braille_array
    expected = [[["0.", "00", ".."]], [["0.", ".0", ".."]], [["0.", "0.", "0."]], [["0.", "0.", "0."]], [["0.", ".0", "0."]], [["..", "..", ".."]], [[".0", "00", ".0"]], [["0.", ".0", "0."]], [["0.", "00", "0."]], [["0.", "0.", "0."]], [["00", ".0", ".."]], [["..", "..", ".."]], [[".0", "0.", ".."]], [[".0", "00", "0."]], [[".0", "0.", "0."]], [["..", "..", ".."]], [["00", "..", "0."]], [["0.", ".0", ".."]]]
    assert_equal expected, @translator.braille_array
  end

  def test_it_can_format_the_first_line
    expected = "0.0.0.0.0....00.0.0.00...0.0.0..000."

    assert_equal expected, @translator.first_line
  end

  def test_it_can_format_the_second_line
    expected = "00.00.0..0..00.0000..0..0.000......0"

    assert_equal expected, @translator.second_line
  end

  def test_it_can_format_the_third_line
    expected = "....0.0.0....00.0.0.......0.0...0..."

    assert_equal expected, @translator.third_line
  end

  def test_it_can_return_braille_for_text_file
    skip
    expected =  "0.0.0.0.0....00.0.0.00...0.0.0..000.
  00.00.0..0..00.0000..0..0.000......0
  ....0.0.0....00.0.0.......0.0...0...
  "
    assert_instance_of String, @translator.braille_it
    assert_equal expected, @translator.braille_it
  end
end
