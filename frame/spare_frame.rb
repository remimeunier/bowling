require_relative '../constants'

class SpareFrame

  class InvalidFirstThrowError < ::StandardError
    def to_s
      "a not adequat SpareFrame was created"
    end
  end

  attr_reader :first_throw, :next_throw

  def initialize(args)
    @first_throw = args.fetch(:first_throw, '')
    @next_throw  = args.fetch(:next_throw, '')
    raise InvalidFirstThrowError if !@first_throw.is_a?(NormalThrow)
  end

  def get_score
    Constants::NUMBER_OF_PINS + next_throw.pins_count
  end

  def to_s
    first_throw.to_s + "\t/\t"
  end
end
