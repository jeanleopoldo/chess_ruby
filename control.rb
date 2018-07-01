class Control
require_relative 'guiInit.rb'
require_relative 'guiTable.rb'
require_relative 'game.rb'

	def initialize
		@control = self
		run
	end


	def run

		GUIInit.new

		answer = get_answer

		if (answer.to_i == 1 && answer.length == 2)
			@game = Game.new
			@gui = GUITable.new(@control)

			run_game
		else
			puts "Invalid command"
			run
		end

		
	end

	def run_game
		while !@game.is_mate
			
			draw	
			answer = get_answer.to_s

			if (is_valid(answer))
				from = get_selected_positions(answer)[0]
				to = get_selected_positions(answer)[1]
				puts "AQUI, HEINHÔ"
			else
				puts "Invalid command"
			end
		end
	end

	def get_selected_positions(answer)

		selected_positions = Array.new(2)

		x1 = answer[0].to_i
		y1 = answer[2].to_i

		p1 = @game.get_table.get_position(x1, y1)
		selected_positions[0] = p1

		x2 = answer[5].to_i
		y2 = answer[7].to_i

		p2 = @game.get_table.get_position(x2, y2)
		selected_positions[1] = p2

		return selected_positions

	end

	def is_valid(answer)

		if (answer.length == 9)
			if (answer[1] == "," && answer[6] == ",")
				if (answer[3] == "-" && answer[4] == "-")
					return true
				end
			end
		end

		return false
	end
		
	def draw
		@gui.draw_table
	end

	def get_answer
		return gets
	end

	def get_game
		return @game
	end
end


Control.new
