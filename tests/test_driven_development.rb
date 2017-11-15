require_relative '../game_factory'
require_relative '../throw/throw_factory'
require "test/unit"

class TestDrivenDevelopment < Test::Unit::TestCase

  def test_simple_imput
    expected_result1 = [20, 39, 48, 66, 74, 84, 90, 120, 148, 167]
    expected_result2 = [16, 25, 44, 53, 82, 101, 110, 124, 132, 151]
    game = GameFactory.create_game_from_file('../example/example.txt')
    assert_equal(expected_result1, game.players[0].cumulative_score)
    assert_equal(expected_result2, game.players[1].cumulative_score)
  end

  def test_perfect_score
    expected_result1 = [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]
    game = GameFactory.create_game_from_file('../example/example2.txt')
    assert_equal(expected_result1, game.players[0].cumulative_score)
  end

  def test_zero_score
    expected_result1 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    game = GameFactory.create_game_from_file('../example/example3.txt')
    assert_equal(expected_result1, game.players[0].cumulative_score)
    assert_equal(expected_result1, game.players[1].cumulative_score)
  end

  def test_error_with_negatif_pins_number
    assert_raise(GameFactory::InvalidScoreInput) { GameFactory.create_game_from_file('../example/error_example/example4.txt') }
  end

  def test_error_with_wrong_format_input
    assert_raise(GameFactory::InvalidInputFormat) { GameFactory.create_game_from_file('../example/error_example/example5.txt') }
  end

  def test_error_with_two_throw_in_the_same_frame_with_more_than_max_number_of_pin
    assert_raise(ThrowFactory::InvalidScoreInput) { GameFactory.create_game_from_file('../example/error_example/example6.txt') }
  end

  def test_error_too_much_throw
    assert_raise(FrameFactory::InvalidNumberOfThrow) { GameFactory.create_game_from_file('../example/error_example/example7.txt') }
  end
  def test_not_enough_throw
    assert_raise(FrameFactory::InvalidNumberOfThrow) { GameFactory.create_game_from_file('../example/error_example/example8.txt') }
  end
end
