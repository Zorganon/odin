def tictactoe
	input if they want to play?
	game = Game.new
	board = Board.new
	
	begin
		board.show

		game.turn

	end unless Game.victory?

end

class Game < BasicObject
	attr_accessor :player1, :player2, :turn

	def initialize
		@player1 = 'X'
		@player2 = 'O'
		@turn = 1
	end

	def victory?

	end

	def turn
		current_player = @turn.odd? ? @player1 : @player2
		board.show
		newMove = self.move
		board.move(move)

		@turn += 1
	end

	def move
		coordinates = []
		puts "which row do you want to play in?"
		puts "Top, Middle, or Bottom?"
		begin
			rowInput = gets.to_s.chomp.strip!
			rowInput.validRow?
		end while !rowInput.validRow?
		coordinates << rowInput
		puts "which column? Left, Middle, or Right?"
		begin
			colInput = gets.to_s.chomp.strip!
			colInput.validCol?
		end while !colInput.validCol?
		coordinates << colInput

		
		board.newMove{}
	end

	def validRow?
		row = self
		if row.match(/^Top$/i) || row.match(/^T$/i)
			self = 1
			return true
		elsif row.match(/^Middle$/i) || row.match(/^m$/i)
			self = 2
			return true
		elsif row.match(/^Bottom$/i) || row.match(/^b$/i)
			self = 3
			return true
		else
			puts "Bad input.  Type your row like this: 'Top' or 't' for top row."
			return false
		end
	end

end

class Board < BasicObject
	def initialize
		@top = [0,0,0]
		@mid = [0,0,0]
		@bottom = [0,0,0]
	end

	def newMove(*args)
		player = args[:player]
		row = args[:row]
		col = args[:col]
		
	end

	addMove()

	def show
		prints self on the console
	end


end
