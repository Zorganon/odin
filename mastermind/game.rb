# Rules:

# answer is randomly chosen
# player is always guesser
# 4 pegs per guess
# 6 colors
# duplicates are allowed
# Blk, Wht, Gre, Blu, Red, Yel
# Colors is an array.

# require 'sinatra'
# require 'json'

# ######## sinatra stuff ##########
# set :port, 8080
# set :environment, :production
# ######

def masterMind
	game = Game.new
	board = Board.new
	endCond = game.turnLoop(board)
	

end

class Game < Object
	attr_accessor :turn
	attr_reader :player_role, :answer, :colors

	def initialize
		@colors = [Blk, Wht, Gre, Blu, Red, Yel]
		@turn = 1
		@player_role = "guesser"
		@answer = {0 => @colors.sample, 1 => @colors.sample, 2 => @colors.sample, 3 => @colors.sample}
	end

############ Core Game Loop
	def turnLoop(board)
		while @turn < 13
			board.show
			guess = Guess.new(getGuess)
			guess.judge(@answer)
			board.addGuess(guess)
			if guess.correct?
				endCond = "You Won!"
				return endCond
			@turn += 1
		end
		if 
	end
########

	def getGuess
		new_guess = nil
		begin
			puts "type your guess using the following numbers for corresponding colors"
			puts "1 for Black, 2 for White, 3 for Green, 4 for Blue, 5 for Red, 6 for Yellow"
			puts "Ex: Black, Yellow, Green, Black  would be entered as 1631"
			num = gets.chomp.split('')
			if num.all? { |x| x == '1' || x == '2' || x == '3' || x == '4'|| x == '5' || x == '6' }
				new_guess = num
			end
		end while new_guess.nil?
		new_guess
	end
end

class Board < Object
	@guesses = {}

	def addGuess(guess)
	end

	def printBoard
	end

end



class Guess < Object
	attr_accessor :hint_pegs, :pegs

	def initialize(arry)
		@hint_pegs = { black => 0, white => 0 }
		@pegs = {}
		arry.each_with_index { |a, i| @pegs[i.to_sym] => a }
		
	end

	def show
		puts "_#{@pegs[:0]}_|_#{@pegs[:1]}_|_#{@pegs[:2]}_|_#{@pegs[:3]}_| Black: #{hint_pegs[:black]}, White: #{hint_pegs[:white]}"
	end

	def judge(answer)
		#PEGS IS A HASH, ANSWERS ARE ARRAY
		@pegs.each do |(k, peg)|
			if peg == answer[k]
				@hint_pegs[:black] += 1
			end
			if answer.include?(peg)
				answer.delete_at(answer.find_index(peg))
				@hint_pegs[:white] += 1
			end
		end
	end

	def correct?
		@hint_pegs[:black] == 4
	end

end


classes:
	guess
		.submit
		.show
		.judge

	Game
		.start
		.turnLoop
		.getGuess


tests:

comp randomly creates sequence

player types guesses into cli

guess is validated and then judged

	the game re-prints the board with the new guess and pegs



Guesses could be stored in an array.  Guess objects don't initially'
	have a peg param, but are given one by the pegpusher

