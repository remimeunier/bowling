require "../throw/spare_throw"
require "../throw/normal_throw"
require "../throw/strike_throw"
require "test/unit"

class TestspareThrow < Test::Unit::TestCase

  def setup
    @normal_throw = NormalThrow.new(pins_number: '8')
  end

  def test_pins_count
    @normal_throw.pins_number
    assert_equal(2, SpareThrow.new(first_throw: @normal_throw).pins_count)
  end

  def test_to_s
    assert_equal('/', SpareThrow.new(first_throw: @normal_throw).to_s)
  end

  def test_error_invalid_first_throw
    strike = StrikeThrow.new()
    assert_raise(SpareThrow::InvalidFirstThrowError) { SpareThrow.new(first_throw: strike) }
  end
end
