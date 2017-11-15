require_relative "../throw/normal_throw"
require_relative "../throw/strike_throw"
require_relative "../frame/spare_frame"
require_relative '../constants'
require "test/unit"

class TestSpareFrame < Test::Unit::TestCase

  def setup
    @first_throw = NormalThrow.new(pins_number: '8')
    @next_throw = StrikeThrow.new()
  end

  def test_get_score
    expected_result = Constants::NUMBER_OF_PINS + Constants::NUMBER_OF_PINS
    assert_equal(expected_result, SpareFrame.new(first_throw: @first_throw, next_throw: @next_throw).get_score)
  end

  def test_to_s
    expected_result = @first_throw.to_s + "\t/\t"
    assert_equal(expected_result, SpareFrame.new(first_throw: @first_throw, next_throw: @next_throw).to_s)
  end

  def test_error_invalid_first_throw
    strike = StrikeThrow.new()
    assert_raise(SpareFrame::InvalidFirstThrowError) { SpareFrame.new(first_throw: strike, next_throw: @next_throw) }
  end
end
