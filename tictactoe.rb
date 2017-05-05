def tictactoe
	wantToPlay? ? startGame : return nil
	game.play
end

def startGame
	game = Game.new
	board = Board.new
end

def wantToPlay?
	puts "Hey, want to play a game of tic-tac-toe? Y / N "
	begin
		answer = gets.chomp.strip
		if answer.match(/^Y/i)
			puts "good enough for me, let's roll."
			return true
		elsif answer.match(/^N/i)
			puts "k bye"
			return false
		else
			puts ".... i'm a computer, not a psychic, be more explicit."
		end
	end
end

class Game < BasicObject
	attr_accessor :player1, :player2, :turn

	def initialize
		@player1 = 'X'
		@player2 = 'O'
		@turn = 1
		@winner = ""
	end

	def play
		begin
			turn
			endGameCheck
		end while @winner.blank?
		puts "Winner is #{@winner}"
	end

	def turn
		current_player = @turn.odd? ? @player1 : @player2
		board.show
		puts "Turn #{@turn}, #{current_player}'s up!"
		board.newMove(getMove)
		@turn += 1
	end

	def getMove
		coordHash = {}
		coordHash[:player] = current_player
		puts "which row do you want to play in?"
		puts "Top, Middle, or Bottom?"
		begin
			rowInput = gets.chomp.strip!
			break if checkRow(rowInput)
		end
		coordHash[:row] = rowInput
		puts "which column? Left, Middle, or Right?"
		begin
			colInput = gets.chomp.strip!
			break if checkCol(colInput)
		end
		coordHash[:col] = colInput
		return coordHash
	end

	def checkRow(argrow)
		row = argrow
		# validates the row and returns a numeric value
		if row.match(/^Top$/i) || row.match(/^t$/i)
			row = "top"
		elsif row.match(/^Middle$/i) || row.match(/^m$/i)
			row = "middle"
		elsif row.match(/^Bottom$/i) || row.match(/^b$/i)
			row = "bottom"
		else
			puts "Bad input.  Type your row like this: 'Top' or 't' for top row."
			return false
		end
		return row
	end

	def checkCol(argcol)
		col = argcol
		#validates the col and returns sanitized value.
		if col.match(/^Left/i) || col.match(/^l$/i)
			col = 0
		elsif col.match(/^Middle/i) || col.match(/^m$/i)
			col = 1
		elsif col.match(/^Bottom/i) || col.match(/^b$/i)
			col = 2
		else
			puts "Bad input. type like, 'Bottom' or 'b' "
			return false
		end
		return col
	end

end

class Board < BasicObject
	def initialize
		@top = ["_","_","_"]
		@middle = ["_","_","_"]
		@bottom = ["_","_","_"]
	end

	def newMove(coordHash)
		player = args[:player]
		row = args[:row]
		col = args[:col]
		case row
		when "top"
			@top[col] = player
		when "middle"
			@middle[col] = player
		when "bottom"
			@bottom[col] = player
		else
			raise "bad row passed to board"
		end
	end

	end

	def show
		showRow(@top)
		showRow(@middle)
		showRow(@bottom)
	end

	def showRow(ary)
		puts "_#{ary[0]}_|_#{ary[1]}_|_#{ary[2]}_"
	end

	def endGameCheck
		#stalemate check
		if stalemate?
			return 
		rowWinner(@top)
		rowWinner(@middle)
		rowWinner(@bottom)

	end

	def stalemate?
		return false if @top.any? { |x| x == "_" }
		return false if @middle.any? { |x| x == "_" }
		return false if @bottom.any? { |x| x == "_" }
		return true
	end

	def rowWinner(argrow)
		#returns the winning player or nil
		argrow.each do |x|

		end
	end

	def colWinner(argrow)
		#returns the winning player or nil
		return if argrow.any? { |x| x == "_" }
	end
end
