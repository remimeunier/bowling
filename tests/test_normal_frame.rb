require_relative "../throw/normal_throw"
require_relative "../frame/normal_frame"
require_relative '../constants'
require "test/unit"

class TestNormalFrame < Test::Unit::TestCase

  def setup
    @normal_throw1 = NormalThrow.new(pins_number: '8')
    @normal_throw2 = NormalThrow.new(pins_number: '1')
  end

  def test_get_score
    assert_equal(9, NormalFrame.new(first_throw: @normal_throw1, second_throw: @normal_throw2).get_score)
  end

  def test_to_s
    expected_result = @normal_throw1.to_s + "\t" + @normal_throw2.to_s + "\t"
    assert_equal(expected_result, NormalFrame.new(first_throw: @normal_throw1, second_throw: @normal_throw2).to_s)
  end

   def test_raise_error
     assert_raise(NormalFrame::InvalidThrowError) { NormalFrame.new(first_throw: '', second_throw: @normal_throw2) }
   end
end
