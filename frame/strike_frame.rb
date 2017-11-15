require_relative '../constants'

class StrikeFrame

  attr_reader :next_throw
  attr_reader :second_next_throw

  def initialize(args)
    @next_throw =  args.fetch(:next_throw, '')
    @second_next_throw = args.fetch(:second_next_throw, '')
  end

  def get_score
    Constants::NUMBER_OF_PINS + next_throw.pins_count + second_next_throw.pins_count
  end

  def to_s
    "\tX\t"
  end
end
