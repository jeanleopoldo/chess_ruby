
class Game
	require_relative 'table.rb'

	def initialize
		@table = Table.new(ROW_SIZE, COL_SIZE)
		@round = 0
		@mate = false
	end

	def make_move(from, to)
		_piece = from.get_piece

		if is_turn(_piece)
			if @table.move(from, to)
				add_round
			else
				puts "Something went wrong"
			end
		end
	end

	def is_turn(piece)

		if @round % 2 == 0 && piece.get_color == " W" 
			return true
		end
		
		if @round % 2 == 1 && piece.get_color == " B"
			return true
		end

		return false

	end

	def add_round
		@round = @round + 1
	end

	def get_table
		return @table
	end

	def is_mate
		return @mate
	end

	def get_round
		return @round
	end
end

ROW_SIZE = 8
COL_SIZE = 8