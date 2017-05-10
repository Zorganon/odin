# Rules:

# answer is randomly chosen
# player is always guesser
# 4 pegs per guess
# 6 colors
# duplicates are allowed
# Blk, Wht, Gre, Blu, Red, Yel
# Colors is an array.

require 'sinatra'
require 'json'

def masterMind

	game.start




end



class Game < Object
	attr_accessor :turn, 
	attr_reader :player_role, :answer, :colors



	def initialize
		@colors = [Blk, Wht, Gre, Blu, Red, Yel]
		@turn = 1
		@player_role = "guesser"
		@answer = [@colors.sample, @colors.sample, @colors.sample, @colors.sample]
	end

	def start
		#initializes answer and launches guess loop?

	end

	def turnLoop
		while #guess incorrect
			#print the board
			#ask for a guess
			#save the guess
			#judge the guess
			

end



class Guess < Object
	attr_accessor :hint_pegs, :pegs

	def initialize
		@hint_pegs = { black => 0, white => 0 }
		@pegs = { 0 => "", 1 => "", 2 => "", 3 => ""}
		
	end

	def show
		puts "_#{@pegs[0]}_|_#{@pegs[1]}_|_#{@pegs[2]}_|_#{@pegs[3]}_| Black: #{hint_pegs[:black]}, White: #{hint_pegs[:white]}"
	end

	def judge(answer)
		#PEGS IS A HASH, ANSWERS ARE ARRAY
		@pegs.each.with_index do |peg, i|
			if peg == answer[i]
				@hint_pegs[:black] += 1
			end
			if answer.include?(peg)
				ind = answer.find_index(peg)
				answer.delete_at(ind)
				@hint_pegs[:white] += 1
			end
		end
	end

	end

	def correct?
end


classes:
	guess
		.clean
		.submit
		.show
		.addPegs

	pegpusher
		.judge
		.pushpegs - adds pegs to guess?
		
	aiguesser
		.guess


tests:

comp randomly creates sequence

player types guesses into cli

guess is validated and then judged

	the game re-prints the board with the new guess and pegs



Guesses could be stored in an array.  Guess objects don't initially'
	have a peg param, but are given one by the pegpusher

