require_relative "../constants"
class SpareThrow

  class InvalidFirstThrowError < ::StandardError
    def to_s
      "A spare throw was initialize with with a non NormalThrow as a first Throw"
    end
  end

  attr_reader :first_throw

  def initialize(args)
    @first_throw =  args.fetch(:first_throw, '')
    raise InvalidFirstThrowError unless first_throw.is_a?(NormalThrow)
  end

  def pins_count
    Constants::NUMBER_OF_PINS - first_throw.pins_count
  end

  def to_s
    "/"
  end
end
