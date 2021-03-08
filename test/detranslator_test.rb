require_relative 'test_helper'

class DetranslatorTest < Minitest::Test
  include Dictionary

  def setup
    @detranslator = Detranslator.new("0.00000.0..0
    ..0.0.0..00.
    ..0.0.0...0.")
  end

  def test_it_exists
    assert_instance_of Detranslator, @detranslator
  end
end
