
class Game < Object
	attr_accessor :player1, :player2, :turn, :winner

	def initialize
		@turn = 1
		@winner = false
		@current_player = "X"
	end

#----------------the main shabang--------
	def play(board)
			board.show
		begin
			@current_player = @turn.odd? ? "X" : "O"
			turn(board)
			board.show
		end while !endCheck(board)
		puts "Winner is #{@current_player}"
	end
#------------------------

	def turn(board)
		move = {}
		move[:player] = @current_player
		puts "Turn #{@turn}, #{@current_player}'s up!"
		move[:row] = getRow
		move[:col] = getCol
		board.newMove(move)
		@turn += 1
	end

	def endCheck(board)
		return true if board.stalemate?
		board.hasWinner?
	end

	def getRow
		#get and check Row
		puts "which row do you want to play in?"
		begin
			puts "Top, Middle, or Bottom?"
			rowInput = gets.chomp
		end while !checkRow(rowInput)
		return checkRow(rowInput)
	end

	def getCol
		#get and check Column
		begin
			puts "which column? Left, Middle, or Right?"
			colInput = gets.chomp
		end while !checkCol(colInput)
		return checkCol(colInput)
	end

	def checkRow(argrow)
		row = argrow.to_s
		# validates the row and returns a numeric value
		if row.match(/^Top$/i) || row.match(/^t$/i)
			row = 0
		elsif row.match(/^Middle$/i) || row.match(/^m$/i)
			row = 1
		elsif row.match(/^Bottom$/i) || row.match(/^b$/i)
			row = 2
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
		elsif col.match(/^Right/i) || col.match(/^r$/i)
			col = 2
		else
			puts "Bad input. type like, 'Bottom' or 'b' "
			return false
		end
		return col
	end
end