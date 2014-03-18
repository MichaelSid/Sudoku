require_relative 'cell'

class Grid

	def initialize(puzzle)
		@cells = puzzle.chars.map {|i| Cell.new(i.to_i)}
	end

	def grid_size
		@cells.length
	end


	def solved?
		@cells.all?{|i| i.value!=0}
	end

	attr_accessor :cells


	def solve
		while !self.solved?
			@cells.each do |cell| 
				if !cell.filled_out?
					neighbours(cell)
					cell.solve_cell
				end
			end		
		end
	end

	def rows
		@cells.each_slice(9).to_a
	end

	def columns
		rows.transpose
	end


	def boxes
		rows.map {|row| row.each_slice(3).to_a}.flatten.each_slice(9).to_a
	end


	def neighbours(cell)
		cell.neighbours = ([rows, columns, boxes].map {|z| z.select {|x| x.include?(cell)} }.flatten).map {|x| x.value}
	end


	
end





	
