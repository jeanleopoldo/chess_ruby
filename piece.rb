
class Piece
	require_relative 'position.rb'

	def	initialize(color)
		@color = color
		@active = true
	end

	def get_color
		return @color
	end

	def set_symbol
		@symbol = "#{@type}#{@color}"
	end

	def get_type
		return @type
	end

	def set_type(type)
		@type = type
		set_symbol
	end

	def get_symbol
		return @symbol
	end

	def set_active(b)
		@active = b
	end

	def get_active(b)
		return @active
	end
end