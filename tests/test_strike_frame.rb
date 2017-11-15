require_relative "../throw/normal_throw"
require_relative "../frame/strike_frame"
require_relative '../constants'
require "test/unit"

class TestStrikeFrame < Test::Unit::TestCase

  def setup
    @next_throw = NormalThrow.new(pins_number: '8')
    @second_next_throw = NormalThrow.new(pins_number: '1')
  end

  def test_get_score
    expected_result = Constants::NUMBER_OF_PINS + 8 + 1
    assert_equal(expected_result, StrikeFrame.new(next_throw: @next_throw, second_next_throw: @second_next_throw).get_score)
  end

  def test_to_s
    assert_equal("\tX\t", StrikeFrame.new(next_throw: @next_throw, second_next_throw: @second_next_throw).to_s)
  end
end
