require 'person'
describe Person do
	
	it 'has no bike' do
		person = Person.new
		expect(person).not_to have_bike
	end

	it 'has a bike' do
		person= Person.new(:bike)
		expect(person).to have_bike
	end

	it 'breaks a bike when he has an accident' do
		the_bike=double :bike
		person= Person.new(the_bike)
		expect(the_bike).to receive(:break!)
		person.crash
	end

	it 'can rent a bike from a station' do
		the_station = double :station
		person = Person.new
		expect(the_station).to receive(:release_bike)
		person.rent_a_bike_from(the_station)
	end

	it 'has a bike once he rents one from a station' do
		the_station = double :station, {:release_bike => :bike}
		person = Person.new
		person.rent_a_bike_from(the_station)
		expect(person).to have_bike
	end

	it 'can return a bike to a station' do
		the_station= double :station
		person = Person.new(:bike)
		expect(the_station).to receive(:store).with(:bike).and_return(nil)
		person.return_a_bike_to(the_station)
	end


	it'has no bikes once he returned to a station' do
		person = Person.new(:bike) 
		the_station = double :station
		expect(the_station).to receive(:store).with(:bike).and_return(nil)
		person.return_a_bike_to(the_station)
		expect(person).not_to have_bike
	end



end