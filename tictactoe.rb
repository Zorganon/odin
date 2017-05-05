require './game.rb'
require './board.rb'

def tictactoe
	askforplay
	game = Game.new
	board = Board.new
	game.play(board)
end

def askforplay
	puts "Hey, want to play a game of tic-tac-toe? Y / N "
	answer = gets.chomp.strip
	if answer.match(/^Y/i)
		puts "good enough for me, let's roll."
		return true
	else
		puts "k bye"
		return false
	end
end

tictactoe
