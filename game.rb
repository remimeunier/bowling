class Game

  attr_reader :players

  def initialize(args)
    @players =  args.fetch(:players, '')
  end

  def to_s
    players.map(&:to_s).join("\n")
  end
end
