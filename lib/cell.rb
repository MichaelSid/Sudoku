require_relative '../lib/grid.rb'

class Cell
	def initialize(value)
		@value = value
		@neighbours = []
		@candidates = []
		
	end

	attr_accessor :value, :neighbours, :candidates

	def filled_out?
		value != 0
	end

	def solve_cell
		@value = @candidates.first if (candidates.size == 1 && !filled_out?)
	end


	def candidates
		@candidates = (1..9).to_a - @neighbours
	end

end







