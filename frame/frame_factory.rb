require_relative 'normal_frame'
require_relative 'spare_frame'
require_relative 'strike_frame'
require_relative 'last_frame'
require_relative '../constants'

module FrameFactory

  class InvalidNumberOfThrow < ::StandardError; end
  class InvalidLastFrame < ::StandardError; end
  class SpareThrowAtTheBeginningOfFrameError < ::StandardError
    def to_s
      "a spare throw was detected at he beginning of a frame"
    end
  end

  # create an array of frames from an array of throws
  def self.create_frames(throws)
    frames = Array.new(Constants::NUMBER_OF_FRAMES - 1)
    throws_counter = 0
    first_throw_of_frame = false
    frames.each_with_index do |frame, index|

      # Not enought throws, the game is not finish
      raise InvalidNumberOfThrow if throws[throws_counter].nil?

      # strike_frame detected
      if throws[throws_counter].is_a?(StrikeThrow)
        frames[index] = create_strike_frame(throws[throws_counter], throws[throws_counter + 1], throws[throws_counter + 2])
        throws_counter = throws_counter + 1

      # normal_frame or spare_frame
      elsif throws[throws_counter].is_a?(NormalThrow)
        frames[index] = create_frame(throws[throws_counter], throws[throws_counter + 1], throws[throws_counter + 2])
        # because we create the frame out of the next two throws
        throws_counter = throws_counter + 2
      else
        #spare detected at the first throw of a frame
        raise SpareThrowAtTheBeginningOfFrameError
      end
    end

    # last frame
    last_frames = create_last_frame(throws[throws_counter], throws[throws_counter + 1], throws[throws_counter + 2])
    raise InvalidLastFrame unless last_frames.is_valid?
    # too many throw
    raise InvalidNumberOfThrow unless last_frames.contain_last_throw_of_game?(throws.last)
    frames << last_frames
  end

  private

  def self.create_strike_frame(current_throw, next_throw, second_next_throw)
    StrikeFrame.new(next_throw: next_throw, second_next_throw: second_next_throw)
  end

  def self.create_frame(current_throw, next_throw, second_next_throw)
    if next_throw.is_a?(SpareThrow)
      SpareFrame.new(first_throw: current_throw, next_throw: second_next_throw)
    else
      NormalFrame.new(first_throw: current_throw, second_throw: next_throw)
    end
  end

  def self.create_last_frame(current_throw, next_throw, second_next_throw)
    LastFrame.new(first_throw: current_throw, second_throw: next_throw, third_throw: second_next_throw)
  end
end
