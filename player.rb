class Player

  attr_reader :frames, :name

  def initialize(args)
    @name   =  args.fetch(:name, '')
    @frames =  args.fetch(:frames, '')
  end

  def to_s
    "#{@name}\nPinfalls\t" + frames.map(&:to_s).join('') + "\n" + "Score\t\t" + cumulative_score.join("\t\t")
  end

  def cumulative_score
    # the inject function do an accumulative sum
    frames.map(&:get_score).inject([]) { |x, y| x + [(x.last || 0) + y] }
  end
end
