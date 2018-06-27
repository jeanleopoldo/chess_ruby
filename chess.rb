

class Piece

	


end



class Position
	def initialize(x, y)
		@pos_x = x
		@pos_y = y
		@piece
	end

	def set_color(color)
		@color = color
	end

	def get_color
		return @color
	end


	def get_piece
		return @piece
	end

	def set_piece(piece)
		@piece = piece
	end

	def get_x
		return @pos_x
	end

	def get_y
		return @pos_y
	end

	def get_color
		return @color
	end

end

class Table


	def initialize(row_size, col_size)
		@row = Array.new(col_size)
		@col_size = col_size
		create_table
		draw_table
	end

	def create_table

		for i in 0..@row.size-1

			col = Array.new(@col_size)
			for j in 0..col.size-1

				p = Position.new(i, j)
				define_color(p)
				col[j] = p
			
			end

			@row[i] = col
		
		end
	end


	def define_color(position)
		i = position.get_x
		j = position.get_y

		if (i % 2 == 0)
			if (j % 2 == 0)
				position.set_color(" w ")
			else
				position.set_color(" b ")
			end

		else
			if (j % 2 == 1)
				position.set_color(" w ")
			else
				position.set_color(" b ")
			end
		end
	end


	def get_position(i, j)
		col = @row[i]
		position = col[j]
		return position
	end

	def draw_table

		line = ""

		for i in 0..@row.size-1
			col = @row[i]
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
end

ROW_SIZE = 8
COL_SIZE = 8
Table.new(ROW_SIZE, COL_SIZE)

