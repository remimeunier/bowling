require_relative '../throw/empty_throw'
class LastFrame

  attr_reader :first_throw, :second_throw, :third_throw

  def initialize(args)
    @first_throw = args.fetch(:first_throw, '')
    @second_throw  = args.fetch(:second_throw, '')
    @third_throw  = args.fetch(:third_throw, nil) || EmptyThrow.new()
  end

  def get_score
    first_throw.pins_count + second_throw.pins_count +  third_throw.pins_count
  end

  def to_s
    first_throw.to_s + "\t" + second_throw.to_s + "\t" + third_throw.to_s
  end

  def is_valid?
    if first_throw.is_a?(StrikeThrow) || second_throw.is_a?(SpareThrow)
      !third_throw.is_a?(EmptyThrow)
    else
      third_throw.is_a?(EmptyThrow)
    end
  end

  def contain_last_throw_of_game?(last_throw)
    third_throw.is_a?(EmptyThrow) ? (second_throw == last_throw ): (third_throw == last_throw)
  end
end
