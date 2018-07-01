class GUITable

	def initialize(control)
		@control = control
		@table = @control.get_game.get_table
		@row = @table.get_table
	end

	def draw_table

		line = ""

		puts " ***************************************************************************************"

		for i in 0..@row.size-1

			col = @row[i]
			for j in 0..col.size-1

				
				position = col[j]

				if position.get_piece == nil
					line = "#{line} | #{position.get_color} |"
				else
					line = "#{line} | #{position.get_piece.get_symbol} |"
				end
				
				if (j == 7)
					puts line
					line = ""
				end
			end
		end
		puts " ***************************************************************************************"
	end


	def show_moves(from, to)
		puts "(#{from.get_x.to_s}, #{from.get_y.to_s}) >> (#{to.get_x.to_s}, #{to.get_y.to_s})"
	end
end