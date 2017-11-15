require_relative 'normal_throw'
require_relative 'spare_throw'
require_relative 'strike_throw'
require_relative '../constants'

module ThrowFactory

  class InvalidScoreInput < ::StandardError; end

  # create an array of throws from an array of raw values
  def self.create_throws(raw_values)
    throws = []
    last_normal_throw = false
    raw_values.each do |raw_throw|
      #  strike detected
      if raw_throw == Constants::NUMBER_OF_PINS.to_s && !last_normal_throw
        throws << StrikeThrow.new() #create_throw(raw_throw, last_normal_throw)

      # second throw in one frame detected
      elsif last_normal_throw
        raise InvalidScoreInput unless last_normal_throw.is_next_throw_valid?(raw_throw)
        throws << create_throw(raw_throw, last_normal_throw)
        last_normal_throw = false

      # first normal throw in one frame detected
      else
        last_normal_throw = create_throw(raw_throw, last_normal_throw)
        throws << last_normal_throw
      end
    end
    throws
  end

  private

  def self.create_throw(raw_throw, last_normal_throw)
    if last_normal_throw == false
      NormalThrow.new(pins_number: raw_throw)
    else
      create_throw_with_compare(raw_throw, last_normal_throw)
    end
  end

  def self.create_throw_with_compare(raw_throw, last_normal_throw)
    if last_normal_throw.pins_count + raw_throw.to_i == Constants::NUMBER_OF_PINS
      SpareThrow.new(first_throw: last_normal_throw)
    else
      NormalThrow.new(pins_number: raw_throw)
    end
  end
end
