require "../throw/throw_factory"
require "../throw/normal_throw"
require "../throw/spare_throw"
require "../throw/strike_throw"
require "../frame/frame_factory"
require "../frame/normal_frame"
require "../frame/spare_frame"
require "../frame/strike_frame"
require "../frame/last_frame"
require "test/unit"

class TestFrameFactory < Test::Unit::TestCase

  def test_create_frames
    raw_value = [
                    a = NormalThrow.new(pins_number: '3'),
                    b = SpareThrow.new(first_throw: a),
                    c = NormalThrow.new(pins_number: '6'),
                    d = NormalThrow.new(pins_number: '3'),
                    e = StrikeThrow.new(),
                    f = NormalThrow.new(pins_number: '8'),
                    i = NormalThrow.new(pins_number: '1'),
                    j = StrikeThrow.new(),
                    k = StrikeThrow.new(),
                    l = NormalThrow.new(pins_number: '9'),
                    m = NormalThrow.new(pins_number: '0'),
                    o = NormalThrow.new(pins_number: '7'),
                    q = SpareThrow.new(first_throw: o),
                    r = NormalThrow.new(pins_number: '4'),
                    s = NormalThrow.new(pins_number: '4'),
                    t = StrikeThrow.new(),
                    u = NormalThrow.new(pins_number: '9'),
                    v = NormalThrow.new(pins_number: '0')
                ]
    expected_result = [
                        SpareFrame.new(first_throw: a, next_throw: c),
                        NormalFrame.new(first_throw: c, second_throw: d),
                        StrikeFrame.new(next_throw: f, second_next_throw: i),
                        NormalFrame.new(first_throw: f, second_throw: i),
                        StrikeFrame.new(next_throw: k, second_next_throw: l),
                        StrikeFrame.new(next_throw: l, second_next_throw: m),
                        NormalFrame.new(first_throw: l, second_throw: m),
                        SpareFrame.new(first_throw: o, next_throw: r),
                        NormalFrame.new(first_throw: r, second_throw: s),
                        LastFrame.new(first_throw: t, second_throw: u, third_throw: v),
                      ]
    assert_equal(expected_result.map(&:get_score), FrameFactory.create_frames(raw_value).map(&:get_score))
    assert_equal(expected_result.map(&:to_s), FrameFactory.create_frames(raw_value).map(&:to_s))
  end
end
