ENV['RACK_ENV'] = 'test'

require './game.rb'
require 'test/unit'
require 'rack/test'

class MasterMindTests < Test::Unit::TestCase
	include Rack::Test::Methods

	def guess_save
		game = Game.new
		guess = Guess.new
	end

	def guess_judge
	end

	def board_saves_new_guess
	end

	def winning_guess_ends_game
	end

end