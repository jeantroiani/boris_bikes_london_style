require 'bike'
	
describe Bike  do

	it 'is not broken at the beginning' do
	 	the_bike=Bike.new
	 	expect(the_bike).to be_working
	end

	it 'is not working' do
		the_bike=Bike.new
		the_bike.break!
		expect(the_bike).not_to be_working
		end
	it 'can be fixed'do
		the_bike=Bike.new(false)
		the_bike.fix!
		expect(the_bike).to be_working
 	end

end