
class Game
	require_relative 'table.rb'

	def initialize
		@table = Table.new(ROW_SIZE, COL_SIZE)
		@round = 0
		@mate = false
	end

	def make_move(from, to)
		@round = @round + 1

		_piece = from.get_piece

		#if (piece != nil)
			#if to.get_piece == nil
				#make_move(piece)

		#end
		
	end

	def get_table
		return @table
	end

	def is_mate
		return @mate
	end
end

ROW_SIZE = 8
COL_SIZE = 8