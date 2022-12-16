require './lib/game'
require './lib/turn'
require './lib/code'

mastermind = Game.new
require 'pry'; binding.pry
mastermind.start_game
