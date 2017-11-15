class NormalFrame

  class InvalidThrowError < ::StandardError
    def to_s
      "a not adequat NormalFrame was created"
    end
  end

  attr_reader :first_throw, :second_throw

  def initialize(args)
    @first_throw =  args.fetch(:first_throw, '')
    @second_throw =  args.fetch(:second_throw, '')
    raise InvalidThrowError if !@first_throw.is_a?(NormalThrow) || !@first_throw.is_a?(NormalThrow)
  end

  def get_score
    first_throw.pins_count + second_throw.pins_count
  end

  def to_s
    first_throw.to_s + "\t" + second_throw.to_s + "\t"
  end
end
