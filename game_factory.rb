require_relative 'throw/throw_factory'
require_relative 'frame/frame_factory'
require_relative 'player'
require_relative 'game'
require_relative 'constants'

module GameFactory

  class InvalidScoreInput < ::StandardError; end
  class InvalidInputFormat < ::StandardError; end

  def self.create_game_from_file(file)
    players = []
    file_parser(file).each do |player, raw_values|
      throws = ThrowFactory.create_throws(raw_values)
      frames = FrameFactory.create_frames(throws)
      players.push(Player.new(name: player, frames: frames))
    end
    Game.new(players: players)
  end

  private

  # return { player1_name => [raw_throw1, raw_throw2 ... ],
  #          player2_name => [raw_throw1, raw_throw2 ... ] }
  def self.file_parser(file)
    game = {}
    File.open(file).each do |line|
      input = line.split(' ')
      raise InvalidInputFormat unless input.length == 2
      raise InvalidScoreInput unless is_valid_score?(input[1])
      player = input[0]
      pins   = input[1]
      if game.key?(player)
        game[player] = game[player] + [pins]
      else
        game.merge!({player => [pins]})
      end
    end
    game
  end

  def self.is_valid_score?(val)
    (0..Constants::NUMBER_OF_PINS).include?(val.to_i)
  end
end
