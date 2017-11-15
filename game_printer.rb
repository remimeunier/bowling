require_relative 'constants'
module GamePrinter

  def self.print_game(game)
    print print_frame_number + "\n" + game.to_s + "\n"
  end

  private

  def self.print_frame_number
    str = 'Frame '
    (1..Constants::NUMBER_OF_FRAMES).each do |count|
      str = str + "\t\t#{count}"
    end
    str
  end
end

