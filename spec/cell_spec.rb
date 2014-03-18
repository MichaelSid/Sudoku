require_relative '../lib/cell'
require_relative '../lib/grid'

describe Cell do 

	let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
	let(:grid) {Grid.new(puzzle)}
	let(:cell) {Cell.new(1)}

	it "should initialize the cell with a value" do
		expect(cell.value).to eq(1)
	end

	it "should tell us whether the cell is filled out" do
		expect(cell.filled_out?).to be_true
	end

	it "should tell us whether the cell is not filled out" do
		cell = Cell.new(0)
		expect(cell.filled_out?).to be_false
	end


	it "should find a list of candidates given the neighbours" do
		cell.neighbours = [1,2,3,4,5,6,7,8]
		expect(cell.candidates).to eq([9])
	end

	it "should solve the cell value if there is only 1 candidate left" do
		cell.filled_out? == be_false
		cell.solve_cell
		expect(cell.filled_out?).to be_true
	end



end
