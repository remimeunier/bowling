require_relative "../constants"

class NormalThrow

  class InvalidPinsNumberError < ::StandardError
    def to_s
      "A Normal throw was created with more than #{Constants::NUMBER_OF_PINS} pins"
    end
  end

  attr_reader :pins_number

  def initialize(args)
    @pins_number =  args.fetch(:pins_number, '')
    raise InvalidPinsNumberError unless @pins_number.to_i < Constants::NUMBER_OF_PINS
  end

  def pins_count
    pins_number == 'F' ? 0 : pins_number.to_i
  end

  def to_s
    pins_number
  end

  def is_next_throw_valid?(raw_next_throw)
    pins_count + raw_next_throw.to_i <= Constants::NUMBER_OF_PINS
  end
end
