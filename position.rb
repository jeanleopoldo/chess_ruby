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