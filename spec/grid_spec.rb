require './lib/grid.rb'

describe Grid do 
	context "initialization" do
		let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
		let(:grid) {Grid.new(puzzle)}

		it "should have 81 cells" do
			expect(grid.grid_size).to eq(81)
		end
		

		it "should convert the puzzle string into an array " do 
			expect(grid.cells.class).to eq(Array)
		end

		it "should have an unsolved first cell" do
			expect(grid.cells[0].value).to eq(0)
			expect(grid.cells[1].value).to eq(1)
		end


		it "should be able to tell if the grid is solved" do
			expect(grid.solved?).to be_false 
		end

		it "should solve the puzzle" do
			expect(grid.solved?).to be_false
			grid.solve
			expect(grid.solved?).to be_true
			expect(grid.cells.map{|x|x.value}.join).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
		end

		it "should separate the puzzle array into 9 separate arrays (rows)" do
			grid.cells
			expect(grid.rows.count).to eq(9)
		end

		it "should turn the 9 separate arrays (rows) into 9 separate columns" do
			expect(grid.columns.count).to eq(9)
		end

		it "should give us 9 separate arrays (boxes)" do
			expect(grid.boxes.count).to eq(9)
		end

		it "should give us a list of neighbours given the cell" do
			x = grid.neighbours(grid.cells.first)
			expect(x.count).to eq(27)
			print x
		end






	

	end
end
