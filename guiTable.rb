class GUITable

	def initialize(control)
		@control = control
		@table = @control.get_game.get_table
		@row = @table.get_table
	end

	def draw_table(round)

		line = ""

		puts "*****************************************************************************************"

		for i in 0..@row.size-1

			col = @row[i]
			for j in 0..col.size-1

				if j == 0
					line = "#{i}"
				end
				
				position = col[j]

				if position.get_piece == nil
					line = "#{line} | #{position.get_color} |"
				else
					line = "#{line} | #{position.get_piece.get_symbol} |"
				end
				
				if (j == 7)
					puts line
					line = "#{i}"
				end
			end
		end
		puts "******0**********1**********2**********3**********4**********5**********6**********7*****"

		puts show_turn(round)
	end

	def show_turn(round)
		if round % 2 == 0
			return "White plays"
		end

		if round % 2 == 1
			return "Black plays"
		end
	end

	def show_moves(from, to)
		_piece = from.get_piece
		puts "[#{_piece.get_symbol}]->(#{from.get_x.to_s}, #{from.get_y.to_s}) >> (#{to.get_x.to_s}, #{to.get_y.to_s})"
	end
end