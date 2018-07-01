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

		_answer = get_answer

		if (_answer.to_i == 1 && _answer.length == 2)
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
			_answer = get_answer.to_s

			if (is_valid(_answer))
				
				_from = get_selected_positions(_answer)[0]
				_to = get_selected_positions(_answer)[1]
				@gui.show_moves(_from, _to)
				@game.make_move(_from, _to)
			else
				puts "Invalid command"
			end
		end
	end

	def get_selected_positions(answer)

		_selected_positions = Array.new(2)

		_x1 = answer[0].to_i
		_y1 = answer[2].to_i

		_p1 = @game.get_table.get_position(_x1, _y1)
		_selected_positions[0] = _p1

		_x2 = answer[5].to_i
		_y2 = answer[7].to_i

		_p2 = @game.get_table.get_position(_x2, _y2)
		_slected_positions[1] = _p2

		return _selected_positions

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
