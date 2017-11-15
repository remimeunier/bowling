require_relative 'game_factory'
require_relative 'game_printer'
require_relative 'constants'

file = ARGV[0]

begin
  game = GameFactory.create_game_from_file(file)
rescue Errno::ENOENT
  abort("No such file found : #{file}")
rescue GameFactory::InvalidInputFormat
  abort('Your file format is not valid. Please read the documentation about file format.')
rescue GameFactory::InvalidScoreInput
  abort("One of your score input is invalid. It have to be between 0 and #{Constants::NUMBER_OF_PINS}." )
rescue FrameFactory::InvalidLastFrame
  abort('Your last frame is invalid.')
rescue ThrowFactory::InvalidScoreInput
  abort("One of your frame input is invalid. More than #{Constants::NUMBER_OF_PINS} pins in one frame.")
rescue FrameFactory::InvalidNumberOfThrow
  abort("Invalid number of throw.")
end

GamePrinter.print_game(game)



