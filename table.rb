
class Table
require_relative "position.rb"
require_relative "piece.rb"

	def initialize(row_size, col_size)
		
		@table = Array.new(row_size)

		@white = Array.new(16)
		@black = Array.new(16)
		
		@col_size = col_size
		run

	end

	def run
		create_table
		create_white_pieces
		create_black_pieces
		set_white_pieces
		set_black_pieces
	end

	def set_white_pieces

		_index = 0
		for i in 0..1
			for j in 0..7
				_piece = @white[_index]
				_position = get_position(i, j)
				_position.set_piece(_piece)
				_index = _index + 1
			end
		end
	end

	def set_black_pieces
		_index = 0

		for i in 6..7
			for j in 0..7
				_piece = @black[_index]
				_position = get_position(i, j)
				_position.set_piece(_piece)
				_index = _index + 1

			end
		end

	end

	def create_table

		for i in 0..@table.size-1

			_col = Array.new(@col_size)
			for j in 0.._col.size-1

				_p = Position.new(i, j)
				define_color(_p)
				_col[j] = _p
			
			end

			@table[i] = _col
		
		end
	end

	def define_color(position)
		
		i = position.get_x
		j = position.get_y

		if (i % 2 == 0)
			if (j % 2 == 0)
				position.set_color(" wwwww")
			else
				position.set_color(" bbbbb")
			end

		else
			if (j % 2 == 1)
				position.set_color(" wwwww")
			else
				position.set_color(" bbbbb")
			end
		end
	end


	def get_position(i, j)
		
		_col = @table[i]
		_position = _col[j]
		return _position
	
	end

	def get_table
		return @table
	end

	def draw_table

		_line = ""

		for i in 0..@table.size-1

			_col = @table[i]
			
			for j in 0.._col.size-1
		
				_position = _col[j]

				if _position.get_piece == nil
					_line = "#{line} | #{_position.get_color} |"
				else
					_line = "#{line} | #{_position.get_piece.get_symbol} |"
				end
				if (j == 7)
			
					puts _line
					_line = ""
			
				end
			end
		end
	end

	def create_white_pieces

		for i in 0..15
			
			_piece = Piece.new(" W")
			@white[i] = _piece
		
		end

		for i in 8..15
			_piece = @white[i]
			_piece.set_symbol(" Pa ")
		end

		_piece = @white[0]
		_piece.set_symbol(" Ro ")
		_piece = @white[1]
		_piece.set_symbol(" Kn ")
		_piece = @white[2]
		_piece.set_symbol(" Bi ")
		_piece = @white[3]
		_piece.set_symbol(" Ki ")
		_piece = @white[4]
		_piece.set_symbol(" Qu ")
		_piece = @white[5]
		_piece.set_symbol(" Bi ")
		_piece = @white[6]
		_piece.set_symbol(" Kn ")
		_piece = @white[7]
		_piece.set_symbol(" Ro ")

	end

	def create_black_pieces

		for i in 0..15
			
			_piece = Piece.new(" B")
			@black[i] = _piece
		
		end

		for i in 0..7
			_piece = @black[i]
			_piece.set_symbol(" Pa ")
		end

		_piece = @black[8]
		_piece.set_symbol(" Ro ")
		_piece = @black[9]
		_piece.set_symbol(" Kn ")
		_piece = @black[10]
		_piece.set_symbol(" Bi ")
		_piece = @black[11]
		_piece.set_symbol(" Ki ")
		_piece = @black[12]
		_piece.set_symbol(" Qu ")
		_piece = @black[13]
		_piece.set_symbol(" Bi ")
		_piece = @black[14]
		_piece.set_symbol(" Kn ")
		_piece = @black[15]
		_piece.set_symbol(" Ro ")
		
	end
end