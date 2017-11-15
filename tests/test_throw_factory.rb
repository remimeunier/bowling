require "../throw/throw_factory"
require "../throw/normal_throw"
require "../throw/spare_throw"
require "../throw/strike_throw"
require "../constants"
require "test/unit"

class TestThrowFactory < Test::Unit::TestCase

  def test_create_throws
    raw_value = %w( 3 7 6 3 10 8 1 10 10 9 0 7 3 4 4 10 9 0)
    expected_result = [
                        a = NormalThrow.new(pins_number: '3'),
                        SpareThrow.new(first_throw: a),
                        NormalThrow.new(pins_number: '6'),
                        NormalThrow.new(pins_number: '3'),
                        StrikeThrow.new(),
                        NormalThrow.new(pins_number: '8'),
                        NormalThrow.new(pins_number: '1'),
                        StrikeThrow.new(),
                        StrikeThrow.new(),
                        NormalThrow.new(pins_number: '9'),
                        NormalThrow.new(pins_number: '0'),
                        b = NormalThrow.new(pins_number: '7'),
                        SpareThrow.new(first_throw: b),
                        NormalThrow.new(pins_number: '4'),
                        NormalThrow.new(pins_number: '4'),
                        StrikeThrow.new(),
                        NormalThrow.new(pins_number: '9'),
                        NormalThrow.new(pins_number: '0')
                      ]
    assert_equal(expected_result.map(&:pins_count), ThrowFactory.create_throws(raw_value).map(&:pins_count))
    assert_equal(expected_result.map(&:to_s), ThrowFactory.create_throws(raw_value).map(&:to_s))
  end

  def test_error_invalid_throw_input
    val = Constants::NUMBER_OF_PINS.to_s
    raw_value = ['3', val, '6', '3', '10', '8', '1', '10', '10', '9', '0', '7', '3', '4', '4', '10', '9', '0']
    assert_raise(ThrowFactory::InvalidScoreInput) {  ThrowFactory.create_throws(raw_value) }
  end
end
