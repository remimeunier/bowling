require "../throw/normal_throw"
require_relative '../constants'
require "test/unit"

class TestNormalThrow < Test::Unit::TestCase

  def test_pins_count_with_number
    assert_equal(8, NormalThrow.new(pins_number: '8').pins_count)
  end

  def test_pins_count_with_fool
    assert_equal(0, NormalThrow.new(pins_number: 'F').pins_count)
  end

  def test_to_s
    assert_equal('F', NormalThrow.new(pins_number: 'F').to_s)
    assert_equal('9', NormalThrow.new(pins_number: '9').to_s)
  end

  def test_raise_error
    assert_raise(NormalThrow::InvalidPinsNumberError) { NormalThrow.new(pins_number: Constants::NUMBER_OF_PINS) }
  end

  def test_is_next_throw_valid
    assert_equal(false, NormalThrow.new(pins_number: 'F').is_next_throw_valid?((Constants::NUMBER_OF_PINS + 1).to_s))
  end
end
