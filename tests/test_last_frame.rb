require_relative "../throw/normal_throw"
require_relative "../throw/strike_throw"
require_relative "../throw/spare_throw"
require_relative "../frame/last_frame"
require_relative '../constants'
require "test/unit"

class TestLastFrame < Test::Unit::TestCase

  def setup
    @first_throw = NormalThrow.new(pins_number: '8')
    @second_throw = SpareThrow.new(first_throw: @first_throw)
    @third_throw = StrikeThrow.new()
  end

  def test_get_score
    expected_result = Constants::NUMBER_OF_PINS + Constants::NUMBER_OF_PINS
    assert_equal(expected_result, LastFrame.new(first_throw: @first_throw, second_throw: @second_throw, third_throw: @third_throw ).get_score)
  end

  def test_to_s
    expected_result = @first_throw.to_s + "\t" + @second_throw.to_s + "\t" + @third_throw.to_s
    assert_equal(expected_result, LastFrame.new(first_throw: @first_throw, second_throw: @second_throw, third_throw: @third_throw ).to_s)
  end

  def test_empty_throw_creation
    assert_equal("EmptyThrow", LastFrame.new(first_throw: @first_throw, second_throw: @second_throw, third_throw: nil ).third_throw.class.name)
  end

  def test_is_valid?
    assert_equal(true, LastFrame.new(first_throw: @first_throw, second_throw: @second_throw, third_throw: @third_throw ).is_valid?)
    assert_equal(false, LastFrame.new(first_throw: @first_throw, second_throw: @first_throw, third_throw: @third_throw ).is_valid?)
  end
end
