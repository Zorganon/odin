class Board < Object
	attr_accessor :top, :middle, :bottom

	def initialize
		@grid = [["_","_","_"], ["_","_","_"], ["_","_","_"]]
	end

	def show
		for x in @grid
			puts "_#{x[0]}_|_#{x[1]}_|_#{x[2]}_"
		end
	end

	def newMove(args)
		player = args[:player]
		row = args[:row]
		col = args[:col]
		@grid[row][col] = player
	end

	def hasWinner?
		col_one = [@grid[0][0], @grid[1][0], @grid[2][0]]
		col_two = [@grid[0][1], @grid[1][1], @grid[2][1]]
		col_three = [@grid[0][2], @grid[1][2], @grid[2][2]]
		
		#check for a winning row
		for row in [@grid[0], @grid[1], @grid[2]] do
			return true if winner(row)
		end

		#check for winning column
		for col in [col_one, col_two, col_three]
			return true if winner(col)
		end
		diagonals?
	end

	def diagonals?
		a = [@grid[0][0], @grid[1][1], @grid[2][2]]
		b = [@grid[2][0], @grid[1][1], @grid[0][2]]
		return true if a.all? { |x| x == "X" }
		return true if a.all? { |x| x == "O" }
		return true if b.all? { |x| x == "X" }
		return true if b.all? { |x| x == "O" }
		return false
	end

	def stalemate?
		i = 0
		while i < 2
			return false if @grid[i].any? { |x| x == "_" }
			i += 1
		end
		return true
	end

	def winner(arg_row)
		i = 0
		while i < 3
			return true if @grid[i].all? { |x| x == "X" }
			return true if @grid[i].all? { |x| x == "O" }
			i += 1
		end
		return false
	end

end