
class Table
require_relative "position.rb"
require_relative "piece.rb"

	def initialize(row_size, col_size)
		
		@table = Array.new(row_size)

		@white = Array.new(16)
		@black = Array.new(16)
		
		@col_size = col_size

		create_table
		create_pieces
	end

	def create_table

		for i in 0..@table.size-1

			col = Array.new(@col_size)
			for j in 0..col.size-1

				p = Position.new(i, j)
				define_color(p)
				col[j] = p
			
			end

			@table[i] = col
		
		end
	end

	def define_color(position)
		i = position.get_x
		j = position.get_y

		if (i % 2 == 0)
			if (j % 2 == 0)
				position.set_color(" ww ")
			else
				position.set_color(" bb ")
			end

		else
			if (j % 2 == 1)
				position.set_color(" ww ")
			else
				position.set_color(" bb ")
			end
		end
	end


	def get_position(i, j)
		col = @table[i]
		position = col[j]
		return position
	end

	def get_table
		return @table
	end

	def draw_table

		line = ""

		for i in 0..@table.size-1
			col = @table[i]
			for j in 0..col.size-1
		
				position = col[j]

				line = "#{line} | #{position.get_color} |"
				
				if (j == 7)
					puts line
					line = ""
				end
			end
		end
	end

	def create_pieces

		for i in 0..15
			_piece = Piece.new("W")
			@white[i] = _piece
		end

		for i in 0..15
			_piece = Piece.new("B")
			@black[i] = _piece
		end
	end
end