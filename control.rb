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

				if _from.get_piece != nil
					@gui.show_moves(_from, _to)
					@game.make_move(_from, _to)
				else
					puts "No piece at this position"
				end
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
		_selected_positions[1] = _p2

		return _selected_positions

	end

	def is_valid(answer)

		if (answer.length == 9)
			if (answer[1] == "," && answer[6] == ",")
				if (answer[3] == "-" && answer[4] == "-")
					return true
				end
			end
		else
			define_answer_length_message(answer)
		end
		return false
	end

	def define_answer_length_message(answer)
		if answer.length < 9
			puts "Input seems to be smaller than it's supposed to be."
		else
			puts "Input seems to be bigger than it's supposed to be."
		end
	end
		
	def draw
		round = @game.get_round
		@gui.draw_table(round)
	end

	def get_answer
		return gets
	end

	def get_game
		return @game
	end
end


Control.new
