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

		if (answer.to_i == 1)
			@game = Game.new

			while @game.is_mate == false
				draw
			end
		end
	end

	def draw
		gui = GUITable.new(@control)
		gui.draw_table
		get_answer
	end

	def get_answer
		return gets
	end

	def get_game
		return @game
	end
end


Control.new
