
class Game
	require_relative 'table.rb'

	def initialize
		@table = Table.new(ROW_SIZE, COL_SIZE)
		@round = 0
		@mate = false
	end

	def get_table
		return @table
	end

	def is_mate
		return @mate
	end


	def create_pieces
		@white = Array.new(16)
		@black = Array.new(16)


		for i in 0..15
			piece = Piece.new("W")
			white[i] = piece
		end

		for i in 0..15
			piece = Piece.new("B")
			black[i] = piece
		end
	end
end

ROW_SIZE = 8
COL_SIZE = 8