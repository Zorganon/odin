class Board < BasicObject
	attr_accessor :top, :middle, :bottom

	def initialize
		@grid = [["_","_","_"], ["_","_","_"], ["_","_","_"]]
	end

	def show
		for x in @grid
			puts "_#{x[0]}_|_#{x[1]}_|_#{x[2]}_"
		end
	end

	def newMove(coordHash)
		player = args[:player]
		row = args[:row]
		col = args[:col]
		@grid[row,col] = player
	end

	def hasWinner?
		col_one = [@grid[0,0], @grid[0,1], @grid[0,2]]
		col_two = [@grid[1,0], @grid[1,1], @grid[1,2]]
		col_three = [@grid[2,0], @grid[2,1], @grid[2,2]]
		
		#check for a winning row
		for row in @grid do
			return true if winner(row)
		end
		for col in [col_one, col_two, col_three]
			return true if winner(col)
		end
		return true if diagonals?
		return false
	end

	def diagonals?
		a = [@grid[0,0], @grid[1,1], @grid[2,2]]
		b = [@grid[2,0], @grid[1,1], @grid[0,2]]
		return true if a.all? { |x| x == "X" || x == "O" }
		return true if b.all? { |x| x == "X" || x == "O" }
		return false
	end

	def stalemate?
		for row in @grid
			return false if row.any? { |x| x == "_" }
		end
		return true
	end

	def winner(arg_row)
		#expecting an array
		if arg_row.all? { |x| x == "X" || x == "O" }
			return true
		else
			return false
		end
	end

end